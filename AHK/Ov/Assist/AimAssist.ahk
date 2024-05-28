#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
global stdout := FileOpen("*", "w")
global LBDown := false
global mouseYDistance := 0
global xDistanceFromHP := 70
global yDistanceFromHP := 100
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

checkHeight(coords){
    if(coords<0){
        mouseYDistance := -4
    }
    ; If the enemy is under the crossair
    else{
        mouseYDistance := 4
    }
}

chaseEnemy(){
    Click, down
    while(LBDown){
        if(isYellow){
            PixelSearch, OutputVarX, OutputVarY, 1450, 714, 2340, 1496, %magenta%, 15, Fast
        }else{
            PixelSearch, OutputVarX, OutputVarY, 1450, 714, 2340, 1496, red, 15, Fast
        }
        if(OutputVarX != null){
            XHPPoss := OutputVarX-1920+xDistanceFromHP
            YHPPoss := OutputVarY-1080+yDistanceFromHP
            ; If the enemy is on the left:
            if(XHPPoss<0){
                checkHeight(YHPPoss)
                ; If the enemy is on the left but very close:
                if(XHPPoss>-9){
                    ; Be ultra accurate
                    AHI.Instance.SendMouseMoveRelative(mouseId, XHPPoss, mouseYDistance)
                }
                ; If the enemy is on the left, but further:
                else{
                    AHI.Instance.SendMouseMoveRelative(mouseId, -9, mouseYDistance)
                }
            }
            ; If the enemy is on the right:
            else{
                checkHeight(YHPPoss)
                ; If the enemy is on the right but very close:
                if(XHPPoss<9){
                    ; Be ultra accurate
                    AHI.Instance.SendMouseMoveRelative(mouseId, XHPPoss, mouseYDistance)
                }
                ; If the enemy is on the right, but further:
                else{
                    AHI.Instance.SendMouseMoveRelative(mouseId, 9, mouseYDistance)
                }
            }
            ;stdout.Read()
            ;AHI.Instance.SendMouseMoveRelative(mouseId, OutputVarX-1920+60, 0)
            OutputVarX := null
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
    }
}

Boost(){
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
    Click, Right
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
    Sleep 350
    Send {Space}
    ;Send {e}
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