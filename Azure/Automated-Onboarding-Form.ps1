param (
    [string]$FirstInitial,  # for MailNickname
    [string]$FirstName,     # for DisplayName
    [string]$LastName,
    [string]$Domain,
    [string]$JobTitle,
    [string]$Department
)

# Connect using managed identity
Connect-AzAccount -Identity

# Build username and UPN
$MailNickname = ($FirstInitial + $LastName).ToLower()
$UserPrincipalName = "$MailNickname@$Domain"

# Create SecureString password
$SecurePassword = ConvertTo-SecureString -String "PlaceHolder" -AsPlainText -Force

# Set up user parameters
$newUserParams = @{
    DisplayName       = "$FirstName $LastName"
    Department = $Department
    MailNickname      = $MailNickname
    UserPrincipalName = $UserPrincipalName
    JobTitle = $JobTitle
    Password          = $SecurePassword
    AccountEnabled    = $true
}

# Create the user
New-AzADUser @newUserParams
