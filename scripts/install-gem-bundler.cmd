echo Searching for gem bundler...
if exist %ADT_TOOLS%\ruby\bin\bundler.bat (
    echo Found gem bundler.
    exit /b 0 
)

echo Installing gem bundler...
call %ADT_TOOLS%\ruby\bin\gem install bundler
if "%ERRORLEVEL%" NEQ "0" goto error

:exit
echo Successfully installed gem bundler.
exit /b 0

:error
echo Installation of gem bundler failed. ERRORLEVEL '%ERRORLEVEL%'
if "%ERRORLEVEL%" == "0" exit /b 1
exit /b %ERRORLEVEL%
