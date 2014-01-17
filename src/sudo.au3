#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\Droobey\Desktop\3000.ico
#AutoIt3Wrapper_Outfile=C:\Users\Droobey\Desktop\sudo.exe
#AutoIt3Wrapper_Outfile_x64=C:\Users\Droobey\Desktop\sudo_x64.exe
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_Res_Description=Sudo for Windows
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Run_After=copy "%out%" "C:\windows\Syswow64\sudo.exe"
#AutoIt3Wrapper_Run_After=copy "%outx64%" "C:\windows\System32\sudo.exe"
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;** Target program Resource info

If $CmdLine[0] == 0 Then
   MsgBox(64, "Sudo for Windows","Sudo for Windows Vista and Higher" & chr(13) & "By @droobey" & chr(13) & "Usage:" & chr(13) & "sudo [cmd]")
   Exit
EndIf

$sFilePath = @TempDir & "\sudo.vbs"


$vbsCode = 'Set UAC = CreateObject("Shell.Application")  ' & @LF & 'Set args = Wscript.Arguments    ' & @LF & 'Dim cmdArg' & @LF & 'For Each arg In args' & @LF & 'If not arg = WScript.Arguments.Item(0) Then' & @LF & 'cmdArg = cmdArg & arg' & @LF & 'End If' & @LF & 'Next' & @LF & 'UAC.ShellExecute WScript.Arguments.Item(0), cmdArg, "", "runas", 1 '

$hFileOpen = FileOpen($sFilePath,2)
FileWrite($hFileOpen,$vbsCode)
FileClose($hFileOpen)

$args = ""
For $i = 1 to $cmdLine[0]
   $args = $args & " " & $cmdLine[$i]
Next
RunWait("wscript.exe " & chr(34) & $sFilePath & chr(34) & " " & $args)