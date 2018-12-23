HotKeySet("{Esc}","stop")

Global $left
Global $right

Global $CatchAll
HotKeySet("{z}", "spamleft")
HotKeySet("{x}", "spamright")

While 1
    Sleep(10)
WEnd

Func spamleft()
   $left = NOT $left
   While $left
	  MouseMove (600,650,0); Moves Mouse onto the 	Start Mission Button
	  MouseClick ("left")	; Clicks Start Mission Button
	  $CatchAll = 0
	  While (1) ; Loops while game is being played
		 Sleep(100)
		 $CatchAll += 1
		 ConsoleWrite(PixelGetColor(500,684))
		 if PixelGetColor(359,167) = "0x211416" Then ; You lost if this is true
			MouseMove(829,697,0)
			MouseClick("left")		; Exits the current game
			ExitLoop
		 EndIf
		 ConsoleWrite(PixelGetColor(500,684))
		 if PixelGetColor(608,705) = "0x180B12" Then ; You won if this is true
			MouseMove(702,723,0)
			MouseClick("left")		; Exits the current game
			ExitLoop
		 EndIf
		 if $CatchAll = 60 Then
			MouseMove(702,723,0)
			MouseClick("left")		; Exits the current game
			ExitLoop
		 EndIf
	  WEnd

	  Sleep (50)			; Buffer
	  MouseClick ("left")	; Clicks level up confirm
	  Sleep (100)			; Buffer
	  MouseClick ("left")	; Clicks chest acquired confirm
	  Sleep (1500)
   WEnd
EndFunc

Func spamright()
    $right = NOT $right

    While $right
		Sleep(10)
        MouseClick ("right")
    WEnd
EndFunc

func stop()
    Exit
endfunc