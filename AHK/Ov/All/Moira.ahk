#SingleInstance force
#Persistent
#include <AutoHotInterception>

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClic"), true)
State := true
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Moira
return

$Enter::
return

LateralClick(state){
    if(state){
		Send {XButton2, down}
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
		Click
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
    }else{
        Send {XButton2, up}
    }
}

LateralClic(state){
    if(state){
		Send {XButton2, down}
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
		Click, Right
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
    }else{
        Send {XButton2, up}
    }
}

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

$+Space::
$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
	if(GetKeyState("V", "P")){
		Send {v}
		Sleep 25
	}
	if(GetKeyState("C", "P")){
		Send {c}
		Sleep 25
	}
}
return

$RShift::
while(GetKeyState("RShift", "P")){
	MouseMove, 3200, 1800
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

$f3::
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

$F1::
ExitApp
return