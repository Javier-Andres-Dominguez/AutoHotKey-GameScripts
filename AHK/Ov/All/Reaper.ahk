$e::
Click
Send {e}
return

$x::
Click
Send {x}
return

$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
	if(GetKeyState("e","P")){
		Send {e}
	}
	if(GetKeyState("x","P")){
		Send {x}
	}
	if(GetKeyState("c","P")){
		Send {c}
	}
	if(GetKeyState("v","P")){
		Send {v}
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 1525, 1750
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
return

$F2::
Suspend
return

$F1::
ExitApp