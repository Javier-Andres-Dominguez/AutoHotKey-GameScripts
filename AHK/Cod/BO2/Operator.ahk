Scoping := 0

$RButton::
if(Scoping = 0){
	Send {RButton}
	Send {e down}
	Scoping := 1
	return
}
if(Scoping = 1){
	Send {RButton}
	Send {c up}
	Scoping := 0
	return
}
return

$2::
Send {2}
if (Scoping = 1){
	Send {e up}
	Scoping := 0
	return
}

return

$r::
Send {r}
if(Scoping = 1){
	Send {e up}
	Scoping := 0
	return
}
return

$F::
Send {f}
Scoping := 0
return

$LButton::
Send {LButton}
if(Scoping = 1){
	Send {RButton}
	Send {e up}
	Scoping := 2
	Sleep 1750
	Scoping := 0
}
return

$F2::
Suspend
return

$F1::ExitApp