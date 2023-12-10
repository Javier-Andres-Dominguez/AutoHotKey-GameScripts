#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
global stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
State := false
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Ashe
return

LateralClick(state){
    if(state){
		Send {XButton1, down}
        SetTimer, GoFoward, -1
    }else{
        Send {XButton1, up}
    }
}

GoFoward(){
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
        SetTimer, GoUp, -1
    }else{
        Send {XButton2, up}
    }
}

GoUp(){
Send {e}
Send {Space}
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 6000)
Sleep 200
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -2700)
}

$Enter::
return

$c::
while(GetKeyState("c","P")){
	Send {c}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$v::
while(GetKeyState("v","P")){
	Send {v}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return

$Space::
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
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 1475, 1700
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
	GuiControl,, Status, 	O
}else{
	State := true
	GuiControl,, Status, 	X
}
return

$F1::
ExitApp