;This script is most commonly used in FPS games, it scands the center of the screen for a color when pressing "g" and shoots if the color changes.

Tracking := 0 								;The programm starts with tracker Off
Scoping := 0 								;The programm starts without Scoping

While (Scoping and Tracking){ 				;While you are Scoping and Tracker is On scan to shoot
	if(color != PixelGetColor, 960, 542){
		Send {LButton}
		Send {RButon}
		Tracking := 0
		Scoping := 0
		return
	}
}
return

$RButton:: 									;Changes the state of scoping and holding breath
Send {RButton}
if(!Scoping){
	Scoping := 1
	Send {c down}
	return
}else{
	Scoping := 0
	Send {c up}
	return
}
return

$2:: 										;Disables the tracker and the scope because you can´t use it while changing weapon
Send {2}
Scoping := 0
Tracking := 0
return

$g:: 										;Toogles the tracker and its functions
if(!Tracking){
	PixelGetColor, color, 960, 542
	Tracking := 1
	return
}else{
	Tracking := 0
	return
}
return

$F2:: 										;This only disables the script until you use again F2
Suspend
return

$F1:: 										;Exits the script
ExitApp