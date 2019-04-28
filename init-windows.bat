:: 2>/dev/null || echo '
::::::::::::::::::::::::::: Windows

cd c:\vagrant

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

echo "Installing Visual Studio. This takes a while..."
powershell -command "& { iwr http://download.microsoft.com/download/D/2/3/D23F4D0F-BA2D-4600-8725-6CCECEA05196/vs_community_ENU.exe -OutFile c:\tmp\vs.exe }"
c:\tmp\vs.exe /InstallSelectableItems /Passive

echo "Installing NuGet"
powershell -command "& { iwr https://dist.nuget.org/win-x86-commandline/v3.4.4/NuGet.exe -OutFile c:\tmp\nuget.exe }"
c:\tmp\nuget.exe restore

exit /b %ERRORLEVEL%
' >/dev/null
########################### Others
#! /bin/sh
set -eu

nix-shell -I channel:nixos-18.09 -p bash netcat vagrant curl --run "(vagrant up windows --no-provision && nc -z -w1 127.0.0.1 55985) || (echo Execute contents of init-WinRM.bat as Administrator, install Guest Additions, reboot, 'vagrant reload windows'. Then re-execute ./init-windows.bat && false)"
nix-shell -I channel:nixos-18.09 -p vagrant --run "vagrant provision windows --provision-with init"
