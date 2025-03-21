$Date = Get-date -Year 2023 -Month 5 -Day 30
$StartTime = Get-Date -Year $Date.Year -Month $Date.Month -Day $Date.Day -Hour 0 -Minute 0 -Second 0
$EndTime =  Get-Date -Year $Date.Year -Month $Date.Month -Day $Date.Day -Hour 23 -Minute 59 -Second 59

Get-WinEvent -ComputerName "fictitious" -FilterHashTable @{ `
	LogName = "System" `
	StartTime = $StartTime `
	EndTime = $EndTime `
	}