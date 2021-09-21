#IfWinActive ahk_exe YuanShen.exe
aa:=true
^g::
	aa:=!aa
	if (aa=true ) ;
	{
		SetTimer, Check, Off
		ToolTip
	}
	else
	{
		;SetTimer, FishingStart,
		SetTimer, Check,
		ToolTip on ,1080, 35
	}
return
#IfWinActive ahk_exe YuanShen.exe
Check:
	SetTimer, Check, 0
	PixelGetColor, color1, 891, 216, RGB
	PixelGetColor, color2, 899, 216, RGB
	PixelGetColor, color3, 948, 224, RGB
	PixelGetColor, color4, 1019, 216, RGB
	PixelGetColor, color5, 882, 216, RGB
	if(color1 = 0xffffff And color2 = 0xffffff And color3 = 0xffffff And color4 = 0xffffff And color5 != 0xffffff)
	{
		Click
		Sleep, 2000
	}
Return
#IfWinActive
F6::Reload
F7::ExitApp

return