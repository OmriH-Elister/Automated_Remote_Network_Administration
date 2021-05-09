@echo off
echo ----------List of Directories and all Subdirectories (Recursive------------ > LocDIR.txt
dir /a:d /b /s | find /v ".." | find /v "File(s)              0">> LocDIR.txt 
echo -----------File counter for Directory (Presented as Directory of... Count of bytes in directory... Count of files in Directory)--------- >> LocDIR.txt
dir /s | findstr "Directory File(s)"  | find /v "File(s)              0" >> LocDIR.txt
notepad LocDIR.txt
