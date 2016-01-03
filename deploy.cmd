@echo off

rem Tests and demonstrates scripts in this repository

pushd %~dp0%

echo Installing npm packages...
call npm install --no-optional
if "%ERRORLEVEL%" neq "0" goto error
echo Successfully installed npm packages.

if not defined ADT_TOOLS set ADT_TOOLS=D:\home\deployment-tools
if not defined ADT_7ZIP set ADT_7ZIP=%CD%\node_modules\7zip\7zip-lite\7z.exe

call .\scripts\validate-deployment-tools-setup.cmd
if "%ERRORLEVEL%" neq "0" goto error

call .\scripts\validate-curl.cmd
if "%ERRORLEVEL%" neq "0" goto error

call .\scripts\install-ruby-2.2.3.cmd
if "%ERRORLEVEL%" neq "0" goto error

call .\scripts\install-ruby-devkit-4.7.2.cmd
if "%ERRORLEVEL%" neq "0" goto error

call .\scripts\install-gem-bundler.cmd
if "%ERRORLEVEL%" neq "0" goto error
            
echo.
echo.
echo Deployment successfully completed.
exit /b 0

:error
echo.
echo.
echo Deployment failed. ERRORLEVEL '%ERRORLEVEL%'
exit /b %ERRORLEVEL%
