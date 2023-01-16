;This script can be used in any game, it is pretty simple. It´s only function is to crouch when you are shooting.

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

$F1::
ExitApp