:: 2>/dev/null || echo '
::::::::::::::::::::::::::: Windows

cd c:\vagrant
::"c:\Progra~2\MSBuild\14.0\Bin\MSBuild.exe" %1\windows\%1.sln /t:Build /p:OutDir=c:\vagrant-build\bin\x64\Debug\;Configuration=Debug;Platform=x64;AppxBundlePlatforms="x64";AppxBundle=Always;OutputPath=c:\vagrant-build\bin\x64\Debug\;TargetFrameworkVersion=v4.6
"c:\Progra~2\MSBuild\14.0\Bin\MSBuild.exe" %1\windows\%1.sln /t:Build /p:OutDir=c:\vagrant-build\bin\x64\Debug\;Configuration=Debug;Platform=x64;AppxBundlePlatforms="x64";AppxBundle=Always;OutputPath=c:\vagrant-build\bin\x64\Debug\
powershell c:\vagrant-build\bin\x64\Debug\%1\AppPackages\%1_1.0.0.0_Debug_Test\Add-AppDevPackage.ps1

timeout 3

run-windows.vbs %1

exit /b %ERRORLEVEL%
' >/dev/null
########################### Others
#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash netcat vagrant
set -ux

nix-shell -I channel:nixos-18.09 -p vagrant --run "command -v vagrant >/dev/null || (echo Please install Vagrant and VirtualBox for Windows development && false)"
nix-shell -I channel:nixos-18.09 -p vagrant --run "vagrant up windows --no-provision"
nix-shell -I channel:nixos-18.09 -p netcat --run "nc -z -w1 127.0.0.1 55985 || (echo 'Could not connect WinRM' && false)"
nix-shell -I channel:nixos-18.09 -p vagrant --run "vagrant provision windows --provision-with run"
