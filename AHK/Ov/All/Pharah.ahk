#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Pharah
return

$Enter::
return

BoostYou(){
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
Click
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -2100)
Send {Space}
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        SetTimer, BoostYou, -1
		stdout.Write("Bosst yourself`n")
		stdout.Read()
    }else{
        Send {XButton2, up}
    }
}

MoveFoward(){
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
        SetTimer, MoveFoward, -1
    }else{
        Send {XButton1, up}
    }
}

$x::
Click
Send {x}
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
State := false
GuiControl,, Status, 	X
Suspend
return

$F3::
Reload
return

$F2::
Suspend
if(State){
	State := false
	GuiControl,, Status, 	X
}else{
	State := true
	GuiControl,, Status, 	O
}
return

$f1::
ExitApp