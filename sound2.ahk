#Persistent
#singleinstance force
Menu, Tray, NoStandard
Menu, Tray, Add, Settings, trayshow
Menu, Tray, Add , E&xit, ButtonExit

IfExist, %A_ScriptDir%\config.ini   
{
   Gosub, ReadSettings             
   Gosub, hots
}



OnMessage(0x200, "Help")

Help(wParam, lParam, Msg) {

MouseGetPos,,,, OutputVarControl

IfEqual, OutputVarControl, Static1

	Help := "When you press this hotkey, all keys bindet to sounds `n will work like default keys unless you press it again"
else IfEqual, OutputVarControl, Static2

	Help := "If you have long sound or song you start playng but you want to stop it immediately, `n you can stop it pressing this hotkey"
else IfEqual, OutputVarControl, Static3
	Help := "Device which you must set from VLC. `n Details in instruction"
else IfEqual, OutputVarControl, Button12
	Help := "Check it if you want to listen all sounds that will be played to people"

ToolTip % Help
}


Gui, Color, 272822 

Gui, -SysMenu +Owner -Caption +ToolWindow


;Gui, Font, s16, Courier
Gui, Add, Button, x12 y28 w250 h30 vOpe1 gOpen1, Open
Gui, Add, Button, x12 y68 w250 h30 vOpe2 gOpen2, Open
Gui, Add, Button, x12 y108 w250 h30 vOpe3 gOpen3, Open
Gui, Add, Button, x12 y148 w250 h30 vOpe4 gOpen4, Open
Gui, Add, Button, x12 y188 w250 h30 vOpe5 gOpen5, Open
Gui, Add, Button, x12 y228 w250 h30 vOpe6 gOpen6, Open
Gui, Add, Button, x12 y268 w250 h30 vOpe7 gOpen7, Open
Gui, Add, Button, x12 y308 w250 h30 vOpe8 gOpen8, Open
Gui, Add, Button, x12 y348 w250 h30 vOpe9 gOpen9, Open

Gui, Font, s12  cwhite, Lucida Console, 

Gui, Add, Hotkey, x282 y28 w100 h30 vH1, 
Gui, Add, Hotkey, x282 y68 w100 h30 vH2, 
Gui, Add, Hotkey, x282 y108 w100 h30 vH3, 
Gui, Add, Hotkey, x282 y148 w100 h30 vH4, 
Gui, Add, Hotkey, x282 y188 w100 h30 vH5, 
Gui, Add, Hotkey, x282 y228 w100 h30 vH6, 
Gui, Add, Hotkey, x282 y268 w100 h30 vH7, 
Gui, Add, Hotkey, x282 y308 w100 h30 vH8, 
Gui, Add, Hotkey, x282 y348 w100 h30 vH9, 
Gui, Add, Hotkey, x282 y388 w100 h30 vPaus, 
Gui, Add, Hotkey, x282 y428 w100 h30 vStop, 



;Gui Add, CheckBox, x12 y510 w266 h23, Playback in speakers/headphones


Gui, Add, Button, x12 y548 w182 h30 gSave1, Save
Gui, Add, Button, x198 y548 w182 h30 gCancel1, Cancel

Gui, Font, s14 cwhite, Lucida Console
Gui, Add, Text, x12 y388 w250 h30 , On/Off keys:
Gui, Add, Text, x12 y428 w250 h30 , Stop playing:
Gui, Add, Text, x12 y468 w350 h30 , Output device in VLC:
Gui Add, CheckBox, x12 y520 w366 h23 vPback Checked%1ch%, Playback in speakers/headphones

Gui, Font, s10  cblack, Lucida Console, 
Gui, Add, Edit, x12 y498 w370 h20 vDev



Gui, Add, Text, x-3 y-3 w410 h20 +0x400000 +0x1000 Border Center GuiMove, 
uiMove:
PostMessage, 0xA1, 2,,, A 

return
trayshow:
suspend on
Gui, Show,  h590 w400, Soundplay program   ;x330 y135


loop 9 
{
if (Filename%A_index% == "") 
{
    GuiControl, , Ope%A_index%,  Open
}
else 
{
SplitPath, Filename%A_index%, FFilename%A_index%
temp12:=FFilename%A_index%
GuiControl, , Ope%A_index%,  %temp12%
}

temp21:=H%A_index%
GuiControl, , H%A_index%, %temp21%
}
GuiControl, , Stop, %Stop%
GuiControl, , Paus, %Paus%
GuiControl, , Dev, %Dev%
;GuiControl, , Pback, %Pback%

