#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
stdout := FileOpen("*", "w")
global chatting := false
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
return

Lopo(){
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
Click
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -2100)
Send {Space}
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        SetTimer, Lopo, -1
		stdout.Write("Bosst yourself`n")
		stdout.Read()
    }else{
        Send {XButton2, up}
    }
}

Lop(){
	Send {q}
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
		Send {XButton1, down}
        SetTimer, Lop, -1
    }else{
        Send {XButton1, up}
    }
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

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 2500, 1695
	Send {LButton}
}
return

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
Click
return

$f2::
Suspend
return

$F3::
Reload
return

$f1::
ExitApp