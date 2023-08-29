$desthosts = Get-Content -Path $home\desktop\hosts_tablet.txt
foreach ($rem in $desthosts){ 
	Invoke-command -command { cmd.exe /c sc \\$rem start WinRM } }