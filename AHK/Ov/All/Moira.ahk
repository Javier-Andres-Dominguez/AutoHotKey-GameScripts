#SingleInstance force
#Persistent
#include <AutoHotInterception>

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClic"), true)
return

LateralClick(state){
    if(state){
		Send {XButton2, down}
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
		Click
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4500)
    }else{
        Send {XButton2, up}
    }
}

LateralClic(state){
    if(state){
		Send {XButton2, down}
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
		Click, Right
		AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4500)
    }else{
        Send {XButton2, up}
    }
}

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
	if(GetKeyState("e","P")){
		Send {e}
		Sleep 25
	}
}
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

$NumpadEnter::
Send {Esc}
MouseMove, 1850, 1250
Click
Sleep 100
MouseMove, 2050, 1225
Click
return

$Enter::
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 3200, 1800
		Send {LButton}
}
return


$F2::
Suspend
return

$F1::
ExitApp
return
