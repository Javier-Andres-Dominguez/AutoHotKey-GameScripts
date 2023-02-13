;This script is used in the game Overwatch 2 with the hero "Soldier 76". This script will remove almost completly your recoil. If you have any problems you migth have to change your game sensitivity or the values of "mouseDistance" from the script
;This script requires the interception driver installed and to change the values of the mouse id.

#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global LBDown := false
global mouseDistance := 1
global mouseLoop := 0
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
return

moveDown(){
    Click, down
    while(LBDown = true){
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, mouseDistance)
        mouseLoop += 15
        sleep, 1
        if(mouseLoop >= 400){
            mouseDistance := 4
        }
    }
}

LClick(state) {
    if (state) {
        LBDown := true
        SetTimer, moveDown, -1
    }else
        LBDown := false
        Click, up
        mouseLoop := 0
        mouseDistance := 1
}
RClick(state) {
    if state{
        Click, down, Right
    }else{
        Click, up, Right
	}
}

$F1::
ExitApp
