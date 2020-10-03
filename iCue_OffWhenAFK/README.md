# What this is
Corsiar iCue doesn't have an option to turn off RGB when your computer isn't in use. I have solved this using some of the files in this folder.

Compile exit_on_active.ahk2 and switch-on-idle.ahk2 then run switch-on-idle.ahk2. This script will wait until you have been idle for 60 seconds then run exit_on_active.exe.

In Corsair iCue setup a profile to run when exit_on_active.exe is running, and set this profile to have the LED's turned off (or set how you would like when you aren't at your PC)

exit_on_active.ahk2 creates a GUI (seems like this is required for iCue to detect it and set the profile accordingly) and waits until it detects some activity eg. a keyboard button press or mouse movement, then closes.

I have also included Turn off Screen.bat which has a batch file that when run will also run exit_on_active.exe as well as turn off your screen. This can be setup to run with a hotkey so you can turn off your LEDs and screen together.
