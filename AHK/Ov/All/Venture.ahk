State := false
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		X
Gui, Show, 			x5760 y1147	h250 w250, 					Venture
Suspend
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

$Enter::
return

$RButton::
Click
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 2350, 1800
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
CloseAll()
Suspend
return

$F3::
Suspend
if(State){
	State := false
	GuiControl,, Status, 	O
}else{
	State := true
	GuiControl,, Status, 	X
}
return

$F2::
Suspend
if(CurrentState){
    CloseAll()
	CurrentState := false
	GuiControl,, Status, 	X
    return
}else{
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\All\HelperJumper.ahk
	CurrentState := true
	GuiControl,, Status, 	O
    return
}

GuiClose:
CloseAll()
ExitApp

$F1::
CloseAll()
ExitApp