﻿;This script is used in Overwatch 2 to instalock the caracter: "Soldier: 76".
;Controls: F1(Exits the script), F2(Suspends the script), G(Desactivates the spam), F(Activates the spam clicks in the character position to select it)
Active := 0

$g::
if(Active = 1){
	Active := 0
	return
}
return

$f::
if(Active = 0){
	Active := 1
}

while(Active = 1){
	MouseMove, 900, 900
	Send {LButton}
}

return

$F2::
Suspend
return

$F1::
ExitApp