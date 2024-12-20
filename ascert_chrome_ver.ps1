$hosts_file = read-host "Please specify the full path to your target hosts file"
$desthosts = @(get-content $hosts_file)
[System.Collections.ArrayList]$done = @()
foreach($rem in $desthosts){
	echo "$rem :" >> $env:USERPROFILE\desktop\versions_chrome.txt
	cmd /c sc \\$rem start winrm
	sleep 6
	invoke-command -computername $rem -scriptblock { 
			(get-item "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe").VersionInfo.productversion ;`
		} >> $env:USERPROFILE\desktop\versions_chrome.txt
		 
		}
