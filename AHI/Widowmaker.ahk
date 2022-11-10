;Remember!! This script includes AutoHotInterception, if you don´t have it installed it won´t work. Also remember to change your MouseId and KeyBoardId.
;This script is used in the game Overwatch 2 with the character: "Widowmaker" to have "legal triggerbot" but it is not very accurate.
;Controls: F1(Exits the script), RightClick(While you are aiming if any enemy HP bar passes above your crossair it shoots and sleeps to charge 100% of the power)
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
        PixelSearch, OutputVarX, OutputVarY, 959, 500, 961, 541, %Color%, 5, Fast
        if( OutputVarX != null or OutputVarY != null){
            Click, Down
            Click, Up
            sleep, 1500
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