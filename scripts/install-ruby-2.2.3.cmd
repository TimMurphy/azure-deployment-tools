echo Searching for Ruby 2.2.3...
if exist %DEPLOYMENT_TOOLS%\ruby\nul (
    echo Found Ruby 2.2.3.
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

if exist %DEPLOYMENT_TOOLS%\installers\ruby-2.2.3-i386-mingw32.7z (
    echo Ruby installer exists.
) else (    
    echo Downloading Ruby installer...
    curl -Lo %DEPLOYMENT_TOOLS%\installers\ruby-2.2.3-i386-mingw32.7z http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.2.3-i386-mingw32.7z 
    if "%ERRORLEVEL%" NEQ "0" goto error
    echo Downloaded Ruby installer.
)

echo Installing Ruby...
%DEPLOYMENT_7ZIP% x %DEPLOYMENT_TOOLS%\installers\ruby-2.2.3-i386-mingw32.7z -o%DEPLOYMENT_TOOLS%
if "%ERRORLEVEL%" NEQ "0" goto error

echo Renaming Ruby directory...
move %DEPLOYMENT_TOOLS%\ruby-2.2.3-i386-mingw32 %DEPLOYMENT_TOOLS%\ruby > nul
if "%ERRORLEVEL%" NEQ "0" goto error

:exit
echo Successfully installed Ruby 2.2.3.
exit /b 0

:error
echo Installation of Ruby 2.2.3 failed. ERRORLEVEL '%ERRORLEVEL%'
if "%ERRORLEVEL%" == "0" exit /b 1
exit /b %ERRORLEVEL%
