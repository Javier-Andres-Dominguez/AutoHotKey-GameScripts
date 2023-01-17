;This script is used in the game Overwatch 2 with the hero "Doomfist". It simplifies the usage of the melee hits (shooting right before using the melee attack for free damage).
;This script requires the interception driver installed and to change the values of the mouse id.

#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global Hitting := false

global keyboardId := AHI.GetKeyboardId(0x04D9, 0xA096)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("V"), true, Func("Melee"), true)
global VDown := false
AHI.SubscribeKey(keyboardId, GetKeySC("C"), true, Func("Mele"), true)
global CDown := false
AHI.SubscribeKey(keyboardId, GetKeySC("F1"), true, Func("KillScript"), true)

global mouseId := AHI.GetMouseId(0x093A, 0x2532)
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)

return

KeyEvent(code, state){
    keyname := GetKeyName("SC" Format("{:#.03x}", code))
    ;ToolTip % "Keyboard Key - Code: " keyname ", State: " state
    if state {
        Send {%keyname% Down}
    }
    else {
        Send {%keyname% Up}
    }
}

MeleeFun(){
    While(VDown){
        if (!Hitting){
            Click
            Send {v}
            Hitting := true
            SetTimer ,ChangeTimer, 950
        }
    }
}

ChangeTimer:
	Hitting := false
return

Melee(state) {
    if(state){
        VDown := true
        SetTimer, MeleeFun, -1
    }else{
        VDown := false
    }
}

MeleFun(){
    While(CDown){
        if (!Hitting){
            Click
            Send {c}
            Hitting := true
            SetTimer ,ChangeTimer, 950
        }
    }
}

Mele(state) {
    if(state){
        CDown := true
        SetTimer, MeleFun, -1
    }else{
        CDown := false
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
    }else{
        Click, up, Right
	}
}

KillScript(state) {
    ExitApp
}