Path := "C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\Imgs\"
SPath := "C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\All\"

Dva := "Dva.png", Doomfist := "Doomfist.png", JunkerQueen := "JunkerQueen.png", Mauga := "Mauga.png", Orisa := "Orisa.png", Ramattra := "Ramattra.png", Reinhardt := "Reinhardt.png",
				Roadhog := "Roadhog.png", Sigma := "Sigma.png", Winston := "Winston.png", WreckingBall := "WreckingBall.png", Zarya := "Zarya.png"

Ashe := "Ashe.png", Bastion := "Bastion.png", Cassidy := "Cassidy.png", Echo := "Echo.png", Genji := "Genji.png", Hanzo := "Hanzo.png",
Junkrat := "Junkrat.png", Mei := "Mei.png", Pharah := "Pharah.png", Reaper := "Reaper.png", Sojourn := "Sojourn.png", Soldado76 := "Soldado76.png",
Sombra := "Sombra.png",Symmetra := "Symmetra.png", Torbjorn := "Torbjorn.png", Tracer := "Tracer.png", Widowmaker := "Widowmaker.png"

Ana := "Ana.png", Baptiste := "Baptiste.png", Brigitte := "Brigitte.png", Illari := "Illari.png", Kiriko := "Kiriko.png", Lifeweaver := "Lifeweaver.png", Lucio := "Lucio.png", Mercy := "Mercy.png",
Moira := "Moira.png", Zenyatta := "Zenyatta.png"

Gui, Add, Text, 	x550 y0, 								Select Your Hero
Gui, Add, Picture, 	vMyHeroPct 		x550 y100 	w100 h100
Gui, Add, Picture, 	vDvaPct 		x50 y300 	w50 h50		gDvaBtn,			%Path%%Dva%
Gui, Add, Picture, 	vDoomfistPct 	x100 y300 	w50 h50		gDoomfistBtn, 		%Path%%Doomfist%
Gui, Add, Picture, 	vJunkerQueenPct x150 y300 	w50 h50		gJunkerQueenBtn, 	%Path%%JunkerQueen%
Gui, Add, Picture, 	vMaugaPct       x200 y300 	w50 h50		gMaugaBtn, 	        %Path%%Mauga%
Gui, Add, Picture, 	vOrisaPct 		x250 y300 	w50 h50		gOrisaBtn, 			%Path%%Orisa%
Gui, Add, Picture, 	vRamattraPct	x300 y300 	w50 h50		gRamattraBtn, 		%Path%%Ramattra%

Gui, Add, Picture, 	vReinhardtPct 	x50 y350 	w50 h50		gReinhardtBtn, 		%Path%%Reinhardt%
Gui, Add, Picture, 	vRoadhogPct 	x100 y350 	w50 h50		gRoadhogBtn, 		%Path%%Roadhog%
Gui, Add, Picture, 	vSigmaPct		x150 y350 	w50 h50		gSigmaBtn, 			%Path%%Sigma%
Gui, Add, Picture, 	vWinstonPct 	x200 y350 	w50 h50		gWinstonBtn, 		%Path%%Winston%
Gui, Add, Picture, 	vWreckingBallPct x250 y350 	w50 h50		gWreckingBallBtn, 	%Path%%WreckingBall%
Gui, Add, Picture, 	vZaryaPct 		x300 y350 	w50 h50		gZaryaBtn, 			%Path%%Zarya%

Gui, Add, Picture, 	vAshePct 		x400 y300 	w50 h50		gAsheBtn, 			%Path%%Ashe%
Gui, Add, Picture, 	vBastionPct 	x450 y300 	w50 h50		gBastionBtn, 		%Path%%Bastion%
Gui, Add, Picture, 	vCassidyPct 	x500 y300 	w50 h50		gCassidyBtn, 		%Path%%Cassidy%
Gui, Add, Picture, 	vEchoPct 		x550 y300 	w50 h50		gEchoBtn, 			%Path%%Echo%
Gui, Add, Picture, 	vGenjiPct 		x600 y300 	w50 h50		gGenjiBtn, 			%Path%%Genji%
Gui, Add, Picture, 	vHanzoPct 		x650 y300 	w50 h50		gHanzoBtn, 			%Path%%Hanzo%
Gui, Add, Picture, 	vJunkratPct 	x700 y300 	w50 h50		gJunkratBtn, 		%Path%%Junkrat%
Gui, Add, Picture, 	vMeiPct 		x750 y300 	w50 h50		gMeiBtn, 			%Path%%Mei%
Gui, Add, Picture, 	vPharahPct 		x800 y300 	w50 h50		gPharahBtn, 		%Path%%Pharah%

