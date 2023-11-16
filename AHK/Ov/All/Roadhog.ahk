#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()

global keyboardId := AHI.GetKeyboardId(0x04D9, 0xA096)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("E"), true, Func("Survive"), true)
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

Survive(state) {
    Click, Right
    Send {e}
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