State := false
White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
Green := "F"
stdout := FileOpen("*", "w")

Gui, Add, Text, 	x110 y0, 								Status
Gui, Font, s60
Gui, Add, Text, 	x95 y190 	h80 w70	vM8,				O
Gui, Font, s15
Gui, Add, Text, 	x80 y440 	h20 w100	vLastHpColor,	Last Hp Color
Gui, Show, 			x5760 y550	h500 w250, 					Mercy Better Controller
Suspend
GuiControl,, LastHpColor, 	Suspended
return

$+LButton::
$^LButton::
$LButton::
Send {LButton Down}
Loop{
	PixelGetColor firstHpColor, 1852, 1430
	/*stdout.Write("FIRST HP COLOR: ")
	stdout.Write(SubStr(firstHpColor, 1, 3))
	stdout.Write("`n")
	stdout.Read()
	*/
}
Until (firstHpColor==White || SubStr(firstHpColor, 1, 3)==Bastion)
Send {q Down}
GuiControl,, M8,	O
/*i := 0
Loop{
	stdout.Write("✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔✔✔✔️✔✔️✔✔️`n")
	i+=1
}
Until i==50
stdout.Read()
i := 0
*/
Loop{
	PixelGetColor antiHeal, 1905, 1467
	PixelGetColor lastHpColor, 1978, 1430
	GuiControl,, LastHpColor, 	%lastHpColor%
	/*stdout.Write("LAST HP COLOR: ")
	stdout.Write(lastHpColor)
	stdout.Write("`n")
	stdout.Read()
	*/
	if(antiHeal==White || lastHpColor==White || SubStr(lastHpColor, 1, 5)==Blue || SubStr(lastHpColor, 7, 8)==Orange || SubStr(lastHpColor, 5, 1)==Green){
		Send {RButton Down}
	}else{
		Send {RButton Up}
	}
}Until (!GetKeyState("LButton", "P"))
Send {q Up}
GuiControl,, M8, 	x
GuiControl,, LastHpColor, 	Last Hp Color
/*Loop{
	stdout.Write("❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌`n")
	i+=1
}
Until i==50
stdout.Read()
i := 0
*/
Send {LButton Up}
if(!GetKeyState("RButton", "P")){
	Send {RButton Up}
}
return
/*
$XButton1::
Send {Enter}
Sleep 10
Send Get me from spawn
Send {Enter}
return
*/

$NumpadEnter::
Send {Esc}
Sleep 100
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2075, 1215
Click
return

$Enter::
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 3100, 1800
	/*MouseMove, 3100, 1700
	*/
	Send {LButton}
}
return

$f2::
Suspend
if(State){
	State := false
	GuiControl,, LastHpColor, 	Suspended
}else{
	State := true
	GuiControl,, LastHpColor, 	Active
}
return

$f3::
Reload
return

$f1::
ExitApp

GuiClose:
ExitApp