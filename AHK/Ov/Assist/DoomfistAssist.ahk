#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
global stdout := FileOpen("*", "w")
global LBDown := false
global RBDown := false
global mouseYDistance := 0
global xDistanceFromHP := 80
global yDistanceFromHP := 100
global isYellow := true
global yellow := "0X00FFFF"
global magenta := "0xFF00FF"
global red := "0x2810CF|0x1E08CF|0x2319D1|0x554CDA|0x231BD0|0x351BD0|0x5A50D9|0x543ED4|0x4E34D3|0x513BD4|0x5039D2|0x594BD6|0x5848D5|0x5A4FD8|0x523DD2|0x4D20CE|0x5A4CD7"
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
global CurrentState := false
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		X
Gui, Show, 			x5760 y1200	h250 w250, 					MouseWork
Suspend
return

chaseEnemy(){
    while(LBDown || RBDown){
        if(isYellow){
            PixelSearch, OutputVarX, OutputVarY, 1450, 714, 2340, 1496, %magenta%, 15, Fast
        }else{
            PixelSearch, OutputVarX, OutputVarY, 1450, 714, 2340, 1496, red, 15, Fast
        }
        if(OutputVarX != null){
            XHPPoss := OutputVarX-1920+xDistanceFromHP
            ; If the enemy is on the left:
            if(XHPPoss<0){
                ; If the enemy is on the left but very close:
                if(XHPPoss>-9){
                    ; Be ultra accurate
                    AHI.Instance.SendMouseMoveRelative(mouseId, XHPPoss, 0)
                }
                ; If the enemy is on the left, but further:
                else{
                    AHI.Instance.SendMouseMoveRelative(mouseId, -15, 0)
                }
            }
            ; If the enemy is on the right:
            else{
                ; If the enemy is on the right but very close:
                if(XHPPoss<9){
                    ; Be ultra accurate
                    AHI.Instance.SendMouseMoveRelative(mouseId, XHPPoss, 0)
                }
                ; If the enemy is on the right, but further:
                else{
                    AHI.Instance.SendMouseMoveRelative(mouseId, 15, 0)
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
			Click, down
            xDistanceFromHP := 80
            SetTimer, chaseEnemy, -1
        }
    }else{
        LBDown := false
        Click, up
    }
}

RClick(state) {
    if (state) {
        RBDown := true
        if(!CurrentState){
            Send {RButton Down}
        }else{
            Send {RButton Down}
            xDistanceFromHP := 70
            SetTimer, chaseEnemy, -1
        }
    }else{
        RBDown := false
        Send {RButton Up}
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
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\All\HelperDoomfist.ahk
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