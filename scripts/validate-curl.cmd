@echo off

echo Validating curl installation...
where curl
if "%ERRORLEVEL%" == "0" (
    echo Validated curl installation.
    exit /b 0
)

echo Cannot find curl.exe in current path '%PATH%'.
exit /b 1
