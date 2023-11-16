$+Space::
$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
	if(GetKeyState("V", "P")){
		Send {v}
		Sleep 25
	}
	if(GetKeyState("C", "P")){
		Send {c}
		Sleep 25
	}
	if(GetKeyState("e","P")){
		Send {e}
		Sleep 25
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

$e::
while(GetKeyState("e","P")){
	Send {e}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
		Sleep 25
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

$Enter::
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 3200, 1800
		Send {LButton}
}
return


$F2::
Suspend
return

$F1::
ExitApp
return