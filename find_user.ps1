$userToFind = Read-Host "Which user do you wish to locate?"
$Domain = Read-Host "On which Domain? (FQDN format)"
$Computers = Get-ADComputer -Filter {name -like "[insert hostname format here]*"} -server $Domain -ErrorAction SilentlyContinue | Select-object -ExpandProperty Name
if ($Computers -ne $null ){
    Invoke-command -ComputerName $Computers -ScriptBlock {
        query user | foreach-object {
            if ($_ -match "$using:userToFind") {
                write-output "$env:COMPUTERNAME : $_" 
                break
                exit
                } 
            } 
            } -ErrorAction SilentlyContinue 
            }
pause
       
     