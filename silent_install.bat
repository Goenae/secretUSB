cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\

powershell.exe -command "curl -O https://www.python.org/ftp/python/3.9.9/python-3.9.9-amd64.exe"

powershell.exe -command "python-3.9.9-amd64.exe /quiet InstallAllUsers=1 PrependPath=1"

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

