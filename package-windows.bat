:: 2>/dev/null || echo '
::::::::::::::::::::::::::: Windows

cd c:\vagrant
"c:\Progra~2\MSBuild\14.0\Bin\MSBuild.exe" %1\windows\%1.sln /t:Publish

exit /b %ERRORLEVEL%
' >/dev/null
########################### Others
#! /bin/sh
set -eu

nix-shell -I channel:nixos-18.09 -p vagrant --run "command -v vagrant >/dev/null || (echo Please install VirtualBox for Windows development && false)"
nix-shell -I channel:nixos-18.09 -p netcat --run "nc -z -w1 127.0.0.1 55985 || (echo 'Could not connect WinRM' && false)"
nix-shell -I channel:nixos-18.09 -p vagrant --run "vagrant provision windows --provision-with package"
