;This script is used for shooter games, when you shoot (Click) it send Ctrl to crouch while you are shooting
;Controls: F1 (Exits the script), F2 (Suspends the script (disables hotkeys))
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