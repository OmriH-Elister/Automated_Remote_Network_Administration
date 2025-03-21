param ( $StudenTestID )
write-host $StudenTestID
if ($StudenTestID -eq $null){$StudenTestID = read-host "What is the student-test id you need details for?"} else { write-host "Student test ID already filled" $StudenTestID}    
$ServerName ="brsh1sql1v"
$databaseName = "BroshSQLProd"
$userID = "BRSH\bkjf37-adm"
$password = "eltigreNEGRO07"
$connectionString = "Server=$ServerName;Database=$databaseName;Integrated Security=True;TrustServerCertificate=True;Encrypt=True;"
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()
$query = "SELECT MFTID FROM TESTFILES WHERE MFTTRASFERTYPE = 3 AND MFTSTSTID = $StudenTestID "
$command = $connection.CreateCommand()
$command.CommandText = $query
$result = $command.ExecuteReader()
$table = New-Object System.Data.DataTable
$table.Load($result)
$connection.Close()
$test2rmfblur = ($table | select-object -expandproperty MFTID)
$test2rmfblur
$connection.Open()
$query2 = "update TESTFILES set MFTSTATUS = 99 where MFTID = $test2rmfblur"
$command = $connection.CreateCommand()
$command.CommandText = $query2
$result = $command.ExecuteReader()
$table = New-Object System.Data.DataTable
$table.Load($result)
$connection.Close()
$table
remove-variable -Name StudenTestID
write-host "Done, the test transfer status has been set to 99"
echo $test2rmfblur >> ../MFTIDs_with_99status.txt
pause