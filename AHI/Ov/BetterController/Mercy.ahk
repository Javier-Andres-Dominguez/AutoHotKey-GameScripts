White := 0xFFFFFF
Bastion := "0xF"
Blue := "0xFFD"
Orange := "FF"
stdout := FileOpen("*", "w")

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
i := 0
Loop{
	stdout.Write("✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔️✔✔️✔️✔️✔️✔️✔✔✔✔️✔✔️✔✔️`n")
	i+=1
}
Until i==50
stdout.Read()
i := 0
*/
Loop{
	PixelGetColor lastHpColor, 1978, 1430
	PixelGetColor antiHeal, 1905, 1467
	/*stdout.Write("LAST HP COLOR: ")
	stdout.Write(lastHpColor)
	stdout.Write("`n")
	stdout.Read()
	*/
	if(antiHeal==White || lastHpColor==White || SubStr(lastHpColor, 1, 5)==Blue || SubStr(lastHpColor, 7, 8)==Orange){
		Send {RButton Down}
	}else{
		Send {RButton Up}
	}
}
Until (!GetKeyState("LButton", "P"))
Loop{
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
return

$f1::
ExitApp