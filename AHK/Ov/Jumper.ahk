;This script is used in any game that you can jump. It spams the key "space" activating the script with the key "M" and deactivates it with "Enter" (to chat) and with "M" again

Jumper := false
Writing := false

Loop{
	if(Jumper){
		send {space}
		Sleep 1
	}
}
return

$enter::
Send {enter}
if(!Writing){
	Writing := true
	Jumper := false
	return
}else {
	Writing := false
	return
}
return

$m::
Send {m}
if(!Writing){
	if(Jumper){
		Jumper := false
		return
	}else{
		Jumper := true
		return
	}
}
return

$f2::
Suspend
return

$f1::
Exitapp