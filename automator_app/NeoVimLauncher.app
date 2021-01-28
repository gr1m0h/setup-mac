on run argv

    set the_path to POSIX path of (item 1 of argv)
    set cmd to "nvim " & escapeSpace(the_path)

    if isAppRunning("iTerm2") then

        tell application "iTerm"
            activate
            select last window
            tell current window
                set newtab to (create tab with default profile)
                tell newtab
                    tell current session
                        write text cmd
                    end tell
                    activate
                end tell
            end tell
        end tell
    else
        activate application "iTerm"
        tell application "iTerm"
            tell current window
                tell current session
                    write text cmd
                end tell
                activate
            end tell
        end tell
    end if

end run

on isAppRunning(appName)
    tell application "System Events" to (name of processes) contains appName
end isAppRunning

on escapeSpace(myText)
    set oldDel to AppleScript's text item delimiters
    set AppleScript's text item delimiters to " "
    set myText to every text item of myText
    set AppleScript's text item delimiters to "\\ "
    set myText to myText as string
    set AppleScript's text item delimiters to oldDel
    return myText
end escapeSpace

