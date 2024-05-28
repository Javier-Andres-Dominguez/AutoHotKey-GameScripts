$Space::
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 50
	if(GetKeyState("V", "P")){
		Send {v}
	}
	if(GetKeyState("C", "P")){
		Send {c}
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

$v::
while(GetKeyState("v","P")){
	Send {v}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
}
return