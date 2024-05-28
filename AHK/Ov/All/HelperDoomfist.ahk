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
	if(GetKeyState("E", "P")){
		Send {e}
	}
}
return

$e::
while(GetKeyState("e","P")){
	Send {e}
	Sleep 50
	if(GetKeyState("Space", "P")){
		Send {Space}
	}
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
	if(GetKeyState("V", "P")){
		Send {v}
	}
	if(GetKeyState("E", "P")){
		Send {e}
	}
}
return