Gui, Add, Picture, 	vReaperPct 		x425 y350 	w50 h50		gReaperBtn, 		%Path%%Reaper%
Gui, Add, Picture, 	vSojournPct 	x475 y350 	w50 h50		gSojournBtn, 		%Path%%Sojourn%
Gui, Add, Picture, 	vSoldado76Pct 	x525 y350 	w50 h50		gSoldado76Btn, 		%Path%%Soldado76%
Gui, Add, Picture, 	vSombraPct 		x575 y350 	w50 h50		gSombraBtn, 		%Path%%Sombra%
Gui, Add, Picture, 	vSymmetraPct 	x625 y350 	w50 h50		gSymmetraBtn, 		%Path%%Symmetra%
Gui, Add, Picture, 	vTorbjornPct 	x675 y350 	w50 h50		gTorbjornBtn, 		%Path%%Torbjorn%
Gui, Add, Picture, 	vTracerPct 		x725 y350 	w50 h50		gTracerBtn, 		%Path%%Tracer%
Gui, Add, Picture, 	vWidowmakerPct 	x775 y350 	w50 h50		gWidowmakerBtn, 	%Path%%Widowmaker%

Gui, Add, Picture, 	vAnaPct 		x900 y300 	w50 h50		gAnaBtn, 			%Path%%Ana%
Gui, Add, Picture, 	vBaptistePct 	x950 y300 	w50 h50		gBaptisteBtn, 		%Path%%Baptiste%
Gui, Add, Picture, 	vBrigittePct 	x1000 y300 	w50 h50		gBrigitteBtn, 		%Path%%Brigitte%
Gui, Add, Picture, 	vIllariPct 	    x1050 y300 	w50 h50		gIllariBtn, 		%Path%%Illari%
Gui, Add, Picture, 	vKirikoPct 		x1100 y300 	w50 h50		gKirikoBtn, 		%Path%%Kiriko%

Gui, Add, Picture, 	vLifeweaverPct 	x900 y350 	w50 h50		gLifeweaverBtn, 	%Path%%Lifeweaver%
Gui, Add, Picture, 	vLucioPct 		x950 y350 	w50 h50		gLucioBtn, 			%Path%%Lucio%
Gui, Add, Picture, 	vMercyPct 		x1000 y350 	w50 h50		gMercyBtn, 			%Path%%Mercy%
Gui, Add, Picture, 	vMoiraPct 		x1050 y350 	w50 h50		gMoiraBtn, 			%Path%%Moira%
Gui, Add, Picture, 	vZenyattaPct 	x1100 y350 	w50 h50		gZenyattaBtn, 		%Path%%Zenyatta%

Gui, Show, 			x6500 y350	h500 w1200, 				Hero Selector
return

StopAllScripts(){
    ;closes all other scripts
    DetectHiddenWindows, On
    WinGet, AHKList, List, ahk_class AutoHotkey
    Loop, %AHKList%
    {
        ID := AHKList%A_Index%
        If (ID <> A_ScriptHwnd)
            WinClose, ahk_id %ID%
    }
}

StopAllScriptsAndStartZumper(){
    StopAllScripts()
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Ov\All\Zumper.ahk
}

