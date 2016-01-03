# azure-deployment-tools

Collection of cmd scripts to install deployment tools on an Azure website

## Azure Configuration

scripts\install-gem-bundler.cmd is very slow to run on small Azure AppService. It is likely you need to change AppSetting SCM_COMMAND_IDLE_TIMEOUT to higher than default value 60. I use 1,000.  