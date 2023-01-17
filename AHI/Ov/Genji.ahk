;This script is used in the game Overwatch 2 with the hero "Genji". It simplifies the usage of the melee hits (shooting right before using the melee attack for free damage), using your dash (shooting right before using the dash for free damage) with the E and the ultimate (It uses the dash right before the ultimate if you have it).
;This script requires the interception driver installed and to change the values of the mouse id.

#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global Hitting := false

global keyboardId := AHI.GetKeyboardId(0x04D9, 0xA096)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("X"), true, Func("Ultimate"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("E"), true, Func("Dash"), true)
global EDown := false
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

DashFun(){
    While(EDown){
        Click Right
        Send {e}
    }
}

Dash(state) {
    if(state){
        EDown := true
        SetTimer, DashFun, -1
    }else{
        EDown := false
    }
}

Ultimate(state) {
    Send {e}
    Sleep 200
    Send {x}
}

MeleeFun(){
    While(VDown){
        if (!Hitting){
            Click Right
            Send {v}
            Hitting := true
            SetTimer ,ChangeTimer, 1165
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
            Click Right
            Send {c}
            Hitting := true
            SetTimer ,ChangeTimer, 1165
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