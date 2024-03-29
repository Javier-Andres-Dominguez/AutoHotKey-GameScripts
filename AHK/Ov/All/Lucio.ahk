﻿; You need in options to change healing--> press the button
stdout := FileOpen("*", "w")
State := false
HD := false
;Interface
Gui, +AlwaysOnTop
Gui, Add, Text, 	x80 y0, 								Choose resolution
Gui, Add, Button, 	x0 y20 		h80 w250	gResolutionHD,	HD
Gui, Add, Button, 	x0 y100 	h80 w250	gResolution4K,	4k
Gui, Font, s20
Gui, Add, Text, 	x10 y190 	h80 w170		vStatus, 		X
Gui, Font, s20
Gui, Add, Text, 	x60 y350 	h80 w140	vHealing 		c0xFCBE03, 	X
Gui, Add, Text, 	x170 y350 	h80 w140	vMovement 		c0xD661AE, 	X
Gui, Show, 			x5760 y550	h500 w250, 					Lucio
Suspend

Loop{
	if(State){		;If the script is on:
		if(GetKeyState("Space", "P")){
			Send {Space}
		}
		if(!HD){
			PixelGetColor, YourHp, 824, 1860 	;Get your last HpPixel color
			/*PixelGetColor, AllysNear, 1900, 1369 	;Get your if there are allys near
			GuiControl,, Status, 	%AllysNear%
			*/
		}else{
			PixelGetColor, YourHp, 412, 930 	;Get your last HpPixel color
		}
		/*if((SubStr(YourHp, 3, 1)!="F" || SubStr(YourHp, 5, 1)!="F" || SubStr(YourHp, 7, 1)!="F") || (SubStr(AllysNear, 5, 1)=="F" || SubStr(AllysNear, 7, 1)=="F")){	;If your are not full HP:
		*/
		if((SubStr(YourHp, 3, 1)!="F" || SubStr(YourHp, 5, 1)!="F" || SubStr(YourHp, 7, 1)!="F")){	;If your are not full HP:
			GuiControl,, Healing, 	O
			GuiControl,, Movement, 	X
			Send {e Down}	;Spam the heal
		}else{	;If you are using full HP:
			GuiControl,, Healing, 	X
			GuiControl,, Movement, 	O
			Send {e Up}	;Spam the speed
		}
	}
}

ResolutionHD:
{
	HD := true
}

Resolution4K:
{
	HD := false
}

$Enter::
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 2925, 1800
	Click
}
return

$NumpadEnter::
Send {Esc}
Sleep 100
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2075, 1215
Click
State := false
GuiControl,, Status, 	X
Suspend
return

$F3::
Reload
return

$F2::
Suspend
if(State){
	State := false
	GuiControl,, Status, 	X
}else{
	State := true
	GuiControl,, Status, 	O
}
return

$F1::
ExitApp

GuiClose:
ExitApp