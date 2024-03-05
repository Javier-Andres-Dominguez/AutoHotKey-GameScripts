State := true
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Genji
return

$Enter::
return

$x::
Send {c}
Send {x}
return

$q::
Send {RButton}
Send {q}
return

$e::
Send {RButton}
Send {e}
Sleep 50
return

$RShift::
while(GetKeyState("RShift", "P")){
    MouseMove, 1980, 1650
    Send {LButton}
}
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
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