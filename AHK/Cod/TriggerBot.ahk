;This script is used on shooter games, when you have your cursor over something it detects de color, if the color changes it will send 1 Click.
;Controls: F1 (Exits the script), F2 (Suspends the script (disables hotkeys)), 2 (Stops scoping if it is scoping and deactivates the tracker), G (Activate/Desactivate the tracker when scoping), Right Click (Aims and if the tracker is activated it sends 1 Click)
;This script is currently not working. I am still working on it
Tracker := 0 ;The programm starts with tracker Off
Scoping := 0 ;The programm starts without Scoping

While (Scoping = 1 and Tracker = 1){ ;While you are Scoping and Tracker is On:

	if(color != PixelGetColor, 960, 542){ ;If the color it was picked is not the same as now do:

		Send {LButton} ;Send Left Click
		Send {RButon} ;Send Right Click
		Tracker := 0 ;Tracker is now Off
		Scoping := 0 ;Now you are not Scoping
		return ;End of script
	}
}
return ;End of script

$RButton::

Send {RButton} ;Send Right click

if(Scoping = 0){ ;If you aren´t Scoping:

	Scoping := 1 ;Now you are Scoping
	Send {c down} ;Now you aren´t breathing
	return ;End of script
}
if(Scoping = 1){ ;If you are Scoping:

	Scoping := 0 ;Now you aren´t Scoping
	Send {c up} ;Now you are breathing
	return ;End of script
}
return ;End of script

$2::

Send {2} ;Send 2

if(c is down){ ;If you aren´t breathing
	Send {c up} ;You are breathing
}

Scoping := 0 ;Now you aren´t Scoping
Tracker := 0 ;Now you Tracker is Off

return ;End of script

$g::

if(Scoping = 1 and Tracker = 0){ ;If you are Scoping and Tracker is Off:

	PixelGetColor, color, 960, 542 ;Save in the color in variable "color"
	Tracker := 1 ;Tracker is now On
	return ;End of script
}

if(Scoping = 1 and Tracker = 1){ ;If you are Scoping and Tracker is On:

	Tracker := 0 ;Tracker is now Off
	return ;End of script
}

if(Scoping = 0){ ;If you are not Scoping:

	Tracker := 0 ;Tracker is now Off
	return ;End of script
}
return ;End of script

$F2:: ;This only disables the script until you use again F2
Suspend
return

$F1:: ;Exits the script
ExitApp