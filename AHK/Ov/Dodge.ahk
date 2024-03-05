slide := false
State := true
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y80 	h80 w70		vStatus, 		O
Gui, Show, 			x5760 y200	h250 w250, 					Dodge

Loop{
    if(slide and !(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
        Random, rand, 1, 2
        if(rand==1){
            Send {a Down}
			Send {d Up}
			Random, rand, 250, 400
			Sleep rand/4
			if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
				Sleep rand/4
				if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
					Sleep rand/4
					if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
						Sleep rand/4
						if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){

						}else{
							if(GetKeyState("A", "P")){

							}else{
								Send {a Up}
							}
						}
					}else{
						if(GetKeyState("A", "P")){

						}else{
							Send {a Up}
						}
					}
				}else{
					if(GetKeyState("A", "P")){

					}else{
						Send {a Up}
					}
				}
			}else{
				if(GetKeyState("A", "P")){

				}else{
					Send {a Up}
				}
			}
        }else{
            Send {d Down}
			Send {a Up}
			Random, rand, 250, 400
			Sleep rand/4
			if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
				Sleep rand/4
				if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
					Sleep rand/4
					if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
						Sleep rand/4
						if(!(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){

						}else{
							if(GetKeyState("D", "P")){

							}else{
								Send {d Up}
							}
						}
					}else{
						if(GetKeyState("D", "P")){

						}else{
							Send {d Up}
						}
					}
				}else{
					if(GetKeyState("D", "P")){

					}else{
						Send {d Up}
					}
				}
			}else{
				if(GetKeyState("D", "P")){

				}else{
					Send {d Up}
				}
			}
        }
    }
}

$f3::
if(slide){
    slide := false
    Send {d Up}
    Send {a Up}
	GuiControl,, Status, 	A
}else{
    slide := true
	GuiControl,, Status, 	V
}
return

$F4::
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
Send {d Up}
Send {a Up}
ExitApp

GuiClose:
ExitApp