#!/usr/bin/env python3
"""
Fathom Meeting Notes Formatter

Reads Fathom's raw text export, strips markdown links and bold markup,
reorganizes sections, and writes a clean markdown file.

Usage: format_fathom.py <input.txt> <output.md>

Expected input shape:
  ## Meeting Purpose
  [Goal text wrapped in a Fathom timestamp link](url)

  ## Key Takeaways
    - [**Phrase** more text](url)

  ## Topics
  ### Subheader
    - [**Bold prefix:** detail](url)
        - [nested detail](url)

  ## Next Steps
    - [**Person:** action](url)
"""
import re
import sys
from pathlib import Path


def strip_markdown_link(text):
    """[text](url) becomes text. Non-greedy on the inner brackets."""
    return re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'\1', text)


def strip_bold(text):
    """Remove ** markers, keep the enclosed text."""
    return text.replace('**', '')


def extract_first_url(text):
    """Pull the first URL from a markdown link. Strip Fathom timestamp param."""
    m = re.search(r'\((https?://[^)\s]+)\)', text)
    if not m:
        return ''
    url = m.group(1)
    url = re.sub(r'&timestamp=[\d.]+', '', url)
    return url


def normalize_indent(line):
    """Fathom uses 2-space base plus 4 per nesting level. Convert to 2 per level."""
    m = re.match(r'^( *)(- .*)$', line)
    if not m:
        return line
    spaces, rest = m.groups()
    n = len(spaces)
    new_indent = max(0, (n - 2) // 2 * 2)
    return ' ' * new_indent + rest


def clean_bullet(line):
    """Full cleanup pipeline for a bullet line."""
    line = strip_markdown_link(line)
    line = strip_bold(line)
    line = normalize_indent(line)
    return line.rstrip()


def parse_sections(lines):
    """Split into ## sections. ### subheadings stay inside the parent section."""
    sections = {}
    current = None
    for line in lines:
        m = re.match(r'^##\s+([^#].*)$', line)
        if m:
            current = m.group(1).strip()
            sections[current] = []
        elif current is not None:
            sections[current].append(line)
    return sections


def get_goal_text(purpose_lines):
    """First non-empty line of Meeting Purpose, cleaned of links and bold."""
    for line in purpose_lines:
        cleaned = strip_markdown_link(line).strip()
        if cleaned:
            return strip_bold(cleaned)
    return ''


def get_bullets(section_lines):
    """Every bullet line in a section, fully cleaned."""
    bullets = []
    for line in section_lines:
        if re.match(r'^\s*-\s', line):
            bullets.append(clean_bullet(line))
    return bullets


def process_topics(topics_lines):
    """Convert ### subheaders to ## and clean every bullet.
    Drop blank lines that sit directly above or below an H2 header so the
    section title hugs its bullets."""
    out = []
    skip_next_blank = False
    for line in topics_lines:
        if line.startswith('### '):
            # Strip any trailing blank lines from out so the new H2 hugs the
            # bullets above it
            while out and out[-1] == '':
                out.pop()
            out.append('## ' + line[4:].strip())
            skip_next_blank = True
        elif re.match(r'^\s*-\s', line):
            out.append(clean_bullet(line))
            skip_next_blank = False
        else:
            stripped = line.rstrip()
            if skip_next_blank and stripped == '':
                continue
            out.append(stripped)
            skip_next_blank = False
    return out


def main():
    if len(sys.argv) < 3:
        sys.stderr.write("Usage: format_fathom.py <input> <output>\n")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])

    text = input_path.read_text(encoding='utf-8')
    lines = text.splitlines()

    # Recording URL: first markdown URL we find anywhere
    recording_url = ''
    for line in lines:
        url = extract_first_url(line)
        if url:
            recording_url = url
            break

    sections = parse_sections(lines)
    goal = get_goal_text(sections.get('Meeting Purpose', []))
    key_takeaways = get_bullets(sections.get('Key Takeaways', []))
    next_steps = get_bullets(sections.get('Next Steps', []))
    topics = process_topics(sections.get('Topics', []))

    out = ['---', 'Tags:', '---', '# Overview']
    if recording_url:
        out.append(f'[VIEW RECORDING]({recording_url})')
    out.append('')
    out.append(f'**Goal:** {goal}')
    out.append('')
    out.append('**Key Takeaways:**')
    out.extend(key_takeaways)
    out.append('')
    out.append('**Next Steps & Action Items:**')
    out.extend(next_steps)
    out.append('')
    out.append('---')
    out.append('# Discussion Topics')
    out.extend(topics)

    while out and not out[-1].strip():
        out.pop()

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text('\n'.join(out) + '\n', encoding='utf-8')


if __name__ == '__main__':
    main()
