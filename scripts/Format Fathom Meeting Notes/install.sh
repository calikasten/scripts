#!/bin/bash

set -e

# === CONFIGURATION ===

# Where Zapier drops the raw .txt files.
INBOX_PATH="$HOME/Library/CloudStorage/Dropbox/Fathom Meeting Notes"

# Where the formatted .md files land. 
OUTPUT_PATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs/SPINS/_INBOX"

# Where the installed scripts live.
SCRIPTS_DIR="$HOME/Scripts"

# Where launchd agent files live. This path is fixed by macOS for user-scope agents (don't change).
LAUNCH_AGENTS_DIR="$HOME/Library/LaunchAgents"

# Where activity and error logs go. ~/Library/Logs/ is the macOS convention.
LOG_DIR="$HOME/Library/Logs"

# The launchd Label. Must be unique across all your loaded agents and must match the plist filename minus .plist. Reverse-DNS notation is convention.
AGENT_LABEL="com.user.fathom-formatter"

# How often (in seconds) the agent polls the inbox for new files.
POLL_INTERVAL=30

# Path to Python 3 interpreter. /usr/bin/python3 ships with macOS Command Line Tools.
PYTHON_BIN="/usr/bin/python3"

# === IMPLEMENTATION ===

APPLESCRIPT_NAME="FormatFathomNotes.applescript"
PYTHON_NAME="format_fathom_notes.py"
PLIST_NAME="${AGENT_LABEL}.plist"

LOG_PATH="$LOG_DIR/fathomwatcher.log"
ERR_PATH="$LOG_DIR/fathomwatcher.err"

INSTALLED_APPLESCRIPT="$SCRIPTS_DIR/$APPLESCRIPT_NAME"
INSTALLED_PYTHON="$SCRIPTS_DIR/$PYTHON_NAME"
INSTALLED_PLIST="$LAUNCH_AGENTS_DIR/$PLIST_NAME"

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Fathom Notes Pipeline installer"
echo "==============================="
echo "Inbox:      $INBOX_PATH"
echo "Output:     $OUTPUT_PATH"
echo "Scripts:    $SCRIPTS_DIR"
echo "Agent:      $AGENT_LABEL"
echo "Interval:   ${POLL_INTERVAL}s"
echo "Python:     $PYTHON_BIN"
echo

# Sanity check: Python must exist
if [ ! -x "$PYTHON_BIN" ]; then
  echo "ERROR: Python not found at $PYTHON_BIN"
  echo "Edit PYTHON_BIN at the top of install.sh and re-run."
  exit 1
fi

# Sanity check: source files must exist
for f in "$REPO_DIR/scripts/${APPLESCRIPT_NAME}.template" \
         "$REPO_DIR/scripts/$PYTHON_NAME" \
         "$REPO_DIR/launchd/com.user.fathom-formatter.plist.template"; do
  if [ ! -f "$f" ]; then
    echo "ERROR: Missing source file: $f"
    exit 1
  fi
done

# Create destination folders
mkdir -p "$SCRIPTS_DIR"
mkdir -p "$OUTPUT_PATH"
mkdir -p "$LAUNCH_AGENTS_DIR"
mkdir -p "$LOG_DIR"

# Render the AppleScript template
echo "Rendering AppleScript..."
sed \
  -e "s|__OUTPUT_PATH__|$OUTPUT_PATH|g" \
  -e "s|__PYTHON_SCRIPT__|$INSTALLED_PYTHON|g" \
  "$REPO_DIR/scripts/${APPLESCRIPT_NAME}.template" \
  > "$INSTALLED_APPLESCRIPT"

# Copy the Python script as-is
echo "Copying Python script..."
cp "$REPO_DIR/scripts/$PYTHON_NAME" "$INSTALLED_PYTHON"
chmod +x "$INSTALLED_PYTHON"

# Render the plist template
echo "Rendering launchd plist..."
sed \
  -e "s|__AGENT_LABEL__|$AGENT_LABEL|g" \
  -e "s|__INBOX_PATH__|$INBOX_PATH|g" \
  -e "s|__SCRIPT_PATH__|$INSTALLED_APPLESCRIPT|g" \
  -e "s|__POLL_INTERVAL__|$POLL_INTERVAL|g" \
  -e "s|__LOG_PATH__|$LOG_PATH|g" \
  -e "s|__ERR_PATH__|$ERR_PATH|g" \
  "$REPO_DIR/launchd/com.user.fathom-formatter.plist.template" \
  > "$INSTALLED_PLIST"

# Reload the agent
echo "Loading launchd agent..."
launchctl unload "$INSTALLED_PLIST" 2>/dev/null || true
launchctl load "$INSTALLED_PLIST"

echo
echo "Install complete."
echo
echo "Verify the agent is running:"
echo "  launchctl list | grep $(echo "$AGENT_LABEL" | rev | cut -d. -f1 | rev)"
echo
echo "Watch the log for ticks (one every ${POLL_INTERVAL}s):"
echo "  tail -f $LOG_PATH"
echo
echo "If the agent doesn't tick, check Full Disk Access for /bin/bash and"
echo "/usr/bin/osascript in System Settings, Privacy & Security."
