﻿State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Hanzo
return

$Enter::
return

$q::
Click
Send {q}
return

$v::
Click
Send {v}
return

$c::
Click
Send {c}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 2120, 1650
	Click
}
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
Click
State := false
GuiControl,, Status, 	X
Suspend
return

$F3::
Reload
return

$F2::
Suspend
if(State){
	State := false
	GuiControl,, Status, 	X
}else{
	State := true
	GuiControl,, Status, 	O
}
return

$f1::
ExitApp