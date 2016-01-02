@echo off
echo Binding Ruby DevKit 4.7.2... 
rem Must change directory to config.yml is written and read from correct location
pushd %DEPLOYMENT_TOOLS%\ruby-devkit
if "%ERRORLEVEL%" NEQ "0" goto error

echo Creating Ruby DevKit config.yml...
%DEPLOYMENT_TOOLS%\ruby\bin\ruby.exe dk.rb init
if "%ERRORLEVEL%" NEQ "0" goto error

echo Adding Ruby to Ruby DevKit config.yml...
echo - %DEPLOYMENT_TOOLS%\ruby >> config.yml
if "%ERRORLEVEL%" NEQ "0" goto error
 
echo Binding...
%DEPLOYMENT_TOOLS%\ruby\bin\ruby.exe dk.rb install
if "%ERRORLEVEL%" NEQ "0" goto error

:exit
popd 
echo Successfully bound Ruby DevKit 4.7.2.
exit /b 0

:error
popd 
echo Binding Ruby DevKit 4.7.2 failed. ERRORLEVEL '%ERRORLEVEL%'
if "%ERRORLEVEL%" == "0" exit /b 1
exit /b %ERRORLEVEL%
