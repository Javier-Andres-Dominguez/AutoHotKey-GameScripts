;This script detects if your cursor is over the Color "Color" and clicks on it. Press F to activate the script, G to stop it, F2 to suspend (script will not detect hotkeys) and F1 to Exit the script
X := 0
Y := 0
Active := 0
Color := 0x2257FF

;To calibrate the screen check with mousemove the size of the screen your are about to use with WindowSpy

$f::
Send {f}
Active := 1
while(Active = 1){
	MouseGetPos, xpos, ypos
	PixelGetColor, OutputVar, xpos, ypos, Fast
	if(OutputVar = 0x2257FF){
		Send {LButton}
	}
}
return

$g::
Send {g}
Active := 0
return

$F2::
Suspend
return

$F1::
ExitApp