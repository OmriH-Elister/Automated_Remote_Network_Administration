while ($True)
	{
	$choice1 = read-host "This script automates the process of rebooting several remote LAN hosts in bulk. `n`r It needs a 'Remote-hosts.txt' file to be placed in its present working directory or else it will NOT be able to reboot more than one computer. In such a case it will ask you to provide a single hostname of a remote host and proceed to reboot it. `r`n Do you wish to proceed?(y/n)"	
	if ($choice1 = 'y'){
		if ($(test-path Remote-hosts.txt) -eq $True){
			foreach ($rem in $(get-content Remote-hosts.txt)){
				restart-computer -computername $hostname -credential $env:USERDOMAIN\$env:USERNAME
				}
				clear
				write-host "All done!"
				pause
				exit
				}	
		else {
			clear
			$HNA = read-host "No 'Remote-hosts.txt' file found => no bulk restart action initiated. What is the workstation you wish to reboot's hostname?"
			restart-computer -computername $hostname -credential $env:USERDOMAIN\$env:USERNAME
		}
	}
	elseif ( $choice1 -eq 'n' ){
		write-host "Bye" ; 
		exit
		}
	else{
		clear
		write-host "Invalid choice!"}
	}
