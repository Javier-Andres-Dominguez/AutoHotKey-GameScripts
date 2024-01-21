#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)
global BulletN := 0
AHI.SubscribeMouseButton(mouseId, 1, true, Func("RClick"), true)
State := true
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y550	h250 w250, 					Cassidy
return

$Enter::
return

RBRecoil(){
    while(BulletN < 6){
        AHI.Instance.SendMouseMoveRelative(mouseId, 0, 100)
        Sleep 150
        BulletN := BulletN+1
    }
    BulletN := 0
}

RClick(state) {
    if state{
        Click, down, Right
        SetTimer, RBRecoil, -1
    }else{
        Click, up, Right
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

$Space::
while(GetKeyState("Space", "P")){
    Send {Space}
    if(GetKeyState("v", "P")){
        Send {v}
    }
    if(GetKeyState("c", "P")){
        Send {c}
    }
    Sleep 25
}
return

$RShift::
while(GetKeyState("RShift", "P")){
    MouseMove, 1725, 1650
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

$F1::
ExitApp