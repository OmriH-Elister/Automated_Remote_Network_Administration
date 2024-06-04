$domain = read-host "what is the domain name?"
$desthosts = get-content $myhosts
foreach($dest in $desthosts){
	get-adgroupmember -identity "Domain Computers" -Server "$domain.local" | where-object -Property distinguishedName -Like "*OU=$dest*" | select-object -property name  | tee-object .\outputhosts.txt -append }
