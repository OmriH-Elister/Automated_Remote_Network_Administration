$desthosts = Get-Content -Path $home\desktop\all_hostnames.txt
foreach ($rem in $desthosts){ 
	invoke-command -computername  $rem -scriptblock {
			cmd.exe /c del /q /f /s %systemroot%\temp\* ; `
			cmd.exe /c del /q /f /s %TEMP%\* ; `
			cmd.exe /c defrag c: ; `
			cmd /c sfc /scannow ; `
   			cmd.exe /c chkdsk ;'
      			cmd.exe /c sigverif ;`
			}
	}
