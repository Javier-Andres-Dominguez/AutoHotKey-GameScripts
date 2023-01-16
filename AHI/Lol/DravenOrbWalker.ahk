;This script is used in the game League of Legends with the champion "Ashe". It automaticly aims champions in your Attack range and aims habilities to them.
;Remember that this is for fun, don´t ruin other people fun.

;Interface
WPercent := [20,25,30,35,40]
Gui, Add, Text, x95 y0, Imput your
Gui, Add, Text, x45 y40, Attack Speed:
Gui, Add, Text, x150 y40, W level:
Gui, Add, Edit, x45 y70 h20 w70 vAs,
Gui, Add, Edit, x135 y70 h20 w70 vWLvl,
Gui, Add, Button, x90 y150 h20 w70 gcalculate, Kite!
Gui, Show, h200 w250, Kitear

return

calculate:																;Sets the time you have to wait between attacking and moving and the W percent
{
	GuiControlGet, As
	GuiControlGet, WLvl
	Time := (((1000)/As)/3)
	PercentToUse := WPercent [WLvl]
}

$space::																;While pressing space it is moving and scanning for enemy champions
send {Space}
while GetKeyState("space","P"){
	;Move
	Send {space down}
	Send {RButton}
	Sleep ((Time/3)/2)
	Send {RButton}
	Sleep ((Time/3)/2)
	Send {RButton}
	Sleep ((Time/3)/2)
	;Look for enemy
	PixelSearch, OutputVarX, OutputVarY, 508, 140, 1294, 864, 0x1B269A, 1, Fast
	;If enemy found do:
	if(OutputVarX!=null or OutputVarY!=null){
		;Get your mouse positivon before moving it
		MouseGetPos X, Y
		;Move your mose to the enemy
		MouseMove, OutputVarX+35, OutputVarY+75, 0
		;Attack him
		Send {x}
		;Get your mouse back to where it was
		MouseMove, X, Y, 0
		Sleep Time
	}
	;Keep moving
	Send {RButton}
	Sleep ((Time/3)/2)
	Send {RButton}
	Sleep ((Time/3)/2)
	Send {RButton}
	Sleep ((Time/3)/2)
}
send {space up}
return

$q::																	;Activates the Q
Send {q}
return

$w::																	;Activates the W whiche reduces "Time" for 3 seconds
Send {w}
Time := (((1000)/(As+(((0.679*PercentToUse)/100))))/3)
SetTimer ,ChangeTimer, 3000
return


ChangeTimer:															;Returns to orignial time at the end of W
	GuiControlGet, As
	Time := (((1000)/As)/3)
return

$e::																	;Activates the E
PixelSearch, OutputVarX, OutputVarY, 0, 0, 1960, 1080, 0x1B269A, 1, Fast
MouseGetPos X, Y
MouseMove, OutputVarX+45, OutputVarY+85, 0
Send {e}
MouseMove, X, Y, 0
return

$r::																	;Activates de R and aims it automaticly
PixelSearch, OutputVarX, OutputVarY, 0, 0, 1960, 1080, 0x1B269A, 1, Fast
MouseGetPos X, Y
MouseMove, OutputVarX+50, OutputVarY+100, 0
Send {r}
MouseMove, X, Y, 0
return

$f2::																	;Suspend the script
Suspend
return

$f1::																	;Exits the script
ExitApp

GuiClose:																;Exits the script
ExitApp