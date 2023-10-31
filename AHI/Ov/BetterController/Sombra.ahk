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

$q::
while(GetKeyState("q","P")){
	Send {q}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$e::
while(GetKeyState("e","P")){
	Send {e}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$x::
while(GetKeyState("x","P")){
	Send {x}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
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

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
Click
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 1925, 1800
		Send {LButton}
}
return

$Esc::
Send {Esc}
return

$F2::
Suspend
return

$F1::
ExitApp