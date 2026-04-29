-- Triggered by launchd when a new .txt lands in the Fathom Meeting Notes Dropbox folder
-- Delegates the formatting work to format_fathom_notes.py and writes the result to iCloud Drive with the same basename and a .md extension.

property outputFolder : "/Users/ckasten/Library/Mobile Documents/com~apple~CloudDocs/SPINS/_INBOX"
property pythonScript : "/Users/ckasten/Scripts/format_fathom_notes.py"

on run argv
	if (count of argv) is 0 then
		error "No input file path provided. Usage: osascript format_fathom.applescript /path/to/file.txt"
	end if
	set inputPath to item 1 of argv
	
	-- Make sure the iCloud destination exists
	do shell script "mkdir -p " & quoted form of outputFolder
	
	-- Build output path: same basename, .md extension
	set baseName to do shell script "basename " & quoted form of inputPath & " .txt"
	set outputPath to outputFolder & "/" & baseName & ".md"
	
	-- Run the Python transformer
	try
		do shell script "/usr/bin/python3 " & quoted form of pythonScript & " " & quoted form of inputPath & " " & quoted form of outputPath
	on error errMsg
		error "format_fathom.py failed: " & errMsg
	end try
	
	display notification "Saved " & baseName & ".md to iCloud" with title "Notes Formatted and Saved"
end run
