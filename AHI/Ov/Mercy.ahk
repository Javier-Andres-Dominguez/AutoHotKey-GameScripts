;This script is used in the game Overwatch 2 with the hero "Mercy". It has an aimbot while using the weapon changing with the number 2 for the pistol.
;This script requires the interception driver installed and to change the values of the mouse id.
;Remember not to ruin the fun for other people.

#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global keyboardId := AHI.GetKeyboardId(0x04D9, 0xA096)
global LBDown := 0
global Gun := 0
global Color := 0x00FFFF
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"), true)
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
AHI.SubscribeKey(keyboardId, GetKeySC(1), true, Func("Heal"), true)
AHI.SubscribeKey(keyboardId, GetKeySC(2), true, Func("Gun"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("F1"), true, Func("KillScript"), true)
return

Heal(state){
    Gun := 0
    if state {
        Send {1 Down}
    }
    else {
        Send {1 Up}
    }
}

Gun(state){
    Gun := 1
    if state {
        Send {2 Down}
    }
    else {
        Send {2  Up}
    }
}

KeyEvent(code, state){
    keyname := GetKeyName("SC" Format("{:#.03x}", code))
    if state {
        Send {%keyname% Down}
    }
    else {
        Send {%keyname% Up}
    }
}

moveL(){
    Click, down
    while(LBDown = 1 and Gun = 1){
        PixelSearch, OutputVarX, OutputVarY, 7000, 500, 1320, 580, %Color%, 5, Fast
        if( OutputVarX != null or OutputVarY != null){
            AHI.Instance.SendMouseMoveAbsolute(mouseId, OutputVarX+10, OutputVarY+20)
            sleep, 1
        }
    }
}

LClick(state) {
    if (state) {
        LBDown := 1
        SetTimer, moveL, -1
    }else{
        LBDown := 0
        Click, up
    }
}
RClick(state) {
    if state{
        Click, down, Right
    }else{
        Click, up, Right
	}
}

KillScript(state) {
    ExitApp
}