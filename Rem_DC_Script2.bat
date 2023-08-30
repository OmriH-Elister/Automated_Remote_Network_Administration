 @echo off
 set /p SERVER="Enter IP\hostname:"
 quser /server:%SERVER%
 set /p ID="Select Session ID:"
 logoff %ID% /server:%SERVER%
 pause
 :EOF
 