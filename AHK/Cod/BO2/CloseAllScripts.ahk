Gui, Add, Text, 	x110 y0, 								Options
Gui, Add, Button, 	x45 y80 	h20 w70 gRestart, 			Restart
Gui, Add, Button, 	x140 y80 	h20 w70 gNewGame, 			New Game
Gui, Show, 			x7000 y550	h200 w250, 					Game options

Send {Alt Down}
Send {Tab}
Send {Alt Up}
return

Restart:
{
    ;closes all other scripts
    DetectHiddenWindows, On
    WinGet, AHKList, List, ahk_class AutoHotkey
    Loop, %AHKList%
    {
        ID := AHKList%A_Index%
        If (ID <> A_ScriptHwnd)
            WinClose, ahk_id %ID%
    }

	Send {Alt Down}
	Send {Tab}
	Send {Alt Up}
	Sleep 50

    Send ºmap_restart
    Send {Enter}
    Sleep 6000
    Send {Enter}
    Sleep 300
    Send {5}
    Sleep 200
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\Setup18botshealthandcrossair.ahk
    ExitApp
}

NewGame:
{
    ;closes all other scripts
    DetectHiddenWindows, On
    WinGet, AHKList, List, ahk_class AutoHotkey
    Loop, %AHKList%
    {
        ID := AHKList%A_Index%
        If (ID <> A_ScriptHwnd)
            WinClose, ahk_id %ID%
    }
    Run, C:\Users\Ordenador-de-yo\Downloads\AHK\Portatil\Scripts\Cod\BO2\Setup18botshealthandcrossair.ahk
    ExitApp
}

$f1::
ExitApp

GuiClose:
ExitApp