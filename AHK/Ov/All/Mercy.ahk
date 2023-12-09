State := false
White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
Green := "F"
stdout := FileOpen("*", "w")

;Interface
Gui, Add, Text, 	x110 y0, 								Status
Gui, Font, s40
Gui, Add, Text, 	x0 y190 	h80 w250	vLastHpColor,	Hp Color
Gui, Font, s15
Gui, Add, Text, 	x80 y440 	h20 w100	vM8,				O
Gui, Show, 			x5760 y550	h500 w250, 					Mercy Better Controller
Suspend
GuiControl,, M8, 	Suspended
return

$+LButton::
$^LButton::
$LButton::
Send {LButton Down}
Loop{	;Scan in the screen until you vinculate to an Ally
	PixelGetColor firstHpColor, 1852, 1430
}
Until (firstHpColor==White || SubStr(firstHpColor, 1, 3)==Bastion)	;Bastion is weird, he has his own hp color
GuiControl,, M8,	O

;When you alredy got his hp in the middle of the screen then:

Loop{	;Scan all the time his last hp color and if he is antihealed
	PixelGetColor antiHeal, 1905, 1467
	PixelGetColor lastHpColor, 1978, 1430
	GuiControl,, LastHpColor, 	%lastHpColor%

	if(antiHeal==White || lastHpColor==White || SubStr(lastHpColor, 1, 5)==Blue || SubStr(lastHpColor, 7, 8)==Orange || SubStr(lastHpColor, 5, 1)==Green){	;If he is full hp:
		Send {RButton Down}
	}else{	;If he isn´t full hp:
		Send {RButton Up}
	}
}Until (!GetKeyState("LButton", "P"))	;In case you stop pressing Left click:
Send {LButton Up}
GuiControl,, M8, 	X
GuiControl,, M8, 	Active

if(!GetKeyState("RButton", "P")){	;If you weren´t manually pressing Right Click:
	Send {RButton Up}
}
return

$NumpadEnter::	;Get out of the game
Send {Esc}
Sleep 100
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2075, 1215
Click
State := false
GuiControl,, M8, 	Suspended
Suspend
return

$Enter::	;Don´t type in this game, it´s not worth it
return

$RShift::	;Instalock Mercy
while(GetKeyState("RShift", "P")){
	MouseMove, 3100, 1800
	Send {LButton}
}
return

$f2::	;Suspend
Suspend
if(State){
	State := false
	GuiControl,, M8, 	Suspended
}else{
	State := true
	GuiControl,, M8, 	Active
}
return

$f3::	;Reload
Reload
return

$f1::	;Close
ExitApp

GuiClose:
ExitApp
