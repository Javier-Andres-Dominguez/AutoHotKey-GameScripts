﻿;This script is used to slow down the FireSpeed of DSR-50 from the game Call of Duty Black Ops 2 to replicate the same Firespeed of Oerator from the game VALORANT.
;The controls are: F1 (Exits the script), F2 (Suspends the script (hotkeys disabled)), 2 (Tells the program that you are changing the weapon, to activate/desactivate the custon FireSpeed)
Scoping := 0

$RButton::
if(Scoping = 0){
	Send {RButton}
	Send {c down}
	Scoping := 1
	return
}
if(Scoping = 1){
	Send {RButton}
	Send {c up}
	Scoping := 0
	return
}
return

$2::
Send {2}
if (Scoping = 1){
	Send {c up}
	Scoping := 0
	return
}

return

$r::
Send {r}
if(Scoping = 1){
	Send {c up}
	Scoping := 0
	return
}
return

$LButton::
Send {LButton}
if(Scoping = 1){
	Send {RButton}
	Send {c up}
	Scoping := 2
	Sleep 1750
	Scoping := 0
}
return

$F2::
Suspend
return

$F1::
ExitApp