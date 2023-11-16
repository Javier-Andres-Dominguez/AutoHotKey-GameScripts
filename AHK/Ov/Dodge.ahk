slide := false

Loop{
    if(slide and !(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P"))){
        Random, rand, 1, 2
        if(rand==1){
            Send {a Down}
			Send {d Up}
			Random, rand, 300, 600
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
			Random, rand, 300, 600
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

$XButton1::
if(slide){
    slide := false
    Send {d Up}
    Send {a Up}
}else{
    slide := true
}
return

$F3::
Reload
return

$F2::
Suspend
return

$F1::
Send {d Up}
Send {a Up}
ExitApp