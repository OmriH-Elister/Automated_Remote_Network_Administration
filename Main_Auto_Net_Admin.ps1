while ($true)
{
	cmd /c color 03
	set-localion "$env:USERPROFILE/Automated_Remote_Network_Administration"
	clear
	write-output "#########################################################################################"
	write-output "Welcome To Automated Network Administration Script!"
	write-output "#########################################################################################"
	$PN = read-host "What is your chosen action?"
	write-output "1.The user needs an AD password reset"
	write-output "2.I need to overwrite a configuration file on LAN hosts listed in a file"
	write-output "3. I need to start the Win-RM service on LAN hosts listed in a file"
	write-output "4. I need to ascertain Google Chrome's version on LAN hosts listed in a file"
	Write-output "5. I need to troubleshoot a remote Ethernet adapter, device has no ethernet IP address"
	if ($PN -eq "1") { .\resetpass.ps1 }
	elseif ($PN -eq "2") { .\allhostsfixfile.ps1 }
	elseif ($PN -eq "3") { .\allhosts_startwinrm.ps1 }
	elseif ($PN -eq "4" { .\ascert_chrome_ver.ps1 }
	elseif ($PN -eq "5" { .\enable_adapt.ps1 }
	
