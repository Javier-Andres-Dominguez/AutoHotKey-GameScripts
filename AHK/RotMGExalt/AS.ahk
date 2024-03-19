#SingleInstance force
#Persistent
#include <AutoHotInterception>
SetBatchLines, -1

global AHI := new AutoHotInterception()
global mouseId := AHI.GetMouseId(0x1BCF, 0x08B8)

global State := false
global Red := "0x0000FF"
global Green := "0x37C278"
global Orange := "0x0E72E3"
global Black := "0x000000"
global Priest := false
global Kensei := false
;Interface
Gui, +AlwaysOnTop
Gui, Font, s60
Gui, Add, Text, 	x90 y40 	h80 w70		vStatus, 			X
Gui, Font, s20
Gui, Add, Checkbox, x65 y130 	h20 w90 	vPriestMarked		gPriestSelector,		Priest
Gui, Add, Checkbox, x65 y160 	h20 w110 	vKenseiMarked		gKenseiSelector,		Kensei
Gui, Add, Text, 	x10 y200 	h80 w120		vXText, 		X
Gui, Add, Text, 	x150 y200 	h80 w120		vYText, 		Y
Gui, Show, 			x5760 y1050	h250 w250, 					ROTGM
Suspend
;3480X 367Y Center of you in the map 35X 33Y
;1560X 1038Y Center of you in the screen
;26623-26642(26632)X, 31736-31737Y of you in the screen
;Red dot enemies are 15 width and height
Loop{
	if(State){		;If the script is on:
		if(Priest){
			PixelGetColor, HPColor, 3645, 970
			if(HPColor!=Green && HPColor!=Black){
				Click, Right
				Send {v}
				Sleep 250
			}
		}
		PixelGetColor, HalfHPColor, 3147, 970
		if(HalfHPColor==Orange && HalfHPColor!=Black){
			Send {f}
			Sleep 500
		}
		PixelGetColor, QuartHPColor, 3330, 970
		if(QuartHPColor!=Orange && QuartHPColor!=Green && QuartHPColor!=Black){
			Send {r}
		}
		*/
		;Closest enemies
		PixelSearch, EnemyX, EnemyY, 3445, 334, 3515, 400, %Red%, 1, Fast
		if(EnemyX!=null){	;If it finds an enemy:
			if(Kensei){
				VectorX := ((EnemyX-3480+7)*170.71)*1.5
				VectorY := ((EnemyY-367+7)*305.74)*1.5
			}else{
				VectorX := (EnemyX-3480+7)*170.71
				VectorY := (EnemyY-367+7)*305.74
			}
			XAim := VectorX+26632
			GuiControl,, XText, 	%EnemyX%
			YAim := VectorY+31736
			GuiControl,, YText, 	%EnemyY%
			AHI.Instance.SendMouseMoveAbsolute(mouseId, XAim, YAim)
		}
		else{	;If it doesn´t find an enemy:
			;Close enemies
			PixelSearch, EnemyX, EnemyY, 3410, 301, 3550, 433, %Red%, 1, Fast
			if(EnemyX!=null){
				if(Kensei){
					VectorX := ((EnemyX-3480+7)*170.71)*1.5
					VectorY := ((EnemyY-367+7)*305.74)*1.5
				}else{
					VectorX := (EnemyX-3480+7)*170.71
					VectorY := (EnemyY-367+7)*305.74
				}
				XAim := VectorX+26632
				GuiControl,, XText, 	%EnemyX%
				YAim := VectorY+31736
				GuiControl,, YText, 	%EnemyY%
				AHI.Instance.SendMouseMoveAbsolute(mouseId, XAim, YAim)
			}else{
				;Closer enemies
				PixelSearch, EnemyX, EnemyY, 3375, 268, 3585, 466, %Red%, 1, Fast
				if(EnemyX!=null){	;If it finds an enemy:
					if(Kensei){
						VectorX := ((EnemyX-3480+7)*170.71)*1.25
						VectorY := ((EnemyY-367+7)*305.74)*1.25
					}else{
						VectorX := (EnemyX-3480+7)*170.71
						VectorY := (EnemyY-367+7)*305.74
					}
					XAim := VectorX+26632
					GuiControl,, XText, 	%EnemyX%
					YAim := VectorY+31736
					GuiControl,, YText, 	%EnemyY%
					AHI.Instance.SendMouseMoveAbsolute(mouseId, XAim, YAim)
				}
				else{	;If it doesn´t find an enemy:
					;Ranged enemies
					PixelSearch, EnemyX, EnemyY, 3340, 235, 3620, 499, %Red%, 1, Fast
					if(EnemyX!=null){
						if(EnemyX>3480){
							VectorX := ((EnemyX-3480+7)*170.71)/1.25
							VectorY := ((EnemyY-367+7)*305.74)/1.25
						}else{
							VectorX := (EnemyX-3480+7)*170.71
							VectorY := (EnemyY-367+7)*305.74
						}
						XAim := VectorX+26632
						GuiControl,, XText, 	%EnemyX%
						YAim := VectorY+31736
						GuiControl,, YText, 	%EnemyY%
						AHI.Instance.SendMouseMoveAbsolute(mouseId, XAim, YAim)
					}
				}
			}
		}
		*/
	}
}
*/
return

PriestSelector:
GuiControlGet, PriestMarked
Priest := PriestMarked
GuiControl,, KenseiMarked, 0
return

KenseiSelector:
GuiControlGet, KenseiMarked
Kensei := KenseiMarked
GuiControl,, PriestMarked, 0
return

$RButton::
Click, Right
if(Kensei){
	PixelGetColor, HalfMana, 3300, 1053
	if(HalfMana!="0xDA815D"){
		Send {v}
	}
}else{
	Send {v}
}
return
*/

$XButton2::
$F2::	;Suspend
Suspend
if(State){
	State := false
	GuiControl,, Status, 	X
}else{
	State := true
	GuiControl,, Status, 	O
	Send {WheelUp}
	Sleep 10
	Send {WheelUp}
	Sleep 10
	Send {WheelUp}
	Sleep 10
	Send {WheelUp}
	Sleep 10
	Send {WheelUp}
	Sleep 10
	Send {WheelUp}
	Sleep 10
	Send {WheelUp}
}
return

$f1::	;Close
ExitApp

GuiClose:	;Close
ExitApp