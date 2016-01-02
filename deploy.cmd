@echo off

rem Tests and demonstrates scripts in this repository

pushd %~dp0%

echo Installing npm packages...
call npm install --no-optional
if "%ERRORLEVEL%" neq "0" goto error
echo Successfully installed npm packages.

if not defined DEPLOYMENT_SCRIPTS set DEPLOYMENT_SCRIPTS=%CD%\scripts
if not defined DEPLOYMENT_TOOLS set DEPLOYMENT_TOOLS=D:\home\deployment-tools
if not defined DEPLOYMENT_7ZIP set DEPLOYMENT_7ZIP=%CD%\node_modules\7zip\7zip-lite\7z.exe

call %DEPLOYMENT_SCRIPTS%\validate-deployment-tools-setup
if "%ERRORLEVEL%" neq "0" goto error

call %DEPLOYMENT_SCRIPTS%\validate-curl
if "%ERRORLEVEL%" neq "0" goto error

call %DEPLOYMENT_SCRIPTS%\install-ruby-2.2.3.cmd
if "%ERRORLEVEL%" neq "0" goto error

call %DEPLOYMENT_SCRIPTS%\install-ruby-devkit-4.7.2.cmd
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
