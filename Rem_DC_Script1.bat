 @echo off
 set /p SERVER="Enter IP:"
 for /F "tokens=2" %%F in ('quser /server:%SERVER%') do (set var=%%F)
 logoff %var% /server:%SERVER%
 :EOF