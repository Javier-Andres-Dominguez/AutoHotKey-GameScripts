State := false
HD := false
White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
Green := "F"
stdout := FileOpen("*", "w")

;Interface
Gui, Add, Text, 	x110 y0, 								Status
Gui, Add, Button, 	x0 y20 		h80 w250	gResolutionHD,	HD
Gui, Add, Button, 	x0 y100 	h80 w250	gResolution4K,	4k
Gui, Font, s40
Gui, Add, Text, 	x0 y190 	h80 w250	vLastHpColor,	Hp Color
Gui, Font, s15
Gui, Add, Text, 	x80 y440 	h20 w100	vState,			Suspended
Gui, Show, 			x5760 y550	h500 w250, 					Mercy Better Controller
Suspend
GuiControl,, M8, 	Suspended
return

ResolutionHD:
{
	HD := true
}

Resolution4K:
{
	HD := false
}

$+LButton::
$^LButton::
$LButton::
Send {RButton Up}
Send {LButton Down}
Loop{	;Scan in the screen until you vinculate to an Ally
	if(!HD){
		PixelGetColor firstHpColor, 1852, 1430
	}else{
		PixelGetColor firstHpColor, 926, 715
	}
}
Until (firstHpColor==White || SubStr(firstHpColor, 1, 3)==Bastion)	;Bastion is weird, he has his own hp color

;When you alredy got his hp in the middle of the screen then:

Loop{	;Scan all the time his last hp color and if he is antihealed
	if(!HD){
		PixelGetColor antiHeal, 1905, 1467
		PixelGetColor lastHpColor, 1978, 1430
	}else{
		PixelGetColor antiHeal, 952, 733
		PixelGetColor lastHpColor, 989, 715
	}
	GuiControl,, LastHpColor, 	%lastHpColor%

	if(antiHeal==White || lastHpColor==White || SubStr(lastHpColor, 1, 5)==Blue || SubStr(lastHpColor, 7, 8)==Orange || SubStr(lastHpColor, 5, 1)==Green){	;If he is full hp:
		Send {RButton Down}
	}else{	;If he isn´t full hp:
		Send {RButton Up}
	}
}Until (!GetKeyState("LButton", "P"))	;In case you stop pressing Left click:
Send {LButton Up}
Send {RButton Up}
GuiControl,, State, 	Active
return

/*$+RButton::
$^RButton::
$RButton::
Send {LButton Up}
Send {RButton Down}
Loop{	;Scan in the screen until you vinculate to an Ally
	if(!HD){
		PixelGetColor firstHpColor, 1852, 1430
	}else{
		PixelGetColor firstHpColor, 926, 715
	}
}
Until (firstHpColor==White || SubStr(firstHpColor, 1, 3)==Bastion)	;Bastion is weird, he has his own hp color

;When you alredy got his hp in the middle of the screen then:

Loop{	;Scan all the time his last hp color and if he is antihealed
	if(!HD){
		PixelGetColor antiHeal, 1905, 1467
		PixelGetColor lastHpColor, 1978, 1430
	}else{
		PixelGetColor antiHeal, 952, 733
		PixelGetColor lastHpColor, 989, 715
	}
	GuiControl,, LastHpColor, 	%lastHpColor%

	if(antiHeal==White || lastHpColor==White || SubStr(lastHpColor, 1, 5)==Blue || SubStr(lastHpColor, 7, 8)==Orange || SubStr(lastHpColor, 5, 1)==Green){	;If he is full hp:
		Send {LButton Up}
	}else{	;If he isn´t full hp:
		Send {LButton Down}
	}
}Until (!GetKeyState("RButton", "P"))	;In case you stop pressing Right click:
Send {RButton Up}
Send {LButton Up}
GuiControl,, State, 	Active
return
*/

$Enter::	;Don´t type in this game, it´s not worth it
return

$RShift::	;Instalock Mercy
while(GetKeyState("RShift", "P")){
	if(!HD){
		MouseMove, 3100, 1800
	}else{
		MouseMove, 1550, 900
	}
	Send {LButton}
}
return

$NumpadEnter::	;Get out of the game
Send {Esc}
Sleep 100
if(!HD){
	MouseMove, 1850, 1250
}else{
	MouseMove, 925, 625
}
Click
Sleep 100
if(!HD){
	MouseMove, 2075, 1215
}else{
	MouseMove, 1037, 607
}
Click
State := false
GuiControl,, State, 	Suspended
Suspend
return

$f3::	;Reload
Reload
return

$f2::	;Suspend
Suspend
if(State){
	State := false
	GuiControl,, State, 	Suspended
}else{
	State := true
	GuiControl,, State, 	Active
}
return

$f1::	;Close
ExitApp

GuiClose:
ExitApp