Return


Open1:
FileSelectFile, Filename1, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename1, %A_ScriptDir%\config.ini, settings, Filename1
SplitPath, Filename1, FFilename1
if (Filename1 == "") or (Filename1 == "ERROR")
GuiControl, , Ope1,  Open
else
GuiControl, , Ope1,  %FFilename1%

return

Open2:
FileSelectFile, Filename2, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename2, %A_ScriptDir%\config.ini, settings, Filename2
SplitPath, Filename2, FFilename2
if (Filename2 == "") or (Filename2 == "ERROR")
GuiControl, , Ope2,  Open
else
GuiControl, , Ope2,  %FFilename2%
return

Open3:
FileSelectFile, Filename3, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename3, %A_ScriptDir%\config.ini, settings, Filename3
SplitPath, Filename3, FFilename3
if (Filename3 == "") or (Filename3 == "ERROR")
GuiControl, , Ope3,  Open
else
GuiControl, , Ope3,  %FFilename3%
return

Open4:
FileSelectFile, Filename4, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename4, %A_ScriptDir%\config.ini, settings, Filename4
SplitPath, Filename4, FFilename4
if (Filename4 == "") or (Filename4 == "ERROR")
GuiControl, , Ope4,  Open
else
GuiControl, , Ope4,  %FFilename4%
return

Open5:
FileSelectFile, Filename5, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename5, %A_ScriptDir%\config.ini, settings, Filename5
SplitPath, Filename5, FFilename5
if (Filename5 == "") or (Filename5 == "ERROR")
GuiControl, , Ope5,  Open
else
GuiControl, , Ope5,  %FFilename5%
return

Open6:
FileSelectFile, Filename6, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename6, %A_ScriptDir%\config.ini, settings, Filename6
SplitPath, Filename6, FFilename6
if (Filename6 == "") or (Filename6 == "ERROR")
GuiControl, , Ope6,  Open
else
GuiControl, , Ope6,  %FFilename6%
return

Open7:
FileSelectFile, Filename7, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename7, %A_ScriptDir%\config.ini, settings, Filename7
SplitPath, Filename7, FFilename7
if (Filename7 == "") or (Filename7 == "ERROR")
GuiControl, , Ope7,  Open
else
GuiControl, , Ope7,  %FFilename7%
return

Open8:
FileSelectFile, Filename8, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename8, %A_ScriptDir%\config.ini, settings, Filename8
SplitPath, Filename8, FFilename8
if (Filename8 == "") or (Filename8 == "ERROR")
GuiControl, , Ope8,  Open
else
GuiControl, , Ope8,  %FFilename8%
return

Open9:
FileSelectFile, Filename9, 3, %A_ScriptDir%, Open song,
if (ErrorLevel == 1)
IniRead, Filename9, %A_ScriptDir%\config.ini, settings, Filename9
SplitPath, Filename9, FFilename9
if (Filename9 == "") or (Filename9 == "ERROR")
GuiControl, , Ope9,  Open
else
GuiControl, , Ope9,  %FFilename9%
return


Cancel1:
Reload
return

Save1:
Gui, Submit ;, Nohide

IniWrite, %Pback%, %A_ScriptDir%\config.ini, settings, 1checkbox

IniWrite, %Dev%, %A_ScriptDir%\config.ini, settings, Dev
IniWrite, %H1%, %A_ScriptDir%\config.ini, settings, H1
IniWrite, %H2%, %A_ScriptDir%\config.ini, settings, H2
IniWrite, %H3%, %A_ScriptDir%\config.ini, settings, H3
IniWrite, %H4%, %A_ScriptDir%\config.ini, settings, H4
IniWrite, %H5%, %A_ScriptDir%\config.ini, settings, H5
IniWrite, %H6%, %A_ScriptDir%\config.ini, settings, H6
IniWrite, %H7%, %A_ScriptDir%\config.ini, settings, H7
IniWrite, %H8%, %A_ScriptDir%\config.ini, settings, H8
IniWrite, %H9%, %A_ScriptDir%\config.ini, settings, H9
IniWrite, %Paus%, %A_ScriptDir%\config.ini, settings, Paus
IniWrite, %Stop%, %A_ScriptDir%\config.ini, settings, Stop

IniWrite, %Filename1%, %A_ScriptDir%\config.ini, settings, Filename1
IniWrite, %Filename2%, %A_ScriptDir%\config.ini, settings, Filename2
IniWrite, %Filename3%, %A_ScriptDir%\config.ini, settings, Filename3
IniWrite, %Filename4%, %A_ScriptDir%\config.ini, settings, Filename4
IniWrite, %Filename5%, %A_ScriptDir%\config.ini, settings, Filename5
IniWrite, %Filename6%, %A_ScriptDir%\config.ini, settings, Filename6
IniWrite, %Filename7%, %A_ScriptDir%\config.ini, settings, Filename7
IniWrite, %Filename8%, %A_ScriptDir%\config.ini, settings, Filename8
IniWrite, %Filename9%, %A_ScriptDir%\config.ini, settings, Filename9
Reload
return

ReadSettings:

IniRead, 1ch, %A_ScriptDir%\config.ini, settings, 1checkbox 

IniRead, Dev, %A_ScriptDir%\config.ini, settings, Dev
IniRead, H1, %A_ScriptDir%\config.ini, settings, H1
IniRead, H2, %A_ScriptDir%\config.ini, settings, H2
IniRead, H3, %A_ScriptDir%\config.ini, settings, H3
IniRead, H4, %A_ScriptDir%\config.ini, settings, H4
IniRead, H5, %A_ScriptDir%\config.ini, settings, H5
IniRead, H6, %A_ScriptDir%\config.ini, settings, H6
IniRead, H7, %A_ScriptDir%\config.ini, settings, H7
IniRead, H8, %A_ScriptDir%\config.ini, settings, H8
IniRead, H9, %A_ScriptDir%\config.ini, settings, H9
IniRead, Paus, %A_ScriptDir%\config.ini, settings, Paus
IniRead, Stop, %A_ScriptDir%\config.ini, settings, Stop

IniRead, Filename1, %A_ScriptDir%\config.ini, settings, Filename1
IniRead, Filename2, %A_ScriptDir%\config.ini, settings, Filename2
IniRead, Filename3, %A_ScriptDir%\config.ini, settings, Filename3
IniRead, Filename4, %A_ScriptDir%\config.ini, settings, Filename4
IniRead, Filename5, %A_ScriptDir%\config.ini, settings, Filename5
IniRead, Filename6, %A_ScriptDir%\config.ini, settings, Filename6
IniRead, Filename7, %A_ScriptDir%\config.ini, settings, Filename7
IniRead, Filename8, %A_ScriptDir%\config.ini, settings, Filename8
IniRead, Filename9, %A_ScriptDir%\config.ini, settings, Filename9
return



hot1:
run vlc.exe "%Filename1%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename1%" vlc -I null --play-and-exit 
return

hot2:
run vlc.exe "%Filename2%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename2%" vlc -I null --play-and-exit
return

hot3:
run vlc.exe "%Filename3%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename3%" vlc -I null --play-and-exit
return

hot4:
run vlc.exe "%Filename4%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename4%" vlc -I null --play-and-exit
return

hot5:
run vlc.exe "%Filename5%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename5%" vlc -I null --play-and-exit
return

hot6:
run vlc.exe "%Filename6%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename6%" vlc -I null --play-and-exit
return

hot7:
run vlc.exe "%Filename7%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename7%" vlc -I null --play-and-exit
return

hot8:
run vlc.exe "%Filename8%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename8%" vlc -I null --play-and-exit
return

hot9:
run vlc.exe "%Filename9%" vlc -I null --play-and-exit --mmdevice-audio-device=%Dev%
if (1ch==1)
run vlc.exe "%Filename9%" vlc -I null --play-and-exit
return

Stop1:
Process, Exist, vlc.exe
Process, Close, vlc.exe
sleep 100
Process, Exist, vlc.exe
Process, Close, vlc.exe
return

Paus1:
suspend toggle
return

hots:
if (H1 != "")
Hotkey, %H1%, hot1
if (H2 != "")
Hotkey, %H2%, hot2
if (H3 != "")
Hotkey, %H3%, hot3
if (H4 != "")
Hotkey, %H4%, hot4
if (H5 != "")
Hotkey, %H5%, hot5
if (H6 != "")
Hotkey, %H6%, hot6
if (H7 != "")
Hotkey, %H7%, hot7
if (H8 != "")
Hotkey, %H8%, hot8
if (H9 != "")
Hotkey, %H9%, hot9

if (Paus != "")
Hotkey, %Paus%, Paus1

if (Stop != "")
Hotkey, %Stop%, Stop1
return

ButtonExit:
ExitApp

F4::suspend toggle