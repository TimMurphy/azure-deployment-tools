echo Searching for Ruby DevKit 4.7.2...
if exist %DEPLOYMENT_TOOLS%\ruby-devkit\nul (
    echo Found Ruby DevKit 4.7.2.
    exit /b 
)

if not defined DEPLOYMENT_7ZIP (
    echo DEPLOYMENT_7ZIP must be defined.
    goto error
)

if not exist %DEPLOYMENT_7ZIP% (
    echo Cannot find DEPLOYMENT_7ZIP '%DEPLOYMENT_7ZIP%'.
    goto error
)

if exist %DEPLOYMENT_TOOLS%\installers\DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe (
    echo Ruby DevKit installer exists.
) else (    
    echo Downloading Ruby DevKit installer...
    curl -Lo %DEPLOYMENT_TOOLS%\installers\DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe 
    if "%ERRORLEVEL%" NEQ "0" goto error
    echo Downloaded Ruby DevKit installer.
)

echo Installing Ruby DevKit...
%DEPLOYMENT_7ZIP% x %DEPLOYMENT_TOOLS%\installers\DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe -o%DEPLOYMENT_TOOLS%\ruby-devkit
if "%ERRORLEVEL%" NEQ "0" goto error

call %DEPLOYMENT_SCRIPTS%\bind-ruby-devkit-4.7.2.cmd
if "%ERRORLEVEL%" NEQ "0" goto error

:exit
echo Successfully installed Ruby DevKit 4.7.2.
exit /b 0

:error
echo Installation of Ruby DevKit 4.7.2 failed. ERRORLEVEL '%ERRORLEVEL%'
if "%ERRORLEVEL%" == "0" exit /b 1
exit /b %ERRORLEVEL%
