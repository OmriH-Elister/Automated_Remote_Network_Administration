import-module activedirectory
$username = read-host "What is the username?"
$domain = read-host "What is the domain?"
$pwd = read-host "What is the chosen password?"
set-ADaccountPassword -NewPassword (convertTo-secureString -asplaintext $pwd -Force) -Identity $username -server $domain
unlock-adaccount -identity $username -server $server
write-host "All done. Tell the user to try and use the password 'passwd'"
pause
