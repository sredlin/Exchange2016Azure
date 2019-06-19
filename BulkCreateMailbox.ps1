param
    (
		[Parameter(Mandatory=$true)]
		[String]$DomainName,

		[Parameter(Mandatory=$true)]
		[String]$StorageSize,

		[Parameter(Mandatory=$true)]
		[PSCredential]$VMAdminCreds,

		[Parameter(Mandatory=$true)]
		[String]$Location,

		[Parameter(Mandatory=$true)]
		[String]$Company
	)


$Forest = (Get-ADDomain).forest
$domain = $Forest
[string]$acceptedDomain = (Get-ADDomain).Name
$acceptedDomain = $acceptedDomain + ".mustertenant.de"

[string]$domain,$tld = $domain.split(".")

$exchangeServer = "$Env:COMPUTERNAME" | Where {
    Test-Connection -ComputerName $_ -Count 1 -Quiet
} | Get-Random

$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri ("http://{0}.{1}/PowerShell" -f $exchangeServer,$Forest)
#Import-PSSession $ExchangeSession

New-AcceptedDomain -Name "$acceptedDomain" -DomainName $acceptedDomain -DomainType Authoritative


$Database = (Get-MailboxDatabase).Name 

#Add Users in Kiel
New-Mailbox -UserPrincipalName “maxi@$domain” -Alias "max.mustermann" -Name “Max Mustermann” -firstname “Max”  -LastName "Mustermann" -SamAccountName "Maxi"  -database $database -Password (ConvertTo-SecureString -String P@ssw0rd -AsPlainText -Force) -OrganizationalUnit "OU=Users,OU=Kiel,OU=Branch,OU=LEARN-ute,DC=$domain,DC=$tld" -PrimarySmtpAddress "max.mustermann@$acceptedDomain"
Get-ADUser -Identity "maxi" | Set-ADUser -City "Kiel" -OfficePhone "0431 123123 1" -Company Ausbildung -Country DE -Office Office -Organization Organisation -Department IT -StreetAddress "Musterstraße 1" -PostalCode 24145