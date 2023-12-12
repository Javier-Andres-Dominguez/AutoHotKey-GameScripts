#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
stdout := FileOpen("*", "w")
global LBDown := false
global mouseDistance := 2
global mouseLoop := 0
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
State := false
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Soldier 76
return

moveDown(){
    Click, down
    while(LBDown){
        if(GetKeyState("Space", "P")){
            Send {Space}
        }
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, mouseDistance)
        mouseLoop += 15
        sleep 1
        if(mouseLoop >= 400){
            mouseDistance := 6
        }
    }
}

LClick(state) {
    if (state) {
        LBDown := true
        ;Send {MButton}
        SetTimer, moveDown, -1
    }else
        LBDown := false
        Click, up
        mouseLoop := 0
        mouseDistance := 1
}

Boost(){
    stdout.Write("Boost yourself`n")
    stdout.Read()
    AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
    Click, Right
    Send {Space}
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

$Enter::
return

$x::
Send {q}
Send {x}
stdout.Write("Ulting`n")
stdout.Read()
return

$Space::
while(GetKeyState("Space", "P")){
    Send {Space}
    Sleep 25
    if(GetKeyState("V", "P")){
        Send {v}
    }
    if(GetKeyState("c", "P")){
        Send {c}
    }
}
return

$RShift::
while(GetKeyState("RShift", "P")){
    MouseMove, 1780, 1800
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
	GuiControl,, Status, 	O
}else{
	State := true
	GuiControl,, Status, 	X
}
return

$F1::
ExitApp