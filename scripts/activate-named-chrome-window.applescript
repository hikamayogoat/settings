#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Active main-chrome
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

on activateChromeWindow(windowName)
	tell application "Google Chrome"
		activate
		set theWindows to every window
		repeat with win in theWindows
			if name of win starts with windowName then
				set index of win to 1 -- Bring to front
				return
			end if
		end repeat
	end tell
end activateChromeWindow

activateChromeWindow("main-chrome")
