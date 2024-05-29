$desthosts = @(get-content .\hoststocheckdaylight.txt)
foreach($dest in $desthosts){
	cmd /c sc \\$dest start winrm
	invoke-command -computername $dest -ScriptBlock{
		cmd /c tzutil /g } >> resultsdaylight.txt 
		} 
