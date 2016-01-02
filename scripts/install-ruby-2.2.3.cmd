echo Searching for Ruby 2.2.3...
if exist %ADT_TOOLS%\ruby\nul (
    echo Found Ruby 2.2.3.
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

if exist %ADT_INSTALLERS%\ruby-2.2.3-i386-mingw32.7z (
    echo Ruby installer exists.
) else (    
    echo Downloading Ruby installer...
    curl -Lo %ADT_INSTALLERS%\ruby-2.2.3-i386-mingw32.7z http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.2.3-i386-mingw32.7z 
    if "%ERRORLEVEL%" NEQ "0" goto error
    echo Downloaded Ruby installer.
)

echo Installing Ruby...
%ADT_7ZIP% x %ADT_INSTALLERS%\ruby-2.2.3-i386-mingw32.7z -o%ADT_TOOLS%
if "%ERRORLEVEL%" NEQ "0" goto error

echo Renaming Ruby directory...
move %ADT_TOOLS%\ruby-2.2.3-i386-mingw32 %ADT_TOOLS%\ruby > nul
if "%ERRORLEVEL%" NEQ "0" goto error

:exit
echo Successfully installed Ruby 2.2.3.
exit /b 0

:error
echo Installation of Ruby 2.2.3 failed. ERRORLEVEL '%ERRORLEVEL%'
if "%ERRORLEVEL%" == "0" exit /b 1
exit /b %ERRORLEVEL%
