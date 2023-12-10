#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x093A, 0x2532)
stdout := FileOpen("*", "w")
AHI.SubscribeMouseButton(mouseId, 4, true, Func("LateralClick"), true)
AHI.SubscribeMouseButton(mouseId, 3, true, Func("LateralClickk"), true)
State := false
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Bastion
return

BoostYou(){
stdout.Write("Bosst yourself`n")
stdout.Read()
AHI.Instance.SendMouseMoveRelative(mouseId, 0, 10000)
Click, Right
AHI.Instance.SendMouseMoveRelative(mouseId, 0, -4300)
Sleep 350
Send {Space}
}

BoostYouAndAttack(){
BoostYou()
Send {e}
}

LateralClick(state){
    if(state){
		Send {XButton2, down}
        SetTimer, BoostYou, -1
    }else{
        Send {XButton2, up}
    }
}

LateralClickk(state){
    if(state){
		Send {XButton1, down}
        SetTimer, BoostYouAndAttack, -1
    }else{
        Send {XButton1, up}
    }
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
    MouseMove, 1600, 1650
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