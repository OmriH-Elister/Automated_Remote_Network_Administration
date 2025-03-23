# Automated_Remote_Network_Administration
A few scripts (mainly powershell ones) written to ease the process of managing multiple endpoints on a network. 
Often, they would need slight parameter modification to achieve the needed results. 
1. Rem_DC_Script1.bat- Automates the process of quering a user on a remote network host, and then disconnecting said user's session with the newly found session ID.  
2. Rem_DC_Script2.bat - Same as above, with the slight variation of not taking the ID number as input from the user. 
3. allhosts_routinemaintenance - This is a powershell script that loops through a list of hostnames/ip-addresses on a network and performs routine maintenance tasks on each of them (deletes temporary files, performs disk defragmantaion on their c drives, runs a scan for corruptions within the file-systems and fixes what it can and checks for digital signatures of known system files).
4. allhost_startwinrm.ps1 - This is a Powershell script that loops through a list of hostnames/ipaddresses on a network and activates the WinRM service on each of them. The user needs to replace the path of the hosts list to a path of his own list.
5. auto_loop_allhosts_telnetenum.bat -This is a batch script that loops through a list and initiates a connection via the telnet protocol with each of them. It then saves the resulting output to a file.  The user needs to replace the path of the hosts list to a path of his own list.
6. enable_adapt.ps1 -This script automates the process of troubleshooting bad network settings of a remote host's network adapter (Naturally it would have to have another fully functional Network Adapater to facilitate the remote connection).
7. enable_adapt2.ps1 - This scripts serves the same purpose as the previous (#6), that is, to automatically troubleshoot a network adapter which despite having a proper physical link connection, is disconnected.
It is different in that it is much more thurough in its method of shutting down and turning the network adapter back on, basically simulating a reboot in terms of networking.
* This is for when you'd rather not reboot to fix the adapter connection, as it sometimes compromises other functions, but the fix still necessitates a more extreme solution than simply disabling and reenabling the adapter.
9. allhostwinrm.bat - This is a batch files that loops through a list of hostnames/ip-addresses and and activates the WinRM on all of them.
10. resetpass.ps1 - is a script that automates the process of resetting a domain user's password utilizing powershell commands for time saving purposes.
11. shadowadmins4list - This script takes a csv list of hosts as input, stores them as a list in a variable and loops through each of the hosts, establishes a remote connection to it and creates a local admin user on it. It then proceeds to write a new registry value on said host that conceals the user and associated info from being listed in the ordinary most common ways (Basically, one needs to explicitally issue a command specifying the username in order to show it and its associated information.)
12. Remove_ShadowAdmin4list.ps1 - This script is meant to undo the actions of the previous script (#11 shadowadmins4list). It aims to reverts the computers in its input list to the state they were in before the shadowadmins4list.ps1 had been run on them.
13. allhoststfixfiles.ps1 - This script takes a list of remote hosts as input, loops through each of them and copies a local configuration file over two remote files in smb shared locations on each remote host
14. ascert_chrome_ver.ps - This script takes a list of hosts as input, loops through each of them and ascertains their installed Google Chromes' versions. It also compiles a list of all of the checked hosts and each host's respective Chrome version.
15. install_driver.ps1 - This script takes a list of hosts as input, loops through each of them and uploads a compressed archive onto them, it then proceeds to expand the archives, thereby installing the drivers within them. Finally, it edits the list file and removes the hosts it had already finished uploading the drivers onto.  This is done so that one can stop working and continue to work with the same list at a later time without having to upload to hosts he had completed to upload to redundantly. 
16. corroborate_domain_computers.ps1 - Takes a list of complete or partial hostnames\ipaddresses, loops through each of them, and corroborates their membership in the "domain users" group on a user inserted domain.
17. find_daylight_util.ps1 - This script takes a list of hosts as input, loops through each of them and outputs each of the hosts' date of day light savings change.
18. enabdisab.ps1 - This powershell script enables the user to choose between two methods designed to attempt and fix a dysfunctional cellular adapter. It is a script that runs remotely on a provided list of hosts, so naturally, it needs the remote hosts to each have an alternative functional adapter in order to establish a connection. 