DvaBtn:
GuiControl,, MyHeroPct, %Path%%Dva%
StopAllScriptsAndStartZumper()
return
DoomfistBtn:
GuiControl,, MyHeroPct, %Path%%Doomfist%
StopAllScripts()
Run, %SPath%Doomfist.ahk
return
JunkerQueenBtn:
GuiControl,, MyHeroPct, %Path%%JunkerQueen%
StopAllScriptsAndStartZumper()
return
MaugaBtn:
GuiControl,, MyHeroPct, %Path%%Mauga%
StopAllScriptsAndStartZumper()
return
OrisaBtn:
GuiControl,, MyHeroPct, %Path%%Orisa%
StopAllScriptsAndStartZumper()
return
RamattraBtn:
GuiControl,, MyHeroPct, %Path%%Ramattra%
StopAllScriptsAndStartZumper()
return
ReinhardtBtn:
GuiControl,, MyHeroPct, %Path%%Reinhardt%
StopAllScriptsAndStartZumper()
return
RoadhogBtn:
GuiControl,, MyHeroPct, %Path%%Roadhog%
StopAllScriptsAndStartZumper()
return
SigmaBtn:
GuiControl,, MyHeroPct, %Path%%Sigma%
StopAllScriptsAndStartZumper()
return
WinstonBtn:
GuiControl,, MyHeroPct, %Path%%Winston%
StopAllScriptsAndStartZumper()
return
WreckingBallBtn:
GuiControl,, MyHeroPct, %Path%%WreckingBall%
StopAllScripts()
Run, %SPath%WreckingBall.ahk
return
ZaryaBtn:
GuiControl,, MyHeroPct, %Path%%Zarya%
StopAllScriptsAndStartZumper()
return
AsheBtn:
GuiControl,, MyHeroPct, %Path%%Ashe%
StopAllScripts()
Run, %SPath%Ashe.ahk
return
BastionBtn:
GuiControl,, MyHeroPct, %Path%%Bastion%
StopAllScripts()
Run, %SPath%Bastion.ahk
return
CassidyBtn:
GuiControl,, MyHeroPct, %Path%%Cassidy%
StopAllScripts()
Run, %SPath%Cassidy.ahk
return
EchoBtn:
GuiControl,, MyHeroPct, %Path%%Echo%
StopAllScripts()
return
GenjiBtn:
GuiControl,, MyHeroPct, %Path%%Genji%
StopAllScripts()
Run, %SPath%Genji.ahk
return
HanzoBtn:
GuiControl,, MyHeroPct, %Path%%Hanzo%
StopAllScripts()
return
JunkratBtn:
GuiControl,, MyHeroPct, %Path%%Junkrat%
StopAllScripts()
Run, %SPath%Junkrat.ahk
return
MeiBtn:
GuiControl,, MyHeroPct, %Path%%Mei%
StopAllScriptsAndStartZumper()
return
PharahBtn:
GuiControl,, MyHeroPct, %Path%%Pharah%
StopAllScripts()
Run, %SPath%Pharah.ahk
return
ReaperBtn:
GuiControl,, MyHeroPct, %Path%%Reaper%
StopAllScripts()
Run, %SPath%Reaper.ahk
return
SojournBtn:
GuiControl,, MyHeroPct, %Path%%Sojourn%
StopAllScriptsAndStartZumper()
return
Soldado76Btn:
GuiControl,, MyHeroPct, %Path%%Soldado76%
StopAllScripts()
Run, %SPath%Soldado76.ahk
return
SombraBtn:
GuiControl,, MyHeroPct, %Path%%Sombra%
StopAllScriptsAndStartZumper()
return
SymmetraBtn:
GuiControl,, MyHeroPct, %Path%%Symmetra%
StopAllScriptsAndStartZumper()
return
TorbjornBtn:
GuiControl,, MyHeroPct, %Path%%Torbjorn%
StopAllScriptsAndStartZumper()
return
TracerBtn:
GuiControl,, MyHeroPct, %Path%%Tracer%
StopAllScriptsAndStartZumper()
return
WidowmakerBtn:
GuiControl,, MyHeroPct, %Path%%Widowmaker%
StopAllScriptsAndStartZumper()
return
AnaBtn:
GuiControl,, MyHeroPct, %Path%%Ana%
StopAllScriptsAndStartZumper()
return
BaptisteBtn:
GuiControl,, MyHeroPct, %Path%%Baptiste%
StopAllScriptsAndStartZumper()
return
BrigitteBtn:
GuiControl,, MyHeroPct, %Path%%Brigitte%
StopAllScriptsAndStartZumper()
return
IllariBtn:
GuiControl,, MyHeroPct, %Path%%Illari%
StopAllScriptsAndStartZumper()
return
KirikoBtn:
GuiControl,, MyHeroPct, %Path%%Kiriko%
StopAllScripts()
return
LifeweaverBtn:
GuiControl,, MyHeroPct, %Path%%Lifeweaver%
StopAllScripts()
return
LucioBtn:
GuiControl,, MyHeroPct, %Path%%Lucio%
StopAllScripts()
Run, %SPath%Lucio.ahk
return
MercyBtn:
GuiControl,, MyHeroPct, %Path%%Mercy%
StopAllScripts()
Run, %SPath%Mercy.ahk
return
MoiraBtn:
GuiControl,, MyHeroPct, %Path%%Moira%
StopAllScripts()
Run, %SPath%Moira.ahk
return
ZenyattaBtn:
GuiControl,, MyHeroPct, %Path%%Zenyatta%
StopAllScripts()
Run, %SPath%Zenyatta.ahk
return

GuiClose:
StopAllScripts()
ExitApp