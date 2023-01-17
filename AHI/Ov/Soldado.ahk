;This script is used in the game Overwatch 2 with the hero "Soldier 76". It aims automaticly to the enemies thanks to the color of their hpbars (yellow).
;This script requires the interception driver installed and to change the values of the mouse+keyboard id.
;Remember not to ruin the fun for other people.

#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global LBDown := false
global Yellow := 0x00FFFF
global WeirdRed := 0x1B0ACA
global Ultimating := false
global DistanceX := 20
global DistanceY := 40
global TurningActive := false
AHI.SubscribeMouseButton(mouseId, 0, true, Func("LClick"), true)
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
AHI.SubscribeMouseButton(mouseId, 4, true, Func("ShortMid"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("Long"), true)


global keyboardId := AHI.GetKeyboardId(0x04D9, 0xA096)
AHI.SubscribeKeyboard(keyboardId, true, Func("KeyEvent"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("X"), true, Func("Ultimate"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("M"), true, Func("Change"), true)
AHI.SubscribeKey(keyboardId, GetKeySC("I"), true, Func("Recoil"), true)
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

Change(state){
Run, C:\Users\DEEPGAMING\Downloads\AHK\Scripts\Ov\S76\SoldadoR.ahk
ExitApp
}

Recoil(state){
Run, C:\Users\DEEPGAMING\Downloads\AHK\Scripts\Ov\S76\S76Recoil.ahk
ExitApp
}

Ultimate(state) {
    Send {X}
    Ultimating := true
    SetTimer ,ChangeTimer, 6000
}

ChangeTimer:
	Ultimating := false
return

ShortMid(){
    DistanceX := 20
    DistanceY := 40
}

Long(){
    DistanceX := 10
    DistanceY := 20
}

moveEnemy(){
    Click, down
    if (Ultimating=false){
        while(LBDown = true){
        PixelSearch, OutputVarX, OutputVarY, 700, 500, 1320, 580, %Yellow%, 3, Fast
        if( OutputVarX != null){
            AHI.Instance.SendMouseMoveAbsolute(mouseId, OutputVarX+DistanceX, OutputVarY+DistanceY)
            sleep, 1
        }
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

KillScript(state) {
    ExitApp
}

$F1::
ExitApp