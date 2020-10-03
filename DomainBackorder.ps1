#
#
#Change domain on lines 32, 51
#Change api username/key in lines 46-48
#Change ClientIp on line 50

$a = 1
$FirstName="First";
$LastName="Last";
$Address1="Address";
$StateProvince="State";
$PostalCode="PostCode";
$City="City";
$Country="Country";
$Phone="Phone";
$EmailAddress="email";

<#
		"AuxBillingFirstName"=$FirstName;
		"AuxBillingLastName"=$LastName;
		"AuxBillingAddress1"=$Address1;
		"AuxBillingStateProvince"=$StateProvince;
		"AuxBillingPostalCode"=$PostalCode;
		"AuxBillingCountry"=$Country;
		"AuxBillingPhone"=$Phone;
		"AuxBillingEmailAddress"=$EmailAddress;
		"AuxBillingCity"=$City;
#>
DO
{
# Whois to $OutputVariable
$OutputVariable = (.\whois -nobanner domain.com | where {$_ -ne ""} | Select -First 14)
echo $OutputVariable
# Check if WhoIs contains Registry Expiry Date
if ($OutputVariable | Select-String -Pattern 'Registry Expiry Date' -SimpleMatch -quiet)
{
	echo "matched"
}
else {
#Doesn't have it, register the domain.
#
#
#
   echo "not matched"
	$params = @{
		"ApiUser"="";
		"ApiKey"="";
		"UserName"="";
		"Command"="namecheap.domains.create";
		"ClientIp"="";
		"DomainName"="domain.com";
		"Years"="1";
		#"PromotionCode"="BACK2DOMAINZ";
		"AuxBillingFirstName"=$FirstName;
		"AuxBillingLastName"=$LastName;
		"AuxBillingAddress1"=$Address1;
		"AuxBillingStateProvince"=$StateProvince;
		"AuxBillingPostalCode"=$PostalCode;
		"AuxBillingCountry"=$Country;
		"AuxBillingPhone"=$Phone;
		"AuxBillingEmailAddress"=$EmailAddress;
		"AuxBillingCity"=$City;
		"TechFirstName"=$FirstName;
		"TechLastName"=$LastName;
		"TechAddress1"=$Address1;
		"TechStateProvince"=$StateProvince;
		"TechPostalCode"=$PostalCode;
		"TechCountry"=$Country;
		"TechPhone"=$Phone;
		"TechEmailAddress"=$EmailAddress;
		"TechCity"=$City;
		"AdminFirstName"=$FirstName;
		"AdminLastName"=$LastName;
		"AdminAddress1"=$Address1;
		"AdminStateProvince"=$StateProvince;
		"AdminPostalCode"=$PostalCode;
		"AdminCountry"=$Country;
		"AdminPhone"=$Phone;
		"AdminEmailAddress"=$EmailAddress;
		"AdminCity"=$City;
		"RegistrantFirstName"=$FirstName;
		"RegistrantLastName"=$LastName;
		"RegistrantAddress1"=$Address1;
		"RegistrantStateProvince"=$StateProvince;
		"RegistrantPostalCode"=$PostalCode;
		"RegistrantCountry"=$Country;
		"RegistrantPhone"=$Phone;
		"RegistrantEmailAddress"=$EmailAddress;
		"RegistrantCity"=$City;
		"AddFreeWhoisguard"="yes";
		"WGEnabled"="yes";
		"GenerateAdminOrderRefId"="FALSE";
	}
	$Response = Invoke-WebRequest -Uri https://api.namecheap.com/xml.response -UseBasicParsing -Method POST -Body $params
	echo $Response.Content
	$a = 0
}
	Start-Sleep -s 15
} Until ($a -le 0)
