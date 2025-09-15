$desthosts = @()
foreach ($rem in $desthosts){ 

	$path1 = read-host "what is the SMB path of the remote damaged file?" ; `
	$path2 = read-host "what is the SMB path of the second remote damaged file?" ; ` ; `
	$path3 = read-host "What is the local path for the correct configuration file to be copied over the damaged ones?"
	copy-item -path $path3 -destination $path1 -force ; `
	copy-item -path $path3 -destination $path2 -force ; ` 
	Write-Output "success" ; ` }
