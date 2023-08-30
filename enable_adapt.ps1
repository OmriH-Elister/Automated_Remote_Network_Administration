$hostname5 = read-host "What is the hostname of the affected device?"
cmd.exe /c sc \\$hostname5 start WinRM
$sess1 = new-pssession -computername $hostname5 
invoke-command -session $sess1 -scriptblock { 
enable-netadapter -name "Ethernet" 
netsh interface ipv4 set address name="Ethernet" dhcp
restart-netadapter -name "Ethernet"
}
remove-pssession $sess1 ; `
pause
