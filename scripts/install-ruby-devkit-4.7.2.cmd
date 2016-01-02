echo Searching for Ruby DevKit 4.7.2...
if exist %ADT_TOOLS%\ruby-devkit\nul (
    echo Found Ruby DevKit 4.7.2.
    exit /b 
)

if not defined ADT_7ZIP (
    echo ADT_7ZIP must be defined.
    goto error
)

if not exist %ADT_7ZIP% (
    echo Cannot find ADT_7ZIP '%ADT_7ZIP%'.
    goto error
)

if exist %ADT_INSTALLERS%\DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe (
    echo Ruby DevKit installer exists.
) else (    
    echo Downloading Ruby DevKit installer...
    curl -Lo %ADT_INSTALLERS%\DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe 
    if "%ERRORLEVEL%" NEQ "0" goto error
    echo Downloaded Ruby DevKit installer.
)

echo Installing Ruby DevKit...
%ADT_7ZIP% x %ADT_INSTALLERS%\DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe -o%ADT_TOOLS%\ruby-devkit
if "%ERRORLEVEL%" NEQ "0" goto error

call %ADT_SCRIPTS%\bind-ruby-devkit-4.7.2.cmd
if "%ERRORLEVEL%" NEQ "0" goto error

:exit
echo Successfully installed Ruby DevKit 4.7.2.
exit /b 0

:error
echo Installation of Ruby DevKit 4.7.2 failed. ERRORLEVEL '%ERRORLEVEL%'
if "%ERRORLEVEL%" == "0" exit /b 1
exit /b %ERRORLEVEL%
