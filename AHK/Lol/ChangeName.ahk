;This script is used to change your summoner name in League of legends with the client window in this values: 1600*900. You have to be in the correct plaze so you only leave the rest to press Change Name or confirm to the script.
;Controls: F1(Exits the script), F2(Suspends the script (disables the hotekeys)), F(Activates the script), Click(If it is activated spam mouse move up and down with clicks)
Active := 0

$LButton::
Send {LButton}
while(Active = 1){
	Send {LButton}
	MouseMove, 0, 150, 5, R
	Send {LButton}
	MouseMove, 0, -150, 5, R

}

return

$f::
if(Active = 0){
	Active := 1
	return
}

if(Active = 1){
	Active := 0
	return
}

return

$F2::
Suspend
return

$F1::
ExitApp