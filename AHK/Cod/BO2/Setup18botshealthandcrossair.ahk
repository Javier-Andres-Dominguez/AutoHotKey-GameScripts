Gui, Add, Text, 	x110 y0, 								Options
Gui, Add, Checkbox, x45 y35 	h20 w90 vInfiniteAmmo,		Inf ammo
Gui, Add, Checkbox, x150 y35 	h20 w90 vHPbar, 			Healthbar
Gui, Add, Checkbox, x45 y70		h20 w90 vManyBots, 			ManyBots
Gui, Add, Checkbox, x150 y70 	h20 w90 vSight, 			Crossair
Gui, Add, Checkbox, x105 y105	h20 w90 vRifle, 			Ak-47
Gui, Add, Button, 	x90 y150 	h20 w70 gwork, 				Apply
Gui, Show, 			x7000 y550	h200 w250, 					Modmenu options
return

Down(x){
	i := 0
	Loop{
		Send {Down}
		Sleep 300
		i+=1
	}
	Until x==i
}

Up(x){
	i := 0
	Loop{
		Send {Up}
		Sleep 300
		i+=1
	}
	Until x==i
}

work:
{
	GuiControlGet, InfiniteAmmo
	GuiControlGet, HPbar
	GuiControlGet, ManyBots
	GuiControlGet, Sight
	GuiControlGet, Rifle

	InfAmmo := InfiniteAmmo
	HealthBar := HPbar
	Bots := ManyBots
	Crossair := Sight
	AssaultRifle := Rifle

	Send {Alt Down}
	Send {Tab}
	Send {Alt Up}
	Sleep 50

	Send 5

	if(InfAmmo || HealthBar || Bots || Crossair || AssaultRifle){
		send {o down}
		Sleep 100
		send {v down}
		Sleep 50
		send {v up}
		send {o up}
		Sleep 300
		if(InfAmmo){
			send {space} ;Main Mods
			send {o}
			Sleep 300
			Down(2)
			send {space} ;Inf ammo
			Sleep 300
			send {f}
			Sleep 300
		}
		Down(1)
		if(HealthBar){
			send {space} ;Gangsta mods
			Sleep 300
			send {space} ;HealthBar
			Sleep 300
			send {f}
			Sleep 300
		}
		if(Bots || Crossair){
			Down(5)
			if(Bots){
				send {space} ;Game Settings
				Sleep 300
				Down(4)
				send {space} ;Bots
				Sleep 300
				Down(4)
				send {space} ;17 bots
				Sleep 300
				send {f}
				Sleep 300
				send {f}
				Sleep 300
			}
			if(Crossair){
				Down(9)
				send {space} ;Host Only
				Sleep 300
				Up(7)
				send {space} ;Crossair++
				Sleep 300
				send {f}
				Sleep 300
				Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\Crossair++.ahk
			}
		}
		send {f} ;Close the menu
	}

	;Fast restart
	Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\CloseAllScripts.ahk
	;An-94 recoil
	if(AssaultRifle){
		Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\An-94ToVandal.ahk
	}
	Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\SemiToAuto.ahk
	ExitApp
}

$F1::
ExitApp

GuiClose:
ExitApp