# web app details to fetch
#############################################################
$webAppName = “metavrse01” # web-app name
$resourceGroupName = “metavrse-webapps-rg” #web app resorce group
#############################################################

# Get the webapp details
#############################################################
$webApp = Get-AzureRmWebApp -ResourceGroupName $resourceGroupName -Name $webAppName
#############################################################

# Get the existing Appsettings
#############################################################
$appSettings = $webapp.SiteConfig.AppSettings
#############################################################

# Loop through existing app settings and add to variable
#############################################################
$newAppSettings = @{}
ForEach ($item in $appSettings) {
$newAppSettings[$item.Name] = $item.Value
}
#############################################################

# Update existing settings or add new one to variable
#############################################################
$newAppSettings.WEBSITE_NODE_DEFAULT_VERSION = “6.9”
$newAppSettings[‘newAppSetting01’] = “newSettingValue01”
$newAppSettings[‘newAppSetting02’] = “newSettingValue02”
#############################################################

# Apply the appsettings to the webapp
#############################################################
Set-AzureRmWebApp -AppSettings $newAppSettings -Name $webAppName -ResourceGroupName $resourceGroupName
#############################################################