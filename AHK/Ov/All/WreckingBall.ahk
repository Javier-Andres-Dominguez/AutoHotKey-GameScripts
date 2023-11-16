$x::
Send {x}
Sleep 100
Send {Ctrl}
return

$Space::
while(GetKeyState("Space", "P")){
	Send {Space}
	Sleep 25
	if(GetKeyState("V", "P")){
		Send {v}
	}
	if(GetKeyState("c", "P")){
		Send {c}
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 1025, 1800
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

$f2::
Suspend
return

$F3::
Reload
return

$f1::
ExitApp