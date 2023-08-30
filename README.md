# Automated_Remote_Network_Administration
A few scripts (mainly powershell ones) written to ease the process of managing multiple endpoints on a network. 
Often, they would need slight parameter modification to achieve the needed results. 
1. Rem_DC_Script1.bat- Automates the process of quering for users on a remote host on a network and then disconnecting said user's session with the newly found session ID.  
2. Rem_DC_Script2.bat - Same as above, with the slight variation of not taking the ID number as input from the user. 
3. allhoststfixfiles.ps1
4. allhostststartwinrm.ps1 - this is a powershell script that loops through a list of hostnames/ipaddresses and activates the WinRM service on all of them.
5. auto_loop_allhosts_telnetenum.bat
6. enable_adapt.ps1 -This script automates the process of troubleshooting bad network settings of a remote host's network adapter (Naturally it'd would have to have another fully functional Network Adapater to facilitate the remote connection). 
7. hoststodowinrm.bat - this is a batch files that loops through a list of hostnames/ip-addresses and rand activates the WinRM on all of them.
8. resetpass.ps1 - is a script that automates the process of resetting a domain user's password utilizing powershell commands for time saving purposes.
