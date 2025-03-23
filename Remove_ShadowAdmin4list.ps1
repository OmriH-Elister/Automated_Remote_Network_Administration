$hosts = get-content allhosts.txt
foreach ($int in $hosts){ invoke-command -computername $int -scriptblock { 
	set-executionpolicy bypass ; 
	remove-localgroupmember -group administrators -member sombregato ;
	remove-localuser -name sombregato ;
	cmd /c 'echo yes | reg delete "HKLM\SYSTEM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" ';
	echo 'success'
	}
	}