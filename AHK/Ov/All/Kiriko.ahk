State := false
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Kiriko
return

$c::
while(GetKeyState("c","P")){
	Send {c}
	Sleep 50
}
return

$v::
while(GetKeyState("v","P")){
	Send {v}
	Sleep 50
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 3325, 1650
	Send {LButton}
}
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2225, 1225
Click
return

$F3::
Reload
return

$F2::
Suspend
if(State){
	State := false
	GuiControl,, Status, 	O
}else{
	State := true
	GuiControl,, Status, 	X
}
return

$F1::
ExitApp