﻿State := false
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		X
Gui, Show, 			x5760 y1200	h250 w250, 					Doomfist
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

$e::
while(GetKeyState("e","P")){
	Send {e}
	Sleep 50
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 625, 1650
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
Reload
return

$F2::
Suspend
if(CurrentState){
    CloseAll()
	CurrentState := false
	GuiControl,, Status, 	X
    return
}else{
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\All\HelperDoomfist.ahk
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