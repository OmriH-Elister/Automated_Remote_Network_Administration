$ServerName = read-host "Please Insert the application's server Hostname/IP Address"
cmd /c psexec \\$ServerName /u:username /p:password -s powershell -command {
	import-module WebAdministration 
	$applicationpoolname = "PoolName"
	$waitDurationSeconds = 300
	stop-WebAppPool -Name $applicationPoolName
	Start-Sleep -Seconds $waitDurationSeconds	
	Start-WebAppPool -Name $applicationPoolName 
	}
	
