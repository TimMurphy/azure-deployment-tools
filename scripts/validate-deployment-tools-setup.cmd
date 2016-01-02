@echo off
rem Validate the environment is correctly configured for azure-deployment-tools

if not exist %DEPLOYMENT_TOOLS%\..\nul (
    echo Cannot find DEPLOYMENT_TOOLS' parent directory '%DEPLOYMENT_TOOLS%\..'
    goto error
)

if not exist %DEPLOYMENT_TOOLS%\nul md %DEPLOYMENT_TOOLS%
if not exist %DEPLOYMENT_TOOLS%\installers\nul md %DEPLOYMENT_TOOLS%\installers

if not exist %DEPLOYMENT_SCRIPTS%\nul (
    echo Cannot find DEPLOYMENT_SCRIPTS '%DEPLOYMENT_SCRIPTS%'.
    goto error
)

if defined DEPLOYMENT_7ZIP (
    if not exist %DEPLOYMENT_7ZIP% (
        echo Cannot find DEPLOYMENT_7ZIP '%DEPLOYMENT_7ZIP%'.
        goto error
    )
)

exit /b 0

:error
exit /b 1
