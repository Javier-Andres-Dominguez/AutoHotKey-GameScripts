$RShift::
while(GetKeyState("RShift", "P")){
    MouseMove, 2000, 1675
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

$x::
Send {c}
Send {x}
return

$q::
Send {RButton}
Send {q}
return

$e::
Send {RButton}
Send {e}
Sleep 50
return

$F3::
Reload
return

$F2::
Suspend
return

$F1::
ExitApp