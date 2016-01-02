@echo off
echo Validating the environment is correctly configured for azure-deployment-tools...

rem Trimming any trailing slash ADT_TOOLS...
if "%ADT_TOOLS:~-1%"=="\" set ADT_TOOLS=%ADT_TOOLS:~0,-1%  

if not exist %ADT_TOOLS%\..\nul (
    echo Cannot find ADT_TOOLS' parent directory '%ADT_TOOLS%\..'
    goto error
)

rem Setting default environment variables...
if not defined ADT_INSTALLERS set ADT_INSTALLERS=%ADT_TOOLS%\installers
if not defined ADT_SCRIPTS set ADT_SCRIPTS=%~dp0

rem Trimming any trailing slashes...
if "%ADT_INSTALLERS:~-1%"=="\" set ADT_INSTALLERS=%ADT_INSTALLERS:~0,-1%  
if "%ADT_SCRIPTS:~-1%"=="\" set ADT_SCRIPTS=%ADT_SCRIPTS:~0,-1%

rem Making directories...
if not exist %ADT_TOOLS%\nul md %ADT_TOOLS%
if not exist %ADT_INSTALLERS%\nul md %ADT_INSTALLERS%

if not exist %ADT_SCRIPTS%\nul (
    echo Cannot find ADT_SCRIPTS '%ADT_SCRIPTS%'.
    goto error
)

if not defined ADT_7ZIP (
    echo Setting default ADT_7ZIP...
    set ADT_7ZIP=%ADT_SCRIPTS%\..\..\7zip\7zip-lite\7z.exe
)

if not exist %ADT_7ZIP% (
    echo Cannot find ADT_7ZIP '%ADT_7ZIP%'.
    goto error
)

echo The environment is correctly configured for azure-deployment-tools.
exit /b 0

:error
exit /b 1
