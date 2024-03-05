State := false
HD := false
White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
Green := "F"
stdout := FileOpen("*", "w")

;Interface
Gui, +AlwaysOnTop
Gui, Add, Text, 	x80 y0, 											Choose resolution
Gui, Add, Button, 	x0 y20 		h80 w250	gResolutionHD,				HD
Gui, Add, Button, 	x0 y100 	h80 w250	gResolution4K,				4k
Gui, Font, s60
Gui, Add, Text, 	x90 y195 	h80 w60		vStatus, 					X
Gui, Add, Text, 	x100 y195 	h80 w60	vHealingLaser 	c0xFCBE03, 	+
GuiControl, Hide, HealingLaser
Gui, Font, s15
Gui, Add, Text, 	x80 y310 	h40 w100	vLastHpPixelColor, 			LastHpPixelColor
Gui, Font, s40
Gui, Add, Text, 	x125 y240 	h70 w40	vBoostingLaserr c0x0398FC, 	/
GuiControl, Hide, BoostingLaserr
Gui, Add, Text, 	x100 y180 	h70 w40	vBoostingLaser 	c0x0398FC, 	/_
GuiControl, Hide, BoostingLaser
Gui, Show, 			x5760 y855	h375 w250, 								Mercy Better Controller
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

ResetMouse(){
	Send {LButton Up}
	Send {RButton Up}
}

$+LButton::
$^LButton::
$LButton::
Send {RButton Up}
Send {LButton Down}
Loop{	;Scan in the screen until you vinculate to an Ally
	if(!HD){
		PixelGetColor firstHpColor, 1858, 1437
	}else{
		PixelGetColor firstHpColor, 929, 718
	}
}
Until (firstHpColor==White || SubStr(firstHpColor, 1, 3)==Bastion)	;Bastion is weird, he has his own hp color

;When you alredy got his hp in the middle of the screen then:

Loop{	;Scan all the time his last hp color and if he is antihealed
	if(!HD){
		PixelGetColor antiHeal, 1905, 1467
		PixelGetColor lastHpColor, 1982, 1435
	}else{
		PixelGetColor antiHeal, 952, 733
		PixelGetColor lastHpColor, 991, 717
	}
	GuiControl,, LastHpPixelColor, %lastHpColor%
	if(antiHeal==White || lastHpColor==White || SubStr(lastHpColor, 1, 5)==Blue || SubStr(lastHpColor, 7, 8)==Orange || SubStr(lastHpColor, 5, 1)==Green){	;If he is full hp:
		Send {RButton Down}
		GuiControl, Show, BoostingLaser
		GuiControl, Show, BoostingLaserr
		GuiControl, Hide, HealingLaser
		GuiControl, Hide, Status
	}else{	;If he isn´t full hp:
		Send {RButton Up}
		GuiControl, Hide, BoostingLaser
		GuiControl, Hide, BoostingLaserr
		GuiControl, Show, HealingLaser
		GuiControl, Hide, Status
	}
}Until (!GetKeyState("LButton", "P"))	;In case you stop pressing Left click:
ResetMouse()
GuiControl, Hide, BoostingLaser
GuiControl, Hide, BoostingLaserr
GuiControl, Hide, HealingLaser
GuiControl, Show, Status
return

$Enter::	;Don´t type in this game, it´s not worth it
return

$RShift::	;Instalock Mercy
while(GetKeyState("RShift", "P")){
	if(!HD){
		MouseMove, 3100, 1800
	}else{
		MouseMove, 1550, 900
	}
	Click
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
GuiControl,, Status, 	X
Suspend
return

$f2::	;Suspend
Suspend
if(State){
	State := false
	GuiControl,, Status, 	X
	GuiControl, Hide, BoostingLaser
	GuiControl, Hide, BoostingLaserr
	GuiControl, Hide, HealingLaser
	GuiControl, Show, Status
	ResetMouse()
}else{
	State := true
	GuiControl,, Status, 	O
	GuiControl, Hide, BoostingLaser
	GuiControl, Hide, BoostingLaserr
	GuiControl, Hide, HealingLaser
	GuiControl, Show, Status
}
return

$f1::	;Close
ExitApp

GuiClose:	;Close
ExitApp