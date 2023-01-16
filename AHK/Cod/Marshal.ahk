;This script is used in the game CoD Black Ops 2, with the weapon SVU-AS. The script slows down the fire rate to make it shoot as fast as the weapon "Marshal" from the game VALORANT. In the configuration you need to have ADS Togle, not while pressing.

MarshalEquiped := 1 ;Marshal equiped
Scoping := 0 ;Is scoping?

$LButton:: ;Shoot-->If you were scoping-->Stop and change value to 2 for not being able to scope/shoot for 0.75s
Send {LButton}
if(MarshalEquiped){
	if(Scoping = 1){
		Send {RButton} ;Stop scoping
		Send {c up} ;Hold breath
		Scoping := 2 ;Change value to not be able to scope
		Sleep 750
		Scoping := 0 ;Change value to be able to scope again
		return
	}else{
		Sleep 750
	}
}
return

$RButton:: ;Scope-->If you were scoping stop it, else start scoping
if(!Scoping){
	Send {RButton} ;Scope
	Send {c down} ;"C" is the key where I have hold breath
	Scoping := 1
	return
}else{
	Send {RButton} ;Stop Scoping
	Send {c up} ;Stop holding breath to recharge
	Scoping := 0
	return
}

$2:: ;2 Is used to change the weapon. When pressed you don´t have marshal equiped no more and you can´t be Scoping.
Send {2}
Scoping := 0 ;You can´t scope while changing weapon
if(MarshalEquiped){
	MarshalEquiped := 0
	return
}else{
	MarshalEquiped := 1
}
return

$f:: ;F is pressed to respawn, and you always respawn with the primary weapon (Marshal) equiped.
MarshalEquiped := 1
Scoping := 0
return

$r:: ;r Is used to reload the weapon. When pressed you can´t be Scoping.
Send {r}
if(Scoping){
	Send {c up}
	Scoping := 0
	return
}
return

$F2::
Suspend
return

$F1::
ExitApp