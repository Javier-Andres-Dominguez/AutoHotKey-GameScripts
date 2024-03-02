BulletsCount := 1
RandomizerX := 0
RandomizerY := 0
stdout := FileOpen("*", "w")

$LButton::
While GetKeyState("LButton","P"){
	if(BulletsCount<=30){
		if(GetKeyState("W", "P") || GetKeyState("A", "P") || GetKeyState("S", "P") || GetKeyState("D", "P") || GetKeyState("Space", "P")){
			stdout.Write(BulletsCount)
			stdout.Write("!!!")
			stdout.Read()
			Random, RandomizerX, -750, 750
			Random, RandomizerY, -750, 750
			MouseMove, RandomizerX, RandomizerY, 0, R
			Click
			MouseMove, -RandomizerX, -RandomizerY, 0, R
			Sleep 25
		}else{
			if(BulletsCount<=2){
				stdout.Write(BulletsCount)
				stdout.Write("-")
				stdout.Read()
				Click
				MouseMove, 0, 0, 0, R
				Sleep 50
			}else if(BulletsCount>=3 and BulletsCount<=10){
				stdout.Write(BulletsCount)
				stdout.Write("+")
				stdout.Read()
				Click
				MouseMove, 0, -150, 0, R
				Sleep 50
			}else{
				stdout.Write(BulletsCount)
				stdout.Write("*")
				stdout.Read()
				Random, RandomizerX, -500, 500
				MouseMove, RandomizerX, 0, 0, R
				Click
				MouseMove, -RandomizerX, 0, 0, R
				Sleep 25
			}
		}
		BulletsCount++
	}
}
/*if(BulletsCount>=4){
	MouseMove, 0, (BulletsCount-2)*105, 0, R
}
*/
BulletsCount := 1
stdout.Write("`n")
stdout.Read()
return

$Space::
While(GetKeyState("Space", "P")){
	Send {Space}
	Sleep 10
}
return

$F3::
Reload
return

$F2::
Suspend
return

$F1::
ExitApp