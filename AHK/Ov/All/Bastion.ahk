#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
State := false
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		X
Gui, Show, 			x5760 y1147	h250 w250, 					Bastion
Suspend
return

BoostYou(){
stdout.Write("Bosst yourself`n")
stdout.Read()
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
Click, Right
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
Sleep 350
Send {Space}
}

BoostYouAndAttack(){
BoostYou()
Send {e}
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        SetTimer, BoostYou, -1
    }else{
        Send {XButton2, up}
    }
}

LateralClickk(state){
    if(state){
		Send {XButton1, down}
        SetTimer, BoostYouAndAttack, -1
    }else{
        Send {XButton1, up}
    }
}

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

$RShift::
while(GetKeyState("RShift", "P")){
    MouseMove, 1600, 1650
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