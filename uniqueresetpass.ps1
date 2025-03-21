import-module activedirectory
$username = read-host "What is the username?"
$pwd = read-host "What password does the user want?"
$domain = read-host "What is the domain?"
$server = "$domain.local"
set-ADaccountPassword -NewPassword (ConvertTo-SecureString -asplaintext $pwd -Force) -Identity $username -server $server
set-aduser -identity $username -changepasswordatlogon $false -server $server
unlock-adaccount -identity $username -server $server
write-host "All done. Tell the user to try and use the password '$pwd'"
pause