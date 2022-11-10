;Remember!! This script includes AutoHotInterception, if you don´t have it installed it won´t work. Also remember to change your MouseId and KeyBoardId.
;This script is used in the game Overwatch 2 with the character: "Reaper" to aim enemies with Right click
;Controls: F1(Exits the script), Right Click(Aims to enemies)
#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global RBDown := false
global Color := 0x522FEF
global Loop := 0
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
return

moveR(){
    while(RBDown = true){
        PixelSearch, OutputVarX, OutputVarY, 900, 500, 1020, 580, %Color%, 5, Fast
        if( OutputVarX != null or OutputVarY != null){
            AHI.Instance.SendMouseMoveAbsolute(mouseId, OutputVarX+10, OutputVarY+20)
            sleep, 1
        }
    }
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
        RBDown := true
        SetTimer, moveR, -1
    }else{
        Click, up, Right
        RBDown := false
	}
}

$F1::
ExitApp