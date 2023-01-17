;This aimbot is used in the game Overwatch 2 with any hero without recoil scanning a bigger size of the screen for enemies.
;This script requires the interception driver installed and to change the values of the mouse id.
;Remember not to ruin the fun for other people.

#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global LBDown := false
global Color := 0x00FFFF
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
return



moveEnemy(){
    Click, down
    while(LBDown = true){
        PixelSearch, OutputVarX, OutputVarY, 700, 300, 1320, 780, %Color%, 5, Fast
        if( OutputVarX != null or OutputVarY != null){
            AHI.Instance.SendMouseMoveAbsolute(mouseId, OutputVarX+20, OutputVarY+40)
        }
    }
}

LClick(state) {
    if (state) {
        LBDown := true
        SetTimer, moveEnemy, -1
    }else
        LBDown := false
        Click, up
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