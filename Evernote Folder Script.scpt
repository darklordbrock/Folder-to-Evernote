on appendFiles(theFolder, theNote)
	tell application "Evernote"
		set allFiles to (every file of theFolder)
		repeat with aFile in allFiles
			tell theNote to append attachment file (aFile as text)
		end repeat
	end tell
end appendFiles

tell application "Finder"
	set theItems to (selection)
	repeat with anItem in theItems
		if (class of anItem) is folder then
			tell application "Evernote"
				set theNote to create note title (name of anItem as string) with text "" notebook "appleScriptTest"
			end tell
			my appendFiles(anItem, theNote)
		end if
	end repeat
end tell

