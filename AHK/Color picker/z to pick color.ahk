;This script identifys for you the color your cursor is pointing. Z to activate, F2 to suspend (the script will not get hotkeys) and F1 to exit the script

$z::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the cursor is %color%.
return

$F2::
Suspend
return

$F1::
ExitApp