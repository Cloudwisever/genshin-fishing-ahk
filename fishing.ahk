#IfWinActive ahk_exe YuanShen.exe
aa:=true
^h::
	aa:=!aa
	if (aa=true ) ;
	{
		SetTimer, Fishing, Off
		ToolTip
	}
	else
	{
		SetTimer, Fishing,
		ToolTip on ,960, 35
	}
return
Fishing:
	SetTimer, Fishing, 0
	fishingStart := Check()
	if (fishingStart)
	{
		return
	}
	PixelSearch Xzs, Yzs, 710, 100, 1210, 190, 0xFFFFBE , 0 , Fast RGB
	PixelSearch Xzo, Yzo, 1210, Yzs+3, 710, Yzs+3, 0xFFFFC0 , 0 , Fast RGB
	if (Xzs>700 And Xzo-Xzs>70)
	{
		Click
	}
Return
Check()
{
	PixelGetColor, color1, 891, 216, RGB
	PixelGetColor, color2, 899, 216, RGB
	PixelGetColor, color3, 948, 224, RGB
	PixelGetColor, color4, 1019, 216, RGB
	PixelGetColor, color5, 882, 216, RGB
	if(color1 = 0xffffff And color2 = 0xffffff And color3 = 0xffffff And color4 = 0xffffff And color5 != 0xffffff)
	{
		Click
		Sleep, 80
		Return True
	}
	Else
	{
		Return False
	}
}
	
#IfWinActive
F6::Reload
F7::ExitApp

XButton1::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the %MouseX%, %MouseY% position is %color%.
return
