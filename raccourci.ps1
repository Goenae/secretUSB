$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("c:\logs.lnk")
$Shortcut.TargetPath = "%USERPROFILE%\AppData\Roaming\System_logs\logs.bat"
$Shortcut.Save()