stdout := FileOpen("*", "w")

Loop{
	if(GetKeyState("Shift","P")){

	}
}

$XButton2::
Send {Space Down}
while(GetKeyState("XButton2","P")){
}
Send {Space Up}
return

$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
}
return

$Enter::
return

$NumpadEnter::
Send {Esc}
Sleep 100
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2075, 1215
Click
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 2925, 1800
	Click
}
return

$F2::
Suspend
return

$F1::
ExitApp