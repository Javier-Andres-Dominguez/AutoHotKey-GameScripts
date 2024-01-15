State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Junkrat
return

$Enter::
return

$RButton::
while(GetKeyState("RButton","P")){
	Send {RButton}
	Sleep 25
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
	if(GetKeyState("V", "P")){
		Send {v}
	}
	if(GetKeyState("C", "P")){
		Send {c}
	}
}
return

$c::
while(GetKeyState("C","P")){
	Send {c}
	sleep 25
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$v::
while(GetKeyState("V","P")){
	Send {v}
	sleep 25
	if(GetKeyState("Space", "P")){
		send {Space}
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 2250, 1650
	Send {LButton}
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