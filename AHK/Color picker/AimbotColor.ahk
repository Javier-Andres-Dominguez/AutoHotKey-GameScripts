;This script moves your cursor to the Color "Color" and clicks on it. Press F to activate the script, G to stop it, F2 to suspend (script will not detect hotkeys) and F1 to Exit the script
Active := 0
Color := 0x2257FF

;To calibrate the screen check with mousemove the size of the screen your are about to use

$f::
Send {f}
Active := 1
while(Active){
	PixelSearch, OutputVarX, OutputVarY, 460, 425, 1455, 1020, %Color%, 0, Fast
	MouseMove, %OutputVarX%, %OutputVarY%
	Send {LButton}
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
