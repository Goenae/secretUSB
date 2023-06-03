$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("c:\logs.lnk")
$Shortcut.TargetPath = "C:\System_logs\logs.bat"
$Shortcut.WorkingDirectory = "C:\System_logs\"
$Shortcut.Save()
