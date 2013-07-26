on appendFiles(theFolder, theNote)
	tell application "Evernote"
		set allFiles to (every file of theFolder)
		repeat with aFile in allFiles
			tell theNote to append attachment file (aFile as text)
		end repeat
	end tell
end appendFiles

--got this module from http://veritrope.com/code/evernote-tagging-dialog-box-english/
on evernote_Tag_Dialog()
	set default_Tag to "${Default Tag Name:The Tag}"
	set dialog_Title to "${The Title Of This Dialog Box:The Title}"
	set EVnotebook to ""
	display dialog "" & ¬
		"Enter Your Tags (Separated by Colons or Commas)" with title dialog_Title default answer default_Tag buttons {"Create in Default Notebook", "Select Notebook from List", "Cancel"} default button "Create in Default Notebook" cancel button ¬
		"Cancel" with icon path to resource "Evernote.icns" in bundle (path to application "Evernote")
	set dialogresult to the result
	set userInput to text returned of dialogresult
	set ButtonSel to button returned of dialogresult
	set theDelims to {":", ","}
	set EVTag to my Tag_List(userInput, theDelims)
end evernote_Tag_Dialog

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

