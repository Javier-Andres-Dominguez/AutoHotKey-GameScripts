State := false
HD := false
;Interface
Gui, Add, Text, 	x80 y0, 								Choose resolution
Gui, Add, Button, 	x0 y20 		h80 w250	gResolutionHD,	HD
Gui, Add, Button, 	x0 y100 	h80 w250	gResolution4K,	4k
Gui, Font, s60
Gui, Add, Text, 	x90 y190 	h80 w70		vStatus, 		X
Gui, Font, s20
Gui, Add, Text, 	x60 y350 	h80 w140	vHealingOrb 	c0xFFF000, 	X
Gui, Add, Text, 	x170 y350 	h80 w140	vDiscordOrb 	c0xD661AE, 	X
Gui, Show, 			x5760 y550	h500 w250, 					Zenyatta

Loop{
	if(State){
		if(!HD){
			PixelGetColor, AllyHealing, 1588, 1969
			PixelGetColor, AllyHealed, 1710, 1969
			PixelGetColor, EnemyDiscord, 2128, 1969
		}else{
			PixelGetColor, AllyHealing, 794, 984
			PixelGetColor, AllyHealed, 855, 984
			PixelGetColor, EnemyDiscord, 1064, 984
		}
		if(AllyHealing!="0xFFFFFF"){
			GuiControl,, HealingOrb, 	X
		}else{
			If(AllyHealed!="0xFFFFFF"){
				GuiControl,, HealingOrb, 	O
			}else{
				GuiControl,, HealingOrb, 	P
				Send {e}
			}
		}
		if(EnemyDiscord!="0xFFFFFF"){
			GuiControl,, DiscordOrb, 	X
			Send {q}
		}else{
			GuiControl,, DiscordOrb, 	O
		}
	}
}

ResolutionHD:
{
	HD := true
}

Resolution4K:
{
	HD := false
}

$Enter::
return

$LButton::
Send {LButton Down}
While(GetKeyState("LButton","P")){
	If(GetKeyState("XButton2", "P")){
		Send {q}
	}
	Sleep 25
	if(GetKeyState("Space", "P")){
		Send {space}
	}
}
Send {LButton Up}
return

$q::
Send {q}
Send {MButton}
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

$e::
while(GetKeyState("e","P")){
	Send {e}
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
while(GetKeyState("Space","P")){
	Send {Space}
	Sleep 25
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

$RShift::
while(GetKeyState("RShift", "P")){
	if(!HD){
		MouseMove, 3325, 1800
	}else{
		MouseMove, 1662, 900
	}
	Send {LButton}
}
return

$NumpadEnter::	;Get out of the game
Send {Esc}
Sleep 100
if(!HD){
	MouseMove, 1850, 1250
}else{
	MouseMove, 925, 625
}
Click
Sleep 100
if(!HD){
	MouseMove, 2075, 1215
}else{
	MouseMove, 1037, 607
}
Click
State := false
GuiControl,, State, 	X
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

$f1::
ExitApp