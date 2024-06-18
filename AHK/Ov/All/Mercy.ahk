State := false
HD := false
White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
Green := "F"
xFirstHpColor := 1858
yFirstHpColor := 1437
xAntiHeal := 1905
yAntiHeal := 1467
xLastHPColor := 1982
yLastHPColor := 1435
xInstalock := 3100
yInstalock := 1800
xQuitGame := 1850
yQuitGame := 1250
xYes := 2075
yYes := 1215
stdout := FileOpen("*", "w")

;Interface
Gui, +AlwaysOnTop
Gui, Add, Text, 	x80 y0, 											Choose resolution
Gui, Add, Button, 	x0 y20 		h80 w250	gResolutionHD,				HD
Gui, Add, Button, 	x0 y100 	h80 w250	gResolution4K,				4k
Gui, Font, s60
Gui, Add, Text, 	x90 y195 	h80 w85		vStatus, 					X
Gui, Add, Text, 	x100 y195 	h80 w60	vHealingLaser 	c0xFCBE03, 	+
GuiControl, Hide, HealingLaser
Gui, Font, s15
Gui, Add, Text, 	x80 y310 	h40 w100	vLastHpPixelColor, 			LastHpPixelColor
Gui, Font, s40
Gui, Add, Text, 	x125 y240 	h70 w40	vBoostingLaserr c0x0398FC, 	/
GuiControl, Hide, BoostingLaserr
Gui, Add, Text, 	x100 y180 	h70 w40	vBoostingLaser 	c0x0398FC, 	/_
GuiControl, Hide, BoostingLaser
Gui, Show, 			x5760 y960	h375 w250, 								Mercy Better Controller
Suspend
GuiControl,, M8, 	Suspended
return

ResolutionHD:
{
	HD := true
	xFirstHpColor := 929
	yFirstHpColor := 718
	xAntiHeal := 952
	yAntiHeal := 733
	xLastHPColor := 991
	yLastHPColor := 717
	xInstalock := 1550
	yInstalock := 1800
	xQuitGame := 925
	yQuitGame := 625
	xYes := 1037
	yYes := 607
}

Resolution4K:
{
	HD := false
	xFirstHpColor := 1858
	yFirstHpColor := 1437
	xAntiHeal := 1905
	yAntiHeal := 1467
	xLastHPColor := 1982
	yLastHPColor := 1435
	xInstalock := 3100
	yInstalock := 900
	xQuitGame := 1850
	yQuitGame := 1250
	xYes := 2075
	yYes := 1215
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
	PixelGetColor firstHpColor, xFirstHpColor, yFirstHpColor
	GuiControl,, LastHpPixelColor, %firstHpColor%
	if(!GetKeyState("LButton", "P")){
		return
	}
}
Until (firstHpColor==White || SubStr(firstHpColor, 1, 3)==Bastion)	;Bastion is weird, he has his own hp color

;When you alredy got his hp in the middle of the screen then:

Loop{	;Scan all the time his last hp color and if he is antihealed
	PixelGetColor antiHeal, xAntiHeal, yAntiHeal
	PixelGetColor lastHpColor, xLastHPColor, yLastHPColor
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

CloseAll(){
	;closes all other scripts
	DetectHiddenWindows, On
	WinGet, AHKList, List, ahk_class AutoHotkey
	Loop, %AHKList%
	{
		ID := AHKList%A_Index%
		If (ID <> A_ScriptHwnd)
			WinClose, ahk_id %ID%
	}
}

$Enter::	;Don´t type in this game, it´s not worth it
return

$RShift::	;Instalock Mercy
while(GetKeyState("RShift", "P")){
	MouseMove, xInstalock, yInstalock
	Click
}
return

$NumpadEnter::	;Get out of the game
Send {Esc}
Sleep 100
MouseMove, xQuitGame, yQuitGame
Click
Sleep 100
MouseMove, xYes, yYes
Click
State := false
GuiControl,, Status, 	X
CloseAll()
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
	CloseAll()
}else{
	State := true
	if(!HD){
		GuiControl,, Status, 	4k
	}else{
		GuiControl,, Status, 	HD
	}
	GuiControl, Hide, BoostingLaser
	GuiControl, Hide, BoostingLaserr
	GuiControl, Hide, HealingLaser
	GuiControl, Show, Status
	Run, YourPath\HelperMercy.ahk
	Run, YourPath\HelperRes.ahk
}
return

GuiClose:
CloseAll()
ExitApp

$F1::
CloseAll()
ExitApp
