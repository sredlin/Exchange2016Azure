


$Forest = (Get-ADDomain).forest
$domain = $Forest
[string]$acceptedDomain = (Get-ADDomain).Name
$acceptedDomain = $acceptedDomain + ".mustertenant.de"

$exchangeServer = "$Env:COMPUTERNAME" | Where {
    Test-Connection -ComputerName $_ -Count 1 -Quiet
} | Get-Random

$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri ("http://{0}.{1}/PowerShell" -f $exchangeServer,$Forest)
Import-PSSession $ExchangeSession

New-AcceptedDomain -Name "$acceptedDomain" -DomainName $acceptedDomain -DomainType Authoritative


$Database = (Get-MailboxDatabase).Name 

New-Mailbox -UserPrincipalName “maxi@$domain” -Alias "max.mustermann" -Name “Max Mustermann” -firstname “Max”  -LastName "Mustermann" -SamAccountName "Maxi"  -database $database -Password (ConvertTo-SecureString -String P@ssw0rd -AsPlainText -Force) -OrganizationalUnit "OU=Users,OU=Kiel,OU=Branch,OU=LEARN-ute,DC=ute,DC=intern" -PrimarySmtpAddress "max.mustermann@$acceptedDomain"