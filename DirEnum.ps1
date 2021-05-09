"Please enter A path you wish to enumerate" 
$var1= Read-Host 
"Directories In Total:" >output.txt
get-childitem -recurse -Directory -path $var1 2>$null | Measure-Object | Format-List count 2> $null >> output.txt 
"Files In Total:">>output.txt
Get-ChildItem -path $var1 -recurse -File  2>$null | Measure-Object | format-list count 2> $null >> output.txt
"Files Count:">>output.txt
Get-ChildItem -path $var1 -File  2>$null | Measure-Object | format-list Count 2> $null >> output.txt
"Directory Count:">>output.txt
Get-ChildItem -path $var1 -Directory  2>$null | Measure-Object | Format-List Count 2> $null >>output.txt
get-childitem -path $var1 -recurse -directory  2>$null | ForEach-Object -Begin $null `
{"Directory_Name: $_"},{"------------------------------------"}`
,{'File'},{$_.GetFiles() | Measure-Object | format-list Count},{'Directory'},{Get-ChildItem -Directory | Measure-Object | Format-List Count}`
,{"------------------------------------"}  -End $null  2>$null >> output.txt
get-content .\output.txt | where{$_ -ne ""} > output1.txt