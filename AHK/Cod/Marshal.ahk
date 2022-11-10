;This script is used to slow down the FireSpeed of SVG-100 from the game Call of Duty Black Ops 2 to replicate the same Firespeed of Marshal from the game VALORANT.
;The controls are: F1 (Exits the script), F2 (Suspends the script (hotkeys disabled)), F (It is used when you die, in order to skip the killcam. The program doesn´t detect when you die, so when you press F it assumes you respawn with the SVG-100 equiped), 2 (Tells the program that you are changing the weapon, to activate/desactivate the custon FireSpeed)
Marshal := 1
Scoping := 0

$LButton::
Send {LButton}
if(Scoping = 1){
	Send {RButton}
	Scoping := 2
	Sleep 750
	Scoping := 0
	return
}
if(Marshal = 1){
	Sleep 750
	return
}
return

$RButton::
Send {RButton}

if(Scoping = 0){
	Scoping := 1
	return
}
if(Scoping = 1){
	Scoping := 0
	return
}
return

$2::
Send {2}
Scoping := 0
if(Marshal = 1){
	Marshal := 0
	return
}
if(Marshal = 0){
	Marshal := 1
	return
}
return

$f::
Marshal := 1
Scoping := 0
return

$F2::
Suspend
return

$F1::ExitApp