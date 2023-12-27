stdout := FileOpen("*", "w")
State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Lucio
return

$XButton2::
Send {Space Down}
while(GetKeyState("XButton2","P")){

}
Send {Space Up}
return

$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
}
return

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