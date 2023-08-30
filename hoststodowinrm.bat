@echo off
set HOSTS_FILE=hosts_tablet.txt
for /f "delims=\n tokens=*" %%A in ('type hosts_tablet.txt') do (sc %A% start WinRM)