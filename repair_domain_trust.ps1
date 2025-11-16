$creds = New-Object System.Management.Automation.PSCredentials("domain\domain-admin",(convertto-securestring "password" -asplaintext -force))
reset-computermachinepassword -credential $creds -server dc.local
restart-computer
