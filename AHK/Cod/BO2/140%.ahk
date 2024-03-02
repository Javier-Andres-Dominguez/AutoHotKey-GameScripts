Gui, Add, Text, 	x110 y0, 																				Controls
Gui, Add, Checkbox, x45 y35 	h20 w90 vLevelMarked,														Level as a Bot
Gui, Add, Checkbox, x150 y35 	h20 w90 vStreaksMarked, 													Streaks
Gui, Add, Checkbox, x45 y65 	h20 w90 vKcMarked, 															Killcam
Gui, Add, Checkbox, x150 y65 	h20 w90 vMinimapMarked, 													Minimap
Gui, Add, Text, 	x40 y90 		w70 vAllyBotsCounter, 													5
Gui, Add, Text, 	x120 y90 		w70 vTotalKillsCounter, 												75
Gui, Add, Text, 	x200 y90 		w70 vEnemyBotsCounter, 													6
Gui, Add, Slider, 	x10 y110 	h20 w70 vAllyBotsSlider 	gAllyBotsAdjust 	Range0-6 TickInterval1, 	5
Gui, Add, Slider, 	x90 y110 	h20 w70 vTotalKillsSlider 	gTotalKillsAdjust 	Range0-100 TickInterval15, 	75
Gui, Add, Slider, 	x170 y110 	h20 w70 vEnemyBotsSlider 	gEnemyBotsAdjust 	Range0-6 TickInterval1, 	6
Gui, Add, Text, 	x35 y140, 																				Allys
Gui, Add, Text, 	x105 y140, 																				Total Kills
Gui, Add, Text, 	x185 y140, 																				Enemies
Gui, Add, Button, 	x0 y160 	h40 w85 gConfig, 															Configure!
Gui, Add, Button, 	x85 y160 	h40 w85 gSetBots, 															SetBots!
Gui, Add, Button, 	x170 y160 	h40 w85 gStart, 															Start!
Gui, Show, 			x7000 y560	h200 w250, 																	Party adjustments
return

AllyBotsAdjust:
	GuiControl,, AllyBotsCounter, %AllyBotsSlider%
return

TotalKillsAdjust:
	GuiControl,, TotalKillsCounter, %TotalKillsSlider%
return

EnemyBotsAdjust:
	GuiControl,, EnemyBotsCounter, %EnemyBotsSlider%
return

Up(x){
	i := 0
	Loop{
		Send {Up}
		Sleep 100
		i+=1
	}
	Until x==i
}

Down(x){
	i := 0
	Loop{
		Send {Down}
		Sleep 100
		i+=1
	}
	Until x==i
}

Right(x){
	if(x!=0){
		i := 0
		Loop{
			Send {Right}
			Sleep 100
			i+=1
		}
		Until x==i
	}
}

Left(x){
	i := 0
	Loop{
		Send {Left}
		Sleep 100
		i+=1
	}
	Until x==i
}

Esc(x){
	i := 0
	Loop{
		Send {Esc}
		Sleep 300
		i+=1
	}
	Until x==i
}

SetBots:
{
	GuiControlGet, AllyBotsSlider
	GuiControlGet, EnemyBotsSlider
	AllyBotsNumber := AllyBotsSlider
	EnemyBotsNumber := EnemyBotsSlider


	Send {Alt Down}
	Send {Tab}
	Send {Alt Up}
	Sleep 50

	Send {Down}
	Sleep 100
	Send {Enter} ;Bots
	Sleep 200
	Right(AllyBotsNumber)
	Send {Down}
	Sleep 200
	Right(EnemyBotsNumber)
	Send {Esc}
	return
}

Config:
{
	GuiControlGet, LevelMarked
	GuiControlGet, StreaksMarked
	GuiControlGet, KcMarked
	GuiControlGet, MinimapMarked
	GuiControlGet, TotalKillsSlider

	Level := LevelMarked
	Streaks := StreaksMarked
	Killcam := KcMarked
	Minimap := MinimapMarked
	TotalKillsNumber := TotalKillsSlider

	Send {Alt Down}
	Send {Tab}
	Send {Alt Up}
	Sleep 100

	if(Level){
		Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\Level.ahk
		Sleep 1500
	}
	Down(2)
	Send {Enter} ;Partida pers
	Sleep 100
	Down(1)
	Send {Enter} ;Configurar partida
	Sleep 100
	Down(2)
	Send {Enter} ;Editar reglas de la partida
	Sleep 100
	Down(1)
	if(TotalKillsNumber!=75){
		Moves := (75-TotalKillsNumber)/5
		if(Moves<0){
			Right(Moves*-1)
		}else{
			Left(Moves)
		}
	}
	Down(2)
	Send {Right} ;Extremo = Si
	Sleep 100
	Down(3)
	Send {Enter} ;Ajustes generales
	Sleep 100
	if(!Streaks){
		Right(1) ;Rachas de puntos = No
		Sleep 100
	}
	if(Killcam && !Minimap){
		Down(6)
		Right(1) ;Camara de muerte = Si
	}
	else if(!Killcam && Minimap){
		Up(6)
		Left(1) ;Minimapa = Activo

	}else if(Killcam && Minimap){
		Down(6)
		Right(1) ;Camara de muerte = Si
		Down(3)
		Left(1) ;Minimapa = Activo
	}else if(!Killcam && !Minimap){

	}
	Send {Esc}
	Sleep 100
	Down(1)
	Send {Enter} ;Ajustes de reaparición
	Sleep 100
	Right(8) ;Retardo = No
	Send {Esc}
	Sleep 100
	Down(1)
	Send {Enter} ;Ajustes de salud y daño
	Sleep 100
	Left(8) ;Salud = 140%
	Down(1)
	Right(2) ;Regeneración = Normal
	Down(1)
	Left(1) ;Fuego amigo = No
	Down(1)
	Left(3) ;Bajas de equipo hasta expulsión = No
	Send {Esc}
	Sleep 100
	Down(1)
	Send {Enter} ;Clases personalizadas
	Sleep 100
	Down(2)
	Send {Enter} ;Restringir armas principales
	Sleep 100
	Send {Up}
	Sleep 100
	Send {Enter} ;Especiales
	Sleep 100
	Send {Enter} ;Escudo
	Sleep 100
	Esc(5)
	return
}

Start:
{
	Send {Alt Down}
	Send {Tab}
	Send {Alt Up}
	Sleep 50

	Send ºxpartygo ;Iniciar partida
	Send {Enter}
	/*Send {Enter}
	Sleep 300
	Send {5}
	Sleep 200
	*/
	Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\Setup18botshealthandcrossair.ahk
	ExitApp
}

$f3::
Reload
return

$f2::
Suspend
return

$f1::
ExitApp

GuiClose:
ExitApp