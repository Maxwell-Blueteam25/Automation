Import-Module ImportExcel
Import-Module Az.Accounts
Import-Module Az.Resources

# Prompt for Excel path
$path = Read-Host "Please enter the path to the Excel spreadsheet"
$sheet = "Sheet1"

# Connect to Azure (interactive if needed)
Connect-AzAccount

# Import the Excel data
$data = Import-Excel -Path $path -WorksheetName $sheet

foreach ($user in $data) {
    # Basic validation and fallback
    if (-not $user.EmployeeName) {
        Write-Warning "Skipping row: EmployeeName is missing."
        continue
    }

    # Generate MailNickname from FirstInitial + LastName or fallback to sanitized EmployeeName
    $firstInitial = $user.FirstInitial
    $lastName = $user.LastName
    if ([string]::IsNullOrWhiteSpace($firstInitial) -or [string]::IsNullOrWhiteSpace($lastName)) {
        # fallback: remove spaces and lowercase employee name
        $mailNickname = ($user.EmployeeName -replace '\s','').ToLower()
        Write-Warning "MailNickname generated from EmployeeName: $mailNickname"
    } else {
        $mailNickname = ($firstInitial + $lastName).ToLower()
    }

    # Validate domain
    if (-not $user.Domain) {
        Write-Warning "Skipping user $($user.EmployeeName): Domain is missing."
        continue
    }

    $upn = "$mailNickname@$($user.Domain)"

    # Validate/parse EmployeeStartDate or default to today
    try {
        $employeeStartDate = [datetime]$user.EmployeeStartDate
    } catch {
        Write-Warning "Invalid or missing EmployeeStartDate for $($user.EmployeeName). Using today's date."
        $employeeStartDate = Get-Date
    }

    # Create PasswordProfile object
    $passwordProfile = [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Models.ApiV10.MicrosoftGraphPasswordProfile]::new()
    $passwordProfile.Password = "TempPass123!"
    $passwordProfile.ForceChangePasswordNextSignIn = $true

    $newUserParams = @{
        DisplayName       = $user.EmployeeName
        MailNickname      = $mailNickname
        UserPrincipalName = $upn
        Department        = $user.Department
        JobTitle          = $user.JobTitle
        AccountEnabled    = $true
        EmployeeHireDate  = $employeeStartDate
        PasswordProfile   = $passwordProfile
    }

    Write-Host "Creating user: $($user.EmployeeName) with UPN $upn"
    try {
        New-AzADUser @newUserParams
        Write-Host "✅ Created user $($user.EmployeeName)" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to create user $($user.EmployeeName): $($_.Exception.Message)" -ForegroundColor Red
    }
}
