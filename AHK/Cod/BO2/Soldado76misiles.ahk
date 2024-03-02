$RButton::
send {5}
Sleep 400
send {LButton}
Sleep 150
send {5}
While GetKeyState("LButton","P")
{
	Send {LButton down}
}
Send {LButton up}
return

$f1::
ExitApp

$f2::
Suspend
return