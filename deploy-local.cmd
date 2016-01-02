@echo off
rem Test deploy.cmd on local machine 

pushd %~dp0%

SET ADT_INSTALLERS=
set ADT_SCRIPTS=
set ADT_TOOLS=%CD%\deployment-tools
set ADT_7ZIP=%CD%\node_modules\7zip\7zip-lite\7z.exe

call .\deploy
