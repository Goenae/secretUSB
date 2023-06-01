cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\

powershell.exe -command "curl -O https://www.python.org/ftp/python/3.9.9/python-3.9.9-amd64.exe"

powershell.exe -command "python-3.9.9-amd64.exe /quiet InstallAllUsers=1 PrependPath=1"

