# ===============================
# Microsoft 365 Onboarding Script
# Enterprise Identity Lifecycle Lab
# ===============================

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"

# -------------------------------
# Variables
# -------------------------------
$UserUPN       = "john.adewale@daizsign01.onmicrosoft.com"
$DisplayName   = "John Adewale"
$MailNickname  = "john.adewale"
$GivenName     = "John"
$Surname       = "Adewale"
$Department    = "Finance"
$JobTitle      = "Finance Analyst"
$UsageLocation = "DE"

$GroupName     = "Finance-Team"
$GroupAlias    = "financeteam"

$PasswordProfile = @{
    Password = "TempPass123!"
    ForceChangePasswordNextSignIn = $true
}

Write-Host "========== ONBOARDING START ==========" -ForegroundColor Cyan

# -------------------------------
# Step 1: Check if user already exists
# -------------------------------
$user = Get-MgUser -UserId $UserUPN -ErrorAction SilentlyContinue

if ($user) {
    Write-Host "User already exists: $UserUPN" -ForegroundColor Yellow
} else {
    Write-Host "Creating user: $DisplayName" -ForegroundColor Green

    $user = New-MgUser `
        -DisplayName $DisplayName `
        -UserPrincipalName $UserUPN `
        -MailNickname $MailNickname `
        -GivenName $GivenName `
        -Surname $Surname `
        -Department $Department `
        -JobTitle $JobTitle `
        -AccountEnabled:$true `
        -PasswordProfile $PasswordProfile
}

# -------------------------------
# Step 2: Check if group exists
# -------------------------------
$group = Get-MgGroup -Filter "displayName eq '$GroupName'" -ErrorAction SilentlyContinue

if ($group) {
    Write-Host "Group already exists: $GroupName" -ForegroundColor Yellow
} else {
    Write-Host "Creating group: $GroupName" -ForegroundColor Green

    $group = New-MgGroup `
        -DisplayName $GroupName `
        -MailEnabled:$false `
        -SecurityEnabled:$true `
        -MailNickname $GroupAlias
}

# -------------------------------
# Step 3: Add user to group
# -------------------------------
Write-Host "Adding user to group..." -ForegroundColor Green
try {
    New-MgGroupMember `
        -GroupId $group.Id `
        -DirectoryObjectId $user.Id `
        -ErrorAction Stop
    Write-Host "User added to group successfully." -ForegroundColor Green
}
catch {
    Write-Host "User may already be a member of the group, or another issue occurred." -ForegroundColor Yellow
}

# -------------------------------
# Step 4: Set usage location
# -------------------------------
Write-Host "Setting usage location to $UsageLocation ..." -ForegroundColor Green
Update-MgUser -UserId $UserUPN -BodyParameter @{usageLocation = $UsageLocation}

# -------------------------------
# Step 5: Get license SKU
# -------------------------------
$sku = Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -like "*BUSINESS*" }

if (-not $sku) {
    Write-Host "No matching license SKU found." -ForegroundColor Red
    exit
}

Write-Host "Assigning license: $($sku.SkuPartNumber)" -ForegroundColor Green

# -------------------------------
# Step 6: Assign license
# -------------------------------
Set-MgUserLicense `
    -UserId $UserUPN `
    -AddLicenses @{SkuId = $sku.SkuId} `
    -RemoveLicenses @()

# -------------------------------
# Step 7: Verification
# -------------------------------
Write-Host "`nVerification Results" -ForegroundColor Cyan
Write-Host "---------------------" -ForegroundColor Cyan

Get-MgUser `
    -UserId $UserUPN `
    -Property "DisplayName,UserPrincipalName,UsageLocation,AssignedLicenses,AccountEnabled,Department,JobTitle" |
    Format-List DisplayName,UserPrincipalName,Department,JobTitle,UsageLocation,AccountEnabled,AssignedLicenses

Write-Host "`nGroup Membership:" -ForegroundColor Cyan
Get-MgGroupMember -GroupId $group.Id | ForEach-Object {
    Get-MgUser -UserId $_.Id | Select-Object DisplayName, UserPrincipalName
}

Write-Host "`nOnboarding process completed for $DisplayName." -ForegroundColor Green