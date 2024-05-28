#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
global stdout := FileOpen("*", "w")
global LBDown := false
global mouseYDistance := 2
global mouseYDistanceFast := 1
global xDistanceFromHP := 70
global yDistanceFromHP := 60
global Ulting := false
global isYellow := true
global yellow := "0X00FFFF"
global magenta := "0xFF00FF"
global red := "0x2810CF|0x1E08CF|0x2319D1|0x554CDA|0x231BD0|0x351BD0|0x5A50D9|0x543ED4|0x4E34D3|0x513BD4|0x5039D2|0x594BD6|0x5848D5|0x5A4FD8|0x523DD2|0x4D20CE|0x5A4CD7"
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
global CurrentState := false
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		X
Gui, Show, 			x5760 y1200	h250 w250, 					MouseWork
Suspend
return

changeRecoil(){
    if(LBDown){
        mouseYDistance := 7
        mouseYDistanceFast := 4
    }
}

chaseEnemy(){
    Click, down
    SetTimer, changeRecoil, 444
    while(LBDown && !Ulting){
        if(isYellow){
            PixelSearch, OutputVarX, OutputVarY, 1450, 714, 2340, 1496, %magenta%, 15, Fast
        }else{
            PixelSearch, OutputVarX, OutputVarY, 1450, 714, 2340, 1496, red, 15, Fast
        }
        if(OutputVarX != null){
            HPPoss := OutputVarX-1920+xDistanceFromHP
            ;stdout.Write("Enemy detected`n")
            ;AHI.Instance.SendMouseMoveAbsolute(mouseId, OutputVarX, OutputVarY)
            ; If the enemy is on the left:
            if(HPPoss<0){
                ; If the enemy is above the crossair:
                /*if(OutputVarY-1080+yDistanceFromHP<0){
                    mouseYDistanceFast := -3
                }
                ; If the enemy is under the crossair
                else{
                    mouseYDistanceFast := 3
                }
                */
                ; If the enemy is on the left but very close:
                if(HPPoss>-9){
                    ; Be ultra accurate
                    AHI.Instance.SendMouseMoveRelative(mouseId, HPPoss, mouseYDistanceFast)
                    ;stdout.Write("Left Up, close`n")
                }
                ; If the enemy is on the left, but further:
                else{
                    AHI.Instance.SendMouseMoveRelative(mouseId, -9, mouseYDistanceFast)
                    ;stdout.Write("Left Up, far`n")
                }
            }
            ; If the enemy is on the right:
            else{
                ; If the enemy is above the crossair:
                /*if(OutputVarY-1080+yDistanceFromHP>0){
                    mouseYDistanceFast := -3
                }
                ; If the enemy is under the crossair
                else{
                    mouseYDistanceFast := 3
                }
                */
                ; If the enemy is on the right but very close:
                if(HPPoss<9){
                    ; Be ultra accurate
                    AHI.Instance.SendMouseMoveRelative(mouseId, HPPoss, mouseYDistanceFast)
                    ;stdout.Write("Right Up, close`n")
                }
                ; If the enemy is on the right, but further:
                else{
                    AHI.Instance.SendMouseMoveRelative(mouseId, 9, mouseYDistanceFast)
                    ;stdout.Write("Right Up, far`n")
                }
            }
            ;stdout.Read()
            ;AHI.Instance.SendMouseMoveRelative(mouseId, OutputVarX-1920+60, 0)
            OutputVarX := null
        }else{
            ;stdout.Write("Normal recoil`n")
            AHI.Instance.SendMouseMoveRelative(mouseId, 0, mouseYDistance)
            Sleep 1
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
            SetTimer, chaseEnemy, -1
        }
    }else{
        LBDown := false
        Click, up
        mouseYDistance := 2
        mouseYDistanceFast := 1
    }
}

Boost(){
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
    Click, Right
    Send {Space}
    Send {e}
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4500)
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        if(CurrentState){
            SetTimer, Boost, -1
        }
    }else{
        Send {XButton2, up}
    }
}

$XButton1::
if(isYellow){
	isYellow := false
	GuiControl,, Status, 	R
}else{
	isYellow := true
	GuiControl,, Status, 	Y
}
return

$z::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
Clipboard := "|"color
return

ultimating(){
    Ulting := false
}

$x::
Send {q}
Send {x}
Ulting := true
SetTimer, ultimating, 7000
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

$F3::
CloseAll()
Reload
return

$F2::
Suspend
if(CurrentState){
    CloseAll()
	CurrentState := false
	GuiControl,, Status, 	X
}else{
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\All\HelperJumper.ahk
	CurrentState := true
    if(isYellow){
        GuiControl,, Status, 	Y
    }else{
        GuiControl,, Status, 	R
    }
}
return

GuiClose:
CloseAll()
ExitApp

$F1::
CloseAll()
ExitApp