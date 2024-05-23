
$adapterName = "YourAdapterName"
$hostname = read-host "What is the hostname of the affected device?"
cmd.exe /c sc \\$hostname start winrm
$sess1 = new-pssession -computername $hostname
invoke-command -session $sess1 -scriptblock {
	Disable-NetAdapter -interfacealias $adapterName	
	Start-Process -FilePath "ipconfig" -ArgumentList "/flushdns" -NoNewWindow -Wait
	Start-Process -FilePath "netsh" -ArgumentList "int ipv4 reset name= $adapterName" -NoNewWindow -Wait
	Start-Process -FilePath "netsh" -ArgumentList "winsock reset" -NoNewWindow -Wait
	Start-Process -FilePath "ipconfig" -ArgumentList "/release $adapterName" -NoNewWindow -Wait
	Start-Process -FilePath "ipconfig" -ArgumentList "/renew $adapterName" -NoNewWindow -Wait
	Start-Process -FilePath "arp" -ArgumentList "-d *" -NoNewWindow -Wait
	Start-Process -FilePath "route" -ArgumentList "-f" -NoNewWindow -Wait
	$services = @("Dhcp", "dnscache", "netprofm", "nlasvc", "lmhosts", "WlanSvc", "IKEEXT", "RemoteAccess")
	foreach ($service in $services) {
		Restart-Service -Name $service -Force
		}
	$deviceInstanceId = (Get-PnpDevice -FriendlyName $adapterName).InstanceId
if ($deviceInstanceId) {
		Disable-PnpDevice -InstanceId $deviceInstanceId -Confirm:$false
		Start-Sleep -Seconds 5
		Enable-PnpDevice -InstanceId $deviceInstanceId -Confirm:$false
		} else {
    Write-Host "Network adapter not found."
		}
	Enable-NetAdapter -interfacealias $adaptername -confirm:$false
}
remove-pssession $sess1 ; `
pause