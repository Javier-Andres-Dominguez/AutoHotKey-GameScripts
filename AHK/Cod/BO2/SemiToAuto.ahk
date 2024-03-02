State := false
Crazyness := false
Semi := false
Gui, Font, s60
Gui, Add, Text, 	x90 y50 	h80 w70		vStatus, 		O
Gui, Font, s15
Gui, Add, Text, 	x90 y160 	h20 w70		vWType,         Auto
Gui, Add, Text, 	x90 y200 	h20 w70		vCrazy,         Normal
Gui, Show, 			x5760 y550	h250 w250, 					Semi2Auto

Loop{
	if(Crazyness){
		if(!GetKeyState("w","P") && !GetKeyState("a","P") && !GetKeyState("s","P") && !GetKeyState("d","P")
		&& !GetKeyState("LButton","P") && !GetKeyState("RButton","P") && !GetKeyState("2","P") && !GetKeyState("Space","P")){
			Send {f}
		}
	Sleep 100
	}
}
return

^$LButton::
+$LButton::
$LButton::
if(Semi){
	While GetKeyState("LButton","P"){
		Click
		Sleep 60
		if(GetKeyState("Space","P")){
			Send {Space}
		}
	}
}else{
	Click, Down
	While GetKeyState("LButton","P"){

	}
	Click, Up
}
return

$WheelUp::
$WheelDown::
^$2::
+$2::
$2::
while(GetKeyState("2", "P")){
	Send {2}
	Sleep 50
	Send {2}
}
return

$f4::
if(Crazyness){
	Crazyness := false
	GuiControl,, Crazy, 	Normal
	return
}else{
	Crazyness := true
	GuiControl,, Crazy, 	CRAZY
	return
}

$f3::
if(Semi){
	Semi := false
	GuiControl,, WType, 	Auto
	return
}else{
	Semi := true
	GuiControl,, WType, 	Semi
	return
}

$F2::
Suspend
if(State){
	State := false
	GuiControl,, Status, 	O
	return
}else{
	State := true
	GuiControl,, Status, 	X
	return
}

GuiClose:
ExitApp

$F1::
ExitApp