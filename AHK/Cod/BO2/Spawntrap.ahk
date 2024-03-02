Activated := false
Loop{
	While(Activated){
		Send {LButton}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		Sleep 210
		if(!Activated){
			break
		}
		;Sleep 2250
	}
}

;$XButton2::
$LButton::
if(Activated){
	Activated := false
	return
}else{
	Activated := true
	return
}

$F2::
Suspend
return

$F1::
ExitApp