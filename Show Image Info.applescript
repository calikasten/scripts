on run
	display dialog "Show information for images or profiles."
	set chosenFile to choose file with prompt "Choose an image or profile" default location path to desktop folder
	open chosenFile
end run


on open draggedItems
	repeat with thisFile in (draggedItems as list)
		try
			set filePosixPath to quoted form of POSIX path of thisFile
			set cmdLine to ("sips -g all " & filePosixPath) as string
			set infoString to do shell script cmdLine
			display dialog infoString
			
			-- 'sips -g all' returns all the properties of an image or ColorSync profile
			-- you can also use 'sips -g allxml' to return the properties of an image or ColorSync profile as a property list dictionary
			-- to get an individual element of the dictionary parse the property list dictionary
			--set cmdLine to ("sips -g allxml " & filePosixPath) as string
			--set XMLString to do shell script cmdLine
			--set pixelWidth to xmlvalue(XMLString, "pixelWidth")
			--log pixelWidth
		end try
	end repeat
end open


-- this assumes one level deep
on xmlvalue(theString, theItem)
	try
		tell application "System Events"
			set newPlistItem to make new property list item with data theString
			return value of property list item theItem of newPlistItem
		end tell
	on error
		return ""
	end try
end xmlvalue
