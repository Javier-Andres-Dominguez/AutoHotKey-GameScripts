$c::
Click
Send {c}
return

$RShift::
while(GetKeyState("RShift", "P")){
		MouseMove, 2100, 1700
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

$f1::
ExitApp