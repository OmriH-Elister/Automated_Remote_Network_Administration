Write-output "Hello, and welcome to the automatic Cellular adapter fixer."
$username = "Please supply a valid username to authenticate with"
$password = "Please supply a valid password for the chosen username"
Write-output "This script utilizes a file of hosts as input to run on, It requires that you compile a list of hostnames and/or IP address (one per each line) and name said file badcell.txt, otherwise it will not work properly." 
Write-output "Please select the fixing method from the options below:"
Write-output " 1. Use psexec to establish a remote connection, set the cellular adapter to use dhcp and restart the adapter."
Write-output " 2. Use psexec to establish a connection in order to enable ps-remoting and then run Powershell to invoke commands to set the cellular adapter to DHCP and reload it utilizing Winrm"
$choice = read-host "make your choice!"
if ($choice -eq "1"){
	cmd /c psexec "@badcell.txt" -u:$username -p:$password-s "netsh interface ipv4 set address name='Cellular 2' || netsh interface ipv4 set address name='Cellular' dhcp && powershell -c enable-psremoting && powershell -c restart-netadapter -interfacealias 'Cellular 2' || powershell -c restart-netadapter -interfacealias 'Cellular'"
	}
elseif ($choice -eq "2"){
	$desthosts = @(get-content badcell.txt)
	foreach($dest in $desthosts){
		cmd /c sc \\$dest start winrm
		cmd /c psexec \\$dest -u:$username -p:$password -s powershell -c enable-psremoting
		invoke-command -computername $dest -scriptblock {
			$celladap = (Get-NetIPAddress -InterfaceAlias "Cellular*" | Select-Object -ExpandProperty IPAddress)
			$celladap2 - (Get-NetIPAddress -InterfaceAlias "Cellular*" | Select-Object -ExpandProperty InterfaceAlias)
			if ($celladap -like "^100\.95\.0\.\d{1,3}$" -or $celladap -like "^100\.93\.0.\d{1,3}$")
				{ 
				write "IP is correct"
				continue 
				}
			else
				{	
					Write-Output $dest
					Write-Output $celladap	
					pause
					netsh interface ipv4 set address name="$calladap2" dhcp
					restart-netadapter -name "$celladap2"
				
				}
				}
				}
				}
else {
			write-output "Invalid choice!"
			}
			
