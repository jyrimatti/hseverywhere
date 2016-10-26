:: 2>/dev/null || echo '
::::::::::::::::::::::::::: Windows

cd c:\vagrant
"c:\Progra~2\MSBuild\14.0\Bin\MSBuild.exe" %1\windows\%1.sln /t:Publish

exit /b %ERRORLEVEL%
' >/dev/null
########################### Others
#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -eu

command -v vagrant >/dev/null || (echo Please install Vagrant and VirtualBox for Windows development && false)
nc -z -w1 127.0.0.1 55985; test $? = 0 || (echo 'Could not connect WinRM' && false)
vagrant provision windows --provision-with package
