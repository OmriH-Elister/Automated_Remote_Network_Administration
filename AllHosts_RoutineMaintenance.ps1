$desthosts = Get-Content -Path $home\desktop\all_hostnames.txt
foreach ($rem in $desthosts){ 
		try{
			invoke-command -computername  $rem -scriptblock {
				cmd.exe /c del /q /f /s %systemroot%\temp\* ; `
				cmd.exe /c del /q /f /s %TEMP%\* ; `
				start-process -filepath "defrag.exe" -argumentlist "c:" -nonewwindow -wait ; `
				start-process -filepath "sfc.exe" -argumentlist "/scannow" -nonewwindow -wait ; `
   				start-process -filepath "chkdsk.exe" -argumentlist "/f" -nonewwindow -wait ;`
				start-process -filepath "sigverif.exe" -nonewwindow -wait ; `
				clear-recyclebin -force -erroraction silentlycontinue ;`
				DISM /cleanup-image /restorehealth ;`
				}
		}
		catch{        	$errorMessage = "[$(Get-Date)] Failed to execute maintenance on $rem: $_"
		        	Write-Error $errorMessage
			        Add-Content -Path logFile.txt -Value $errorMessage
			
			}
		}
