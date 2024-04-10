$desthosts = Get-Content -Path $home\desktop\hosts.txt
foreach ($rem in $desthosts){ 
	Invoke-command -command { cmd.exe /c sc \\$rem start WinRM } }
