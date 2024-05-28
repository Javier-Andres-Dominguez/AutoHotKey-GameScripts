#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
stdout := FileOpen("*", "w")
global LBDown := false
global mouseDistance := 2
global hardRecoil := false
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
global CurrentState := false
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		X
Gui, Show, 			x5760 y1200	h250 w250, 					Soldier 76
Suspend
return

changeRecoil(){
    if(LBDown){
        hardRecoil := true
    }
}

moveDown(){
    Click, down
    SetTimer, changeRecoil, 444
    while(LBDown){
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, mouseDistance)
        sleep 1
        if(hardRecoil){
            mouseDistance := 6
        }
    }
}

LClick(state) {
    if (state) {
        LBDown := true
        if(!CurrentState){
            Click, Down
        }else{
            ;Send {MButton}
            SetTimer, moveDown, -1
        }
    }else{
        LBDown := false
        Click, up
        mouseDistance := 2
        hardRecoil := false
    }
}

Boost(){
    stdout.Write("Boost yourself`n")
    stdout.Read()
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
    Click, Right
    Send {Space}
    Send {e}
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4500)
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        SetTimer, Boost, -1
    }else{
        Send {XButton2, up}
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
*/

$x::
Send {q}
Send {x}
stdout.Write("Ulting`n")
stdout.Read()
return

$RShift::
while(GetKeyState("RShift", "P")){
    MouseMove, 1750, 1800
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
CurrentState := false
GuiControl,, Status, 	X
CloseAll()
Suspend
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