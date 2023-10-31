#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global stdout := FileOpen("*", "w")
global chatting := false
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
return

LateralClick(state){
    if(state){
		Send {XButton1, down}
        SetTimer, Lop, -1
    }else{
        Send {XButton1, up}
    }
}

Lop(){
	Send {e}
	Send {Space}
	if(GetKeyState("w", "P")){
		Send {w Up}
		Send {s Down}
		AHI.Instance.SendMouseMoveRelative(mouseId, 5454, 0)
		Sleep 200
		AHI.Instance.SendMouseMoveRelative(mouseId, 5454, 0)
		Send {s Up}
		Send {w Down}
	}else{
		AHI.Instance.SendMouseMoveRelative(mouseId, 5454, 0)
		Sleep 200
		AHI.Instance.SendMouseMoveRelative(mouseId, 5454, 0)
	}
}

LateralClickk(state){
    if(state){
		Send {XButton2, down}
        SetTimer, Lopo, -1
    }else{
        Send {XButton2, up}
    }
}

Lopo(){
Send {e}
Send {Space}
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 6000)
Sleep 200
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -2700)
}

$Enter::
Send {Enter}
if(!chatting){
    chatting := true
    stdout.Write("Chat open`n")
    stdout.Read()
}else{
    chatting := false
    stdout.Write("Chat closed`n")
    stdout.Read()
}
return

$Esc::
Send {Esc}
stdout.Write("Esc`n")
stdout.Read()
chatting := false
return

$Space::
if(!chatting){
    while(GetKeyState("Space", "P")){
        Send {Space}
        Sleep 25
        if(GetKeyState("V", "P")){
            Send {v}
        }
        if(GetKeyState("c", "P")){
            Send {c}
        }
    }
}else{
    Send {Space}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 1475, 1700
		Send {LButton}
}
return

$F3::
Reload
return

$F1::
ExitApp