$LButton::
While GetKeyState("LButton","P")
{
	Send {LButton down}
	Send {Control down}
}
Send {LButton up}
Send {Control up}
return

$F2::
Suspend
return

$F1::ExitApp