;This script is pretty simple, it´s only function is to change a semi weapon to auto.

$LButton::
While GetKeyState("LButton","P")
{
	Send {LButton}
	Sleep, 50
}
return

$F2::
Suspend
return

$F1::
ExitApp