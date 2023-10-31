#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global Loop := 0
global chatting := false
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
return

moveR(){
    while(Loop < 6){
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, 100)
        sleep, 150
        Loop := Loop+1
    }
    Loop := 0
}

LClick(state) {
    if (state) {
        Click, down
    }else
        Click, up
}
RClick(state) {
    if state{
        Click, down, Right
        SetTimer, moveR, -1
    }else{
        Click, up, Right
	}
}

$Esc::
Send {Esc}
chatting := false
return

$Space::
if(!chatting){
    while(GetKeyState("Space", "P")){
        Send {Space}
        if(GetKeyState("e", "P")){
            Send {e}
        }
        if(GetKeyState("v", "P")){
            Send {v}
        }
        Sleep 25
    }
}else{
    Send {Space}
}
return

$F1::
ExitApp