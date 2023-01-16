$RButton::
send {RButton}
Sleep 400
send {ñ}
Sleep 150
send {RButton}
While GetKeyState("LButton","P")
{
	Send {ñ down}
}
Send {ñ up}
return

$f1::
ExitApp

$f2::
Suspend
return