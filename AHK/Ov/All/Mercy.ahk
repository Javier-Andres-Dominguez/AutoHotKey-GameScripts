State := false
White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
Green := "F"
stdout := FileOpen("*", "w")

Gui, Add, Text, 	x110 y0, 								Status
Gui, Add, Text, 	x105 y50 	h20 w70	vL1,			O
Gui, Add, Text, 	x125 y50 	h20 w70	vM1,			O
Gui, Add, Text, 	x145 y50 	h20 w70	vR1,			O
Gui, Add, Text, 	x105 y70 	h20 w70	vL2,			O
Gui, Add, Text, 	x125 y70 	h20 w70	vM2,			O
Gui, Add, Text, 	x145 y70 	h20 w70	vR2,			O
Gui, Add, Text, 	x105 y90 	h20 w70	vL3,			O
Gui, Add, Text, 	x125 y90 	h20 w70	vM3,			O
Gui, Add, Text, 	x145 y90 	h20 w70	vR3,			O
Gui, Add, Text, 	x105 y110 	h20 w70	vL4,			O
Gui, Add, Text, 	x125 y110 	h20 w70	vM4,			O
Gui, Add, Text, 	x145 y110 	h20 w70	vR4,			O
Gui, Add, Text, 	x105 y130 	h20 w70	vL5,			O
Gui, Add, Text, 	x125 y130 	h20 w70	vM5,			O
Gui, Add, Text, 	x145 y130 	h20 w70	vR5,			O
Gui, Add, Text, 	x105 y150 	h20 w70	vL6,			O
Gui, Add, Text, 	x125 y150 	h20 w70	vM6,			O
Gui, Add, Text, 	x145 y150 	h20 w70	vR6,			O
Gui, Add, Text, 	x105 y170 	h20 w70	vL7,			O
Gui, Add, Text, 	x125 y170 	h20 w70	vM7,			O
Gui, Add, Text, 	x145 y170 	h20 w70	vR7,			O
Gui, Add, Text, 	x105 y190 	h20 w70	vL8,			O
Gui, Add, Text, 	x125 y190 	h20 w70	vM8,			O
Gui, Add, Text, 	x145 y190 	h20 w70	vR8,			O
Gui, Add, Text, 	x105 y210 	h20 w70	vL9,			O
Gui, Add, Text, 	x125 y210 	h20 w70	vM9,			O
Gui, Add, Text, 	x145 y210 	h20 w70	vR9,			O
Gui, Add, Text, 	x105 y230 	h20 w70	vL10,			O
Gui, Add, Text, 	x125 y230 	h20 w70	vM10,			O
Gui, Add, Text, 	x145 y230 	h20 w70	vR10,			O
Gui, Add, Text, 	x105 y250 	h20 w70	vL11,			O
Gui, Add, Text, 	x125 y250 	h20 w70	vM11,			O
Gui, Add, Text, 	x145 y250 	h20 w70	vR11,			O
Gui, Add, Text, 	x105 y270 	h20 w70	vL12,			O
Gui, Add, Text, 	x125 y270 	h20 w70	vM12,			O
Gui, Add, Text, 	x145 y270 	h20 w70	vR12,			O
Gui, Add, Text, 	x105 y290 	h20 w70	vL13,			O
Gui, Add, Text, 	x125 y290 	h20 w70	vM13,			O
Gui, Add, Text, 	x145 y290 	h20 w70	vR13,			O
Gui, Add, Text, 	x105 y310 	h20 w70	vL14,			O
Gui, Add, Text, 	x125 y310 	h20 w70	vM14,			O
Gui, Add, Text, 	x145 y310 	h20 w70	vR14,			O
Gui, Add, Text, 	x105 y330 	h20 w70	vL15,			O
Gui, Add, Text, 	x125 y330 	h20 w70	vM15,			O
Gui, Add, Text, 	x145 y330 	h20 w70	vR15,			O
Gui, Add, Text, 	x105 y350 	h20 w70	vL16,			O
Gui, Add, Text, 	x125 y350 	h20 w70	vM16,			O
Gui, Add, Text, 	x145 y350 	h20 w70	vR16,			O
Gui, Add, Text, 	x90 y440 	h20 w70	vLastHpColor,		Last Hp Color
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
GuiControl,, L1,
GuiControl,, M1, 	|
GuiControl,, R1,
GuiControl,, L2, 	|
GuiControl,, M2,
GuiControl,, R2, 	|
GuiControl,, L3,
GuiControl,, M3, 	|
GuiControl,, R3,
GuiControl,, L4, 	|
GuiControl,, M4,
GuiControl,, R4, 	|
GuiControl,, L5,
GuiControl,, M5, 	|
GuiControl,, R5,
GuiControl,, L6, 	|
GuiControl,, M6,
GuiControl,, R6, 	|
GuiControl,, L7,
GuiControl,, M7, 	|
GuiControl,, R7,
GuiControl,, L8, 	|
GuiControl,, M8,
GuiControl,, R8, 	|
GuiControl,, L9,
GuiControl,, M9, 	|
GuiControl,, R9,
GuiControl,, L10, 	|
GuiControl,, M10,
GuiControl,, R10, 	|
GuiControl,, L11,
GuiControl,, M11, 	|
GuiControl,, R11,
GuiControl,, L12, 	|
GuiControl,, M12,
GuiControl,, R12, 	|
GuiControl,, L13,
GuiControl,, M13, 	|
GuiControl,, R13,
GuiControl,, L14, 	|
GuiControl,, M14,
GuiControl,, R14, 	|
GuiControl,, L15,
GuiControl,, M15, 	|
GuiControl,, R15,
GuiControl,, L16, 	|
GuiControl,, M16,
GuiControl,, R16, 	|
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
GuiControl,, L1, 	x
GuiControl,, M1, 	x
GuiControl,, R1, 	x
GuiControl,, L2, 	x
GuiControl,, M2, 	x
GuiControl,, R2, 	x
GuiControl,, L3, 	x
GuiControl,, M3, 	x
GuiControl,, R3, 	x
GuiControl,, L4, 	x
GuiControl,, M4, 	x
GuiControl,, R4, 	x
GuiControl,, L5, 	x
GuiControl,, M5, 	x
GuiControl,, R5, 	x
GuiControl,, L6, 	x
GuiControl,, M6, 	x
GuiControl,, R6, 	x
GuiControl,, L7, 	x
GuiControl,, M7, 	x
GuiControl,, R7, 	x
GuiControl,, L8, 	x
GuiControl,, M8, 	x
GuiControl,, R8, 	x
GuiControl,, L9, 	x
GuiControl,, M9, 	x
GuiControl,, R9, 	x
GuiControl,, L10, 	x
GuiControl,, M10, 	x
GuiControl,, R10, 	x
GuiControl,, L11, 	x
GuiControl,, M11, 	x
GuiControl,, R11, 	x
GuiControl,, L12, 	x
GuiControl,, M12, 	x
GuiControl,, R12, 	x
GuiControl,, L13, 	x
GuiControl,, M13, 	x
GuiControl,, R13, 	x
GuiControl,, L14, 	x
GuiControl,, M14, 	x
GuiControl,, R14, 	x
GuiControl,, L15, 	x
GuiControl,, M15, 	x
GuiControl,, R15, 	x
GuiControl,, L16, 	x
GuiControl,, M16, 	x
GuiControl,, R16, 	x
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

$f1::
ExitApp

GuiClose:
ExitApp