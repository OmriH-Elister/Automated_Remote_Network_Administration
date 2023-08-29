import-module activedirectory
$username = read-host "What is the username?"
$domain = read-host "What ist the domain (brsh\mafila\mafilb)?"
if ($domain -eq "mafila") { $server = "mafila.brsh.local" } elseif ($domain -eq "mafilb") { $server = "mafilb.brsh.local" } else { $server = "brsh.local" } ; `
set-ADaccountPassword -NewPassword (convertTo-secureString -asplaintext "Aa123456" -Force) -Identity $username -server $server
set-aduser -identity $username -changepasswordatlogon $false -server $server
unlock-adaccount -identity $username -server $server
write-host "All done. Tell the user to try and use the password 'Aa123456'"
pause