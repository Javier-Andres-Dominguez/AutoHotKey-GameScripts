;This script is used on shooter games, when you have a Semi weapon you convert it to Full-Auto with this script. While you are pressing Click it sends multiple clicks until you stop.
;Controls: F1 (Exits the script), F2 (Suspends the script (disables hotkeys))
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