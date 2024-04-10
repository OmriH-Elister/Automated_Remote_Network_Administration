@echo off
set HOSTS_FILE=hosts.txt
for /f "delims=\n tokens=*" %%A in ('type hosts.txt') do (sc %A% start WinRM)
