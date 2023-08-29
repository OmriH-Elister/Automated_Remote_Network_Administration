$desthosts = @("MB-TAB0018", "MB-TAB0033", "MB-TAB0078", "MB-TAB0081")
foreach ($rem in $desthosts){ 
	$path1 = "\\$rem\c$\program files (x86)\MotorolaSolutions\DvrManager\DvrManager.Host.exe" ; `
	$path2 = "\\$rem\c$\program files (x86)\MotorolaSolutions\DvrManager\dvrmanager.host.exe.config" ; `
	copy-item -path C:\Users\bkjf37-adm\Desktop`\DvrManager.Host.exe -destination $path1 ; `
	copy-item -path c:\users\bkjf37-adm\Desktop\DvrManager.host.exe.config -destination $path2 ; ` 
	echo "success" ; ` }
