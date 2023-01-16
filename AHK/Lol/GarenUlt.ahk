;This script is used in the game League of Leguends with the champion "Garen". It calculates de damage of you ultimate based on enemy max HP.

;Interface
Gui, Add, Text, x140 y0, Imput enemy max Hp:
Gui, Add, Text, x25 y25,Top
Gui, Add, Edit, x0 y40 h20 w70 vC1Hp,
Gui, Add, Text, x0 y90 w70 vResult1TextC1, Lvl 1:
Gui, Add, Text, x0 y140 w70 vResult2TextC1, Lvl 2:
Gui, Add, Text, x0 y190 w70 vResult3TextC1, Lvl 3:
Gui, Add, Text, x100 y25,Jgl
Gui, Add, Edit, x75 y40 h20 w70 vC2Hp,
Gui, Add, Text, x75 y90 w70 vResult1TextC2,
Gui, Add, Text, x75 y140 w70 vResult2TextC2,
Gui, Add, Text, x75 y190 w70 vResult3TextC2,
Gui, Add, Text, x175 y25,Mid
Gui, Add, Edit, x150 y40 h20 w70 vC3Hp,
Gui, Add, Text, x150 y90 w70 vResult1TextC3,
Gui, Add, Text, x150 y140 w70 vResult2TextC3,
Gui, Add, Text, x150 y190 w70 vResult3TextC3,
Gui, Add, Text, x250 y25,Sup
Gui, Add, Edit, x225 y40 h20 w70 vC4Hp,
Gui, Add, Text, x225 y90 w70 vResult1TextC4,
Gui, Add, Text, x225 y140 w70 vResult2TextC4,
Gui, Add, Text, x225 y190 w70 vResult3TextC4,
Gui, Add, Text, x325 y25,Adc
Gui, Add, Edit, x300 y40 h20 w70 vC5Hp,
Gui, Add, Text, x300 y90 w70 vResult1TextC5,
Gui, Add, Text, x300 y140 w70 vResult2TextC5,
Gui, Add, Text, x300 y190 w70 vResult3TextC5,

Gui, Add, Button, x150 y210 h20 w70 gcalculate, Calculate
Gui, Show, h250 w370, DEMACIAAAAAAAAAAAAAAAAAAAA

return

calculate:																	;Calculates the highest amount of enemy HP that can have and be executed with your ultimate
{
	GuiControlGet, C1Hp
	GuiControlGet, C2Hp
	GuiControlGet, C3Hp
	GuiControlGet, C4Hp
	GuiControlGet, C5Hp
	Result11 := Floor(C1Hp - ((C1Hp - 150)/1.25))
	Result12 := Floor(C1Hp - ((C1Hp - 300)/1.30))
	Result13 := Floor(C1Hp - ((C1Hp - 450)/1.35))
	Result21 := Floor(C2Hp - ((C2Hp - 150)/1.25))
	Result22 := Floor(C2Hp - ((C2Hp - 300)/1.30))
	Result23 := Floor(C2Hp - ((C2Hp - 450)/1.35))
	Result31 := Floor(C3Hp - ((C3Hp - 150)/1.25))
	Result32 := Floor(C3Hp - ((C3Hp - 300)/1.30))
	Result33 := Floor(C3Hp - ((C3Hp - 450)/1.35))
	Result41 := Floor(C4Hp - ((C4Hp - 150)/1.25))
	Result42 := Floor(C4Hp - ((C4Hp - 300)/1.30))
	Result43 := Floor(C4Hp - ((C4Hp - 450)/1.35))
	Result51 := Floor(C5Hp - ((C5Hp - 150)/1.25))
	Result52 := Floor(C5Hp - ((C5Hp - 300)/1.30))
	Result53 := Floor(C5Hp - ((C5Hp - 450)/1.35))
	GuiControl,, Result1TextC1, Lvl 1:    %Result11%
	GuiControl,, Result2TextC1, Lvl 2:    %Result12%
	GuiControl,, Result3TextC1, Lvl 3:    %Result13%
	GuiControl,, Result1TextC2, |        %Result21%
	GuiControl,, Result2TextC2, |        %Result22%
	GuiControl,, Result3TextC2, |        %Result23%
	GuiControl,, Result1TextC3, |        %Result31%
	GuiControl,, Result2TextC3, |        %Result32%
	GuiControl,, Result3TextC3, |        %Result33%
	GuiControl,, Result1TextC4, |        %Result41%
	GuiControl,, Result2TextC4, |        %Result42%
	GuiControl,, Result3TextC4, |        %Result43%
	GuiControl,, Result1TextC5, |        %Result51%
	GuiControl,, Result2TextC5, |        %Result52%
	GuiControl,, Result3TextC5, |        %Result53%
}
return

GuiClose:																	;Exits the script
ExitApp
