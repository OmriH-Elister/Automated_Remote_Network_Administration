$desthosts = get-content listfile.txt
#set-executionpolicy bypass
foreach($rem in $desthosts){
	cmd /c sc \\$rem start WinRM ; 
	copy-item -path C:\Users\public\Desktop\Installers\GoogleChromeStandaloneEnterprise64.msi -destination \\$rem\c$\windows\GoogleChromeStandaloneEnterprise64.msi ;
	start-sleep -seconds 10 ; 
	invoke-command -ComputerName $rem -ScriptBlock {
		set-executionpolicy bypass -scope process -force
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\AppHost" -Name "EnableWebContentEvaluation" -Value 0
		start-process "msiexec.exe" -argumentlist "/i GoogleChromeStandaloneEnterprise64.msi /quiet /norestart /qn" -Wait ; 
		write-host success ; 
		}
	cmd /c reg query "\\$rem\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{CCFFC2EC-F561-3EF1-8038-F3608B52F935}" /v DisplayVersion >> c:\logs\omrilog7.txt  ;
	write-host Log Entry Appended ; `
	}