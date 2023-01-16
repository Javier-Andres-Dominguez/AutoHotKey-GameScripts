;This script is used in the game League of Legends with the champion "Ashe". It automaticly aims champions in your Attack range and aims habilities to them.
;Remember that this is for fun, don´t ruin other people fun.

;This script is still on develop, as the passive gives you extra Attack speed and I do not know how to apply it porperly yet.

;Interface
Gui, Add, Text, x75 y0, Imput your AttackSpeed:
Gui, Add, Edit, x90 y40 h20 w70 vAs,
Gui, Add, Button, x45 y150 h20 w70 gcalculate, Kite!
Gui, Add, Button, x135 y150 h20 w70 gmax, Lvl16!
Gui, Show, h200 w250, Kitear
return

SXL := 465
SYL := 150
SXR := 1215
SYR := 812

calculate:															;This calculates the time to kite
{
	GuiControlGet, As
	Time := (((1000)/As)/2)
}

max:
{
	GuiControlGet, As
	SXL := 422
	SYL := 135
	SXR := 1295
	SYR := 688
}

$space::															;This moves your kayle to where your mouse is pointing and attacks automaticly to an enemy champion that is in your range
send {Space}
while GetKeyState("space","P"){
	Send {space down}
	Send {RButton}
	Sleep Time/6
	Send {RButton}
	Sleep Time/6
	Send {RButton}
	Sleep Time/6
	PixelSearch, OutputVarX, OutputVarY, SXL, SYL, SXR, SYR, 0x1B269A, 1, Fast
	if(OutputVarX!=null or OutputVarY!=null){
		MouseGetPos X, Y
		MouseMove, OutputVarX+35, OutputVarY+75, 0
		Send {x}
		MouseMove, X, Y, 0
		Sleep (Time/2)
	}
	Send {RButton}
	Sleep Time/6
	Send {RButton}
	Sleep Time/6
	Send {RButton}
	Sleep Time/6
}
send {space up}
return

$q::																;Activates the Q and aims it automaticly
PixelSearch, OutputVarX, OutputVarY, 375, 77, 1338, 868, 0x1B269A, 1, Fast
MouseGetPos X, Y
MouseMove, OutputVarX+50, OutputVarY+100, 0
Send {q}
MouseMove, X, Y, 0
return

$w::																;Activates the W
Send {w}
return

$e::																;Activates the E and aims it automaticly + resetting the autoattack
PixelSearch, OutputVarX, OutputVarY, SXL, SYL, SXR, SYR, 0x1B269A, 1, Fast
MouseGetPos X, Y
MouseMove, OutputVarX+30, OutputVarY+70, 0
Send {e}
Send {x}
MouseMove, X, Y, 0
return

$r::																;Activates the R
Send {r}
return

$f2::																;Suspend the script
Suspend
return

$f1::																;Exits the script
ExitApp

GuiClose:															;Exits the script
ExitApp