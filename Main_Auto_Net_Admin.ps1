while ($true)
{
	set-location "$env:USERPROFILE\Automated_Remote_Network_Administration"
	Clear-Host
	write-output "#########################################################################################"
	write-output "Welcome To Automated Network Administration Script!"
	write-output "#########################################################################################"
	write-output "1. The user needs an AD password reset"
	write-output "2. Overwrite a configuration file on LAN hosts listed in a file"
	write-output "3. Start the Win-RM service on LAN hosts listed in a file"
	write-output "4. Ascertain Google Chrome's version on LAN hosts listed in a file"
	Write-output "5. Troubleshoot a remote Ethernet adapter (no ethernet IP address)"
	Write-output "6. Log off a logged in user from a remote LAN host"
	Write-output "7. Reboot computers from list or a single network device"
	Write-output "8. Reset AD password with unique password per user"
	Write-output "9. Upload and install a new Google Chrome version on hosts"
	Write-output "10. Perform routine maintenance on all hosts from list"
	Write-output "11. Corroborate domain-joined computers"
	Write-output "12. Remove Shadow Admin rights for users from list"
	Write-output "13. Enumerate Shadow Admins for users from list"
	Write-output "14. Enable/Disable a device or service remotely"
	Write-output "15. Alternative adapter troubleshooting on remote host"
	Write-output "16. Install a driver on a remote host"
	Write-output "17. Collect logs from remote host(s)"
	Write-output "18. Find a user in Active Directory"
	Write-output "19. Determine daylight saving time utility info on host"
	Write-output "20. Prepare list of hosts to enable WinRM (batch)"
	Write-output "21. Telnet enumeration loop for all hosts (batch)"
	Write-output "22. Remote user disconnection script 1 (batch)"
	Write-output "23. Remote user disconnection script 2 (batch)"
	$PN = read-host "What is your chosen action?"
	if ($PN -eq "1"){ .\resetpass.ps1 } `
	elseif ($PN -eq "2"){ .\allhoststfixfiles.ps1 } `
	elseif ($PN -eq "3"){ .\allhosts_startwinrm.ps1 } `
	elseif ($PN -eq "4"){ .\ascert_chrome_ver.ps1 } `
	elseif ($PN -eq "5"){ .\enable_adapt.ps1 } `
	elseif ($PN -eq "6"){ $dcChoice = Read-Host "Run disconnection script 1 or 2?"; if ($dcChoice -eq "1") { Start-Process Rem_DC_Script1.bat } elseif ($dcChoice -eq "2") { Start-Process Rem_DC_Script2.bat } else { Write-Host "Invalid choice for disconnection." } } `
	elseif ($PN -eq "7"){ .\restart_computer.ps1 } `
	elseif ($PN -eq "8"){ .\uniqueresetpass.ps1 } `
	elseif ($PN -eq "9"){ .\"Upload&Install_New_Chrome.ps1" } `
	elseif ($PN -eq "10"){ .\AllHosts_RoutineMaintenance.ps1 } `
	elseif ($PN -eq "11"){ .\corroborate_domain_computers.ps1 } `
	elseif ($PN -eq "12"){ .\Remove_ShadowAdmin4list.ps1 } `
	elseif ($PN -eq "13"){ .\shadowadmins4list.ps1 } `
	elseif ($PN -eq "14"){ .\enabdisab.ps1 } `
	elseif ($PN -eq "15"){ .\enable_adapt2.ps1 } `
	elseif ($PN -eq "16"){ .\install_driver.ps1 } `
	elseif ($PN -eq "17"){ .\GETLOG.ps1 } `
	elseif ($PN -eq "18"){ .\find_user.ps1 } `
	elseif ($PN -eq "19"){ .\find_daylight_util.ps1 } `
	elseif ($PN -eq "20"){ Start-Process hoststodowinrm.bat } `
	elseif ($PN -eq "21"){ Start-Process auto_loop_allhosts_telnetenum.bat } `
	elseif ($PN -eq "22"){ Start-Process Rem_DC_Script1.bat } `
	elseif ($PN -eq "23"){ Start-Process Rem_DC_Script2.bat } `
	else { write-host "Invalid choice!" } `
	Clear-Host
}	
