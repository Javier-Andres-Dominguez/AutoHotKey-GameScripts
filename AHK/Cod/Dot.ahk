;This script is used to have a crossair in the middle of the screen. It´s not badly accurate, it is not in the center on purpose to fix a problem. If you put it right in the middle of the screen, in some games your mouse will appear and your camera will stop moving, my solution to that problem was this.

Gui, +AlwaysOnTop
Gui, Color, eb4034
Winset, TransColor, eb4034
gui, -caption
gui, show, x957 y525 h4 w4, my_gui1
return

$LButton::
while GetKeyState("LButton", "P"){
	Send {ñ down}
}
Send {ñ up}
return

$f1::
ExitApp