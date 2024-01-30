State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Brigitte
return

$Enter::
return

$c::
while(GetKeyState("c","P")){
	Send {c}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$v::
while(GetKeyState("v","P")){
	Send {v}
	Sleep 50
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

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 3075, 1650
	Send {LButton}
}
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2075, 1215
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

$F1::
ExitApp