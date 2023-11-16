#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global LBDown := false

AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)

global keyboardId := AHI.GetKeyboardId(0x04D9, 0xA096)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("F1"), true, Func("KillScript"), true)
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

Lop(){
    Send {XButton1, down}
    While(LBDown = true){
        AHI.Instance.SendMouseMoveRelative(mouseId, 2727, 0)
        Sleep 20
        AHI.Instance.SendMouseMoveRelative(mouseId, 2727, 0)
        Sleep 20
        AHI.Instance.SendMouseMoveRelative(mouseId, 2727, 0)
        Sleep 20
        AHI.Instance.SendMouseMoveRelative(mouseId, 2727, 0)
        Sleep 20
    }
}

LateralClick(state){
    if(state){
        LBDown := true
        SetTimer, Lop, -1
    }else{
        LBDown := false
        Send {XButton1, up}
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

$F1::
ExitApp