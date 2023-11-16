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
	if(GetKeyState("E", "P")){
		Send {e}
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

$+e::
$e::
while(GetKeyState("e","P")){
	Send {e}
	Sleep 100
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 625, 1650
	Send {LButton}
}
return

$Enter::
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
Click
return

$Esc::
Send {Esc}
return

$F2::
Suspend
return

$F1::
ExitApp