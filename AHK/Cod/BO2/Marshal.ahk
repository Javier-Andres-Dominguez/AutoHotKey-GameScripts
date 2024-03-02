Marshal := 1
Scoping := 0

$LButton::
Send {LButton}
if(Scoping = 1){
	Send {RButton}
	Scoping := 2
	Sleep 750
	Scoping := 0
	return
}
if(Marshal = 1){
	Sleep 750
	return
}
return

$RButton::
Send {RButton}

if(Scoping = 0){
	Scoping := 1
	return
}
if(Scoping = 1){
	Scoping := 0
	return
}
return

$2::
Send {2}
Scoping := 0
if(Marshal = 1){
	Marshal := 0
	return
}
if(Marshal = 0){
	Marshal := 1
	return
}
return

$f::
Send {f}
Marshal := 1
Scoping := 0
return

$F2::
Suspend
return

$F1::ExitApp