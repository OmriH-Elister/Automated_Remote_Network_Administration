# Automated_Remote_Network_Administration
A few scripts (mainly powershell ones) written to ease the process of managing multiple endpoints on a network. 
Often, they would need slight parameter modification to achieve the needed results. 
1. Rem_DC_Script1.bat- Automates the process of quering a user on a remote network host, and then disconnecting said user's session with the newly found session ID.  
2. Rem_DC_Script2.bat - Same as above, with the slight variation of not taking the ID number as input from the user. 
3. allhoststfixfiles.ps1
4. allhostststartwinrm.ps1 - This is a Powershell script that loops through a list of hostnames/ipaddresses on a network and activates the WinRM service on each of them. The user needs to replace the path of the list of hosts to the one of his own list.
5. auto_loop_allhosts_telnetenum.bat -This is a batch script that loops through a list and initiates a connection via the telnet protocol with each of them. It then saves the resulting output to a file. The user needs to replace the path of the list of hosts to the one of his own list.
6. enable_adapt.ps1 -This script automates the process of troubleshooting bad network settings of a remote host's network adapter (Naturally it'd would have to have another fully functional Network Adapater to facilitate the remote connection). 
7. hoststodowinrm.bat - This is a batch files that loops through a list of hostnames/ip-addresses and rand activates the WinRM on all of them.
8. resetpass.ps1 - is a script that automates the process of resetting a domain user's password utilizing powershell commands for time saving purposes.
