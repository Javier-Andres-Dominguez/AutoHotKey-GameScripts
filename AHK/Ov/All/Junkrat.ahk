chatting := false

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
if(!chatting){
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
}else{
	send {Space}
}
return

$c::
if(!chatting){
	while(GetKeyState("C","P")){
		Send {c}
		sleep 25
		if(GetKeyState("Space", "P")){
			Send {Space}
		}
	}
}else{
	send {c}
}
return

$v::
if(!chatting){
	while(GetKeyState("V","P")){
		Send {v}
		sleep 25
		if(GetKeyState("Space", "P")){
			Send {Space}
		}
	}
}else{
	send {v}
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

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 2250, 1700
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

$esc::
send {esc}
chatting := false
return

$f2::
Suspend
return

$f1::
ExitApp