State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Zenyatta
return

$LButton::
Send {LButton Down}
While(GetKeyState("LButton","P")){
	If(GetKeyState("XButton2", "P")){
		Send {q}
	}
	Sleep 25
	if(GetKeyState("Space", "P")){
		Send {space}
	}
}
Send {LButton Up}
return

$q::
Send {q}
Send {MButton}
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
	Sleep 25
	if(GetKeyState("V", "P")){
		Send {v}
	}
	if(GetKeyState("C", "P")){
		Send {c}
	}
	if(GetKeyState("E", "P")){
		Send {e}
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 3325, 1800
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