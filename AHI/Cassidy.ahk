;Remember!! This script includes AutoHotInterception, if you don´t have it installed it won´t work. Also remember to change your MouseId and KeyBoardId.
;This script is used in the game Overwatch 2 with the character: "Cassidy" to have "legal aimbot" or "very good aim" without beeing very suspicious
;Controls: F1(Exits the script), Click(Follows enemy Hp bars (close to your corssair) and aim down them to hit the enmies), Right Click(As the character has a big recoil it sends your mouse 6 times down to have no recoil)
#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global LBDown := false
global Color := 0x522FEF
global Loop := 0
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
return

moveL(){
    Click, down
    while(LBDown = true){
        PixelSearch, OutputVarX, OutputVarY, 930, 520, 990, 560, %Color%, 5, Fast
        if( OutputVarX != null or OutputVarY != null){
            AHI.Instance.SendMouseMoveAbsolute(mouseId, OutputVarX+10, OutputVarY+20)
            sleep, 1
        }
    }
}

moveR(){
    while(Loop < 6){
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, 80)
        sleep, 150
        Loop := Loop+1
    }
    Loop := 0
}

LClick(state) {
    if (state) {
        LBDown := true
        SetTimer, moveL, -1
    }else
        LBDown := false
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

$F1::
ExitApp