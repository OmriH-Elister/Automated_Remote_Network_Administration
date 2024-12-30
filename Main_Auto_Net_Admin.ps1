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
	write-output "2.I need to overwrite a configuration file"
	write-output "3. I need to start the Win-RM service on a all of the LAN hosts listed in a file"
	if ($PN -eq "1") { .\resetpass.ps1 }
	elseif ($PN -eq "2") { .\allhostsfixfile.ps1 }
	elseif ($PN -eq "3") { .\allhosts_startwinrm.ps1 }
	
