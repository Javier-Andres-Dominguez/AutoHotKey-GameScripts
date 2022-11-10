;Remember!! This script includes AutoHotInterception, if you don´t have it installed it won´t work. Also remember to change your MouseId and KeyBoardId.
;This script is used in the game Overwatch 2 with the character: "Soldier: 76" to have no recoil
;Controls: F1(Exits the script), Click(Moves your mouse down for you to have almost no recoil)
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
    Send {MButton}
    while(LBDown = true){
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, mouseDistance)
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        mouseLoop++
        sleep, 1
        if(mouseLoop >= 340){
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