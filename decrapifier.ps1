write-Host "*******Decrapifying Windows 10...*******"
write-Host "***Removing App Packages...***"

#I recommend running this script on a fresh install, though it should work fine anyways.  Should ;)
#This part removes all the apps.  By default, it removes every except the calculator and the store.  To remove all apps, comment out this part...


Get-AppxPackage -AllUsers | where-object {$_.name -notlike "*Microsoft.WindowsStore*"} | where-object {$_.name -notlike "*Microsoft.WindowsCalculator*"} | Remove-AppxPackage 

Get-AppxProvisionedPackage -online | where-object {$_.packagename -notlike "*Microsoft.WindowsStore*"} | where-object {$_.packagename -notlike "*Microsoft.WindowsCalculator*"} | Remove-AppxProvisionedPackage -online

#... and comment in this one:

#Get-AppxPackage -allusers | Remove-AppxPackage

#Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online


# Now apps are removed, below we will disable a bunch of features.  By no means a catch-all, more of a catch-most :)

write-Host "***Disabling delivery optimization...***"

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /t REG_DWORD /v DODownloadMode /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /t REG_DWORD /v SystemSettingsDownloadMode /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f

# Next Section is for Anniversary Edition Only, comment it in if you are on 1607+, no effect it seems on previous editions

#Write-Host "***Disabling Suggested Apps, Feedback, Lockscreen Spotlight***"
#reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\" /t REG_DWORD /v SystemPaneSuggestionsEnabled /d 0 /f
#reg add "HKCU\Software\Microsoft\CurrentVersion\ContentDeliveryManager\SoftLandingEnabled" /t REG_DWORD /v SoftLandingEnabled /d 0 /f
#reg add "HKCU\Software\Microsoft\CurrentVersion\ContentDeliveryManager\" /t REG_DWORD /v RotatingLockScreenEnable /d 0 /f

write-Host "***Disabling OneDrive...***"

reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSyncNGSC /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /t REG_DWORD /v DisableFileSync /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /t REG_BINARY /v OneDrive /d 0300000021B9DEB396D7D001 /f

write-Host "***Disabling telemetry...***"

reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /t REG_DWORD /v AllowTelemetry /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f

write-Host "***Setting Windows 10 privacy options...***"

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /t REG_DWORD /v LetAppsAccessAccountInfo /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /t REG_DWORD /v Enabled /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /t REG_DWORD /v EnableWebContentEvaluation /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /t REG_DWORD /v Enabled /d 0  /f
reg add "HKCU\Control Panel\International\User Profile" /t REG_DWORD /v HttpAcceptLanguageOptOut /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /t REG_DWORD /v AcceptedPrivacyPolicy /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /t REG_DWORD /v Enabled /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /t REG_DWORD /v RestrictImplicitTextCollection /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /t REG_DWORD /v RestrictImplicitInkCollection /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /t REG_DWORD /v HarvestContacts /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /t REG_DWORD /v NumberOfSIUFInPeriod /d 0 /f

write-Host "***Disabling Cortana and Bing search...***"

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

write-Host "***Disabling scheduled tasks...***"

schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable 
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable

write-Host "***Stopping and disabling diagnostics tracking services, Onedrive sync service, various Xbox services, Distributed Link Tracking, and Windows Media Player network sharing (you can turn this back on if you share your media libraries with WMP)...***"

get-service Diagtrack,DmwApPushService,OneSyncSvc,XblAuthManager,XblGameSave,XboxNetApiSvc,TrkWks,WMPNetworkSvc | stop-service -passthru | set-service -startuptype disabled

write-host "*******Decrapification complete.*******"

write-Host "If you have unremovable tiles on your start menu afterwards, copy c:\users\USER\appdata\local\tiledatalayer from a fresh profile, AFTER running the script, to your profile, overwriting what is there. The main file is tiledatelayer.edb. This will give you a default start menu but without all the useless app icons." 

write-Host "*******Reboot your computer now!*******"

