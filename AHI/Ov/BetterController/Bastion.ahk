#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
return

Cameramovee(){
stdout.Write("Bosst yourself`n")
stdout.Read()
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
Click, Right
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
Sleep 350
Send {Space}
Send {e}
}

Cameramove(){
stdout.Write("Bosst yourself`n")
stdout.Read()
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
Click, Right
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
Sleep 350
Send {Space}
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        SetTimer, Cameramove, -1
    }else{
        Send {XButton2, up}
    }
}

LateralClickk(state){
    if(state){
		Send {XButton1, down}
        SetTimer, Cameramovee, -1
    }else{
        Send {XButton1, up}
    }
}

$Enter::
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
return

$F3::
Reload
return

$F1::
ExitApp