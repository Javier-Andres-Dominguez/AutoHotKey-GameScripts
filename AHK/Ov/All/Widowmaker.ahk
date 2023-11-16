#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global RBDown := false
global Color := 0x00FFFF
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