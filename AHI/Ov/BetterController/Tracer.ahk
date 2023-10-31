stdout := FileOpen("*", "w")
chatting := false

Loop{
	if(!GetKeyState("Tab","P") && !chatting){
		PixelGetColor, color, 457, 1889
		PixelGetColor, trazerGlasses, 235, 1914
		stdout.Write(SubStr(color, 1, 3))
		stdout.Write("`n")
		stdout.Read()
		*/
		if(SubStr(color, 1, 3)!=0xF && trazerGlasses==0x17A2EB){
			Send {q}
		}
	}
}

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

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 2300, 1800
		Send {LButton}
}
return

$Esc::
Send {Esc}
stdout.Write("Esc`n")
stdout.Read()
return

$Enter::
Send {Enter}
if(chatting){
	chatting := false
	stdout.Write("Chat closed`n")
	stdout.Read()
	return
}else{
	chatting := true
	stdout.Write("Chat open`n")
	stdout.Read()
	return
}

$q::
if(!chatting){
	Send {c}
	Send {q}
}else{
	send {q}
}
return

$x::
if(!chatting){
	Send {x}
	Sleep 200
	Send {q}
}else{
	send {x}
}
return

$f1::
ExitApp