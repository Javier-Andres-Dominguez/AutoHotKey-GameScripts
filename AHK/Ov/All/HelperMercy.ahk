$LShift::
Send {. down}
KeyWait, LShift
Send {. up}
return

$LCtrl::
Send {. down}
KeyWait, LCtrl
Send {. up}
return

XButton2::
While(GetKeyState("XButton2", "P")){
	Send {q}
	Sleep 10
}
return