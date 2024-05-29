$listpath = read-host "Please specify the full path to your target hosts file: "
$filepath = "$env:USERPROFILE\Documents\drivers\x64\x64.zip"
$logfile = "C:\scripts\filenamelog.txt" 
[System.Collections.ArrayList]$list = @(Get-content $listpath)
[System.Collections.ArrayList]$done = @()

foreach($ComputerName in $list){
        "Processing $ComputerName"
        copy-item $filepath "\\$ComputerName\c$\Install\x64.zip" 
		Expand-Archive  -path \\$ComputerName\c$\Install\x64.zip -force -destinationpath \\$ComputerName\c$\Install\x64\
        $done.Add($ComputerName) | Out-Null
      }
    
Add-Content $done -Path $logfile
$done | foreach{$list.Remove($_)}
Set-Content -Path $listpath -Value $list
