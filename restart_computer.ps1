$HNA = read-host "This script automates the process of rebooting several remote LAN hosts in bulk. It needs a 'Remote-hosts.txt' file to be placed in its present working directory or else it will NOT be able to reboot more than one computer. In such a case it will ask you to provide a single hostname of a remote host and proceed to reboot it."
if $(test-path Remote-hosts.txt){
	foreach $rem in $(get-content Remote-hosts.txt){
	restart-computer -computername $hostname -credential $env:USERDOMAIN\$env:USERNAME
	}
	}
else {
	$HNA read-host "No 'Remote-hosts.txt' file found => no bulk restart action initiated. What is the workstation you wish to reboot's hostname?"
