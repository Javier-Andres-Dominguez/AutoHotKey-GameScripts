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