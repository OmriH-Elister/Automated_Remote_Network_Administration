@echo off 
%password% = copy /p "please insert password"
for /l %%I in (1,1,255) do telnet -l %userdomain%\%username% 150.130.112.%%I -f >> allhostsinfo.txt 
for /l %%I in (1,1,255) do systeminfo /U %userdomain%\%username% /p /s 10.63.199.%%i >> allhostsinfo2.txt
