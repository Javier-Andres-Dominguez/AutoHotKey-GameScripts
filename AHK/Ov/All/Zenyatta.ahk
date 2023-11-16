chatting := false

$LButton::
Send {LButton Down}
Loop{
	If(GetKeyState("XButton2", "P")){
		Send {q}
	}
	Sleep 25
	if(GetKeyState("Space", "P")){
		Send {space}
	}
}
Until (!GetKeyState("LButton", "P"))
Send {LButton Up}
return

$q::
Send {q}
Send {MButton}
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
Click
return

$e::
if(!chatting){
	while(GetKeyState("e","P")){
		Send {e}
		Sleep 100
		if(GetKeyState("Space", "P")){
			Send {space}
		}
		Sleep 100
	}
}else{
	Send {e}
}
return

$Space::
if(!chatting){
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
		if(GetKeyState("XButton2", "P")){
			Send {e}
		}
	}
}else{
	send {Space}
}
return

$Enter::
Send {Enter}
if(chatting){
	chatting := false
	return
}else{
	chatting := true
	return
}

$c::
if(chatting){
	Send {c}
}else{
	while(GetKeyState("c","P")){
		Send {c}
		Sleep 50
		if(GetKeyState("Space", "P")){
			Send {Space}
		}
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 3325, 1800
		Send {LButton}
}
return

$esc::
send {esc}
chatting := false
return

$f2::
Suspend
return

$f1::
ExitApp