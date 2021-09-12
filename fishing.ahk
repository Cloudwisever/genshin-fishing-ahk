#IfWinActive ahk_exe YuanShen.exe
aa:=true
^h::
	aa:=!aa
	if (aa=true ) ;
	{
		SetTimer, Label1, Off
		ToolTip
	}
	else
	{
		SetTimer, Label1,
		ToolTip on ,960, 35
	}
return
^!x::  ; Control+Alt+Z hotkey.
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the %MouseX%, %MouseY% position is %color%.
return
XButton1::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the %MouseX%, %MouseY% position is %color%.
return
Label1:
	SetTimer, Label1, 0
	PixelSearch Xzs, Yzs, 710, 100, 1210, 190, 0xFFFFBE , 0 , Fast RGB
	PixelSearch Xzo, Yzo, 1210, Yzs+3, 710, Yzs+3, 0xFFFFC0 , 0 , Fast RGB
	if (Xzs>700 And Xzo-Xzs>70)
	{
		Click
		Sleep 50
	}
return
#IfWinActive
F6::Reload
F7::ExitApp