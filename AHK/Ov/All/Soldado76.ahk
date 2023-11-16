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
return

moveDown(){
    Click, down
    while(LBDown = true){
        if(GetKeyState("Space", "P")){
            Send {Space}
        }
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, mouseDistance)
        mouseLoop += 15
        sleep, 1
        if(mouseLoop >= 400){
            mouseDistance := 6
        }
    }
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

LClick(state) {
    if (state) {
        LBDown := true
        Send {MButton}
        */
        SetTimer, moveDown, -1
    }else
        LBDown := false
        Click, up
        mouseLoop := 0
        mouseDistance := 1
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
    MouseMove, 1800, 1800
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
return

$F3::
Reload
return

$F2::
Suspend
return

$F1::
Send {d Up}
Send {a Up}
ExitApp