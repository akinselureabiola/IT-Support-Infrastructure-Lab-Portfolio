# ===============================
# Microsoft 365 Offboarding Script
# Enterprise Identity Lifecycle Lab
# ===============================

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All","Directory.ReadWrite.All"

# -------------------------------
# Variables
# -------------------------------
$UserUPN    = "john.adewale@daizsign01.onmicrosoft.com"
$DisplayName = "John Adewale"
$GroupName  = "Finance-Team"

Write-Host "Starting offboarding process for $DisplayName ..." -ForegroundColor Cyan

# -------------------------------
# Step 1: Get user
# -------------------------------
$user = Get-MgUser -UserId $UserUPN -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "User not found: $UserUPN" -ForegroundColor Red
    exit
}

# -------------------------------
# Step 2: Get group
# -------------------------------
$group = Get-MgGroup -Filter "displayName eq '$GroupName'" -ErrorAction SilentlyContinue

if (-not $group) {
    Write-Host "Group not found: $GroupName" -ForegroundColor Yellow
} else {
    Write-Host "Found group: $GroupName" -ForegroundColor Green
}

# -------------------------------
# Step 3: Remove license(s)
# -------------------------------
Write-Host "Checking assigned licenses..." -ForegroundColor Green

$assignedLicenses = (Get-MgUser -UserId $UserUPN -Property "AssignedLicenses").AssignedLicenses

if ($assignedLicenses.Count -gt 0) {
    $licenseIds = $assignedLicenses | ForEach-Object { $_.SkuId }

    Write-Host "Removing assigned license(s)..." -ForegroundColor Green
    Set-MgUserLicense `
        -UserId $UserUPN `
        -AddLicenses @() `
        -RemoveLicenses $licenseIds
}
else {
    Write-Host "No licenses assigned to user." -ForegroundColor Yellow
}

# -------------------------------
# Step 4: Remove from group
# -------------------------------
if ($group) {
    Write-Host "Removing user from group..." -ForegroundColor Green
    try {
        Remove-MgGroupMemberByRef `
            -GroupId $group.Id `
            -DirectoryObjectId $user.Id `
            -ErrorAction Stop

        Write-Host "User removed from group successfully." -ForegroundColor Green
    }
    catch {
        Write-Host "User may not be a member of the group, or another issue occurred." -ForegroundColor Yellow
    }
}

# -------------------------------
# Step 5: Disable account
# -------------------------------
Write-Host "Disabling user account..." -ForegroundColor Green
Update-MgUser `
    -UserId $UserUPN `
    -AccountEnabled:$false

# -------------------------------
# Step 6: Verification
# -------------------------------
Write-Host "`nVerification Results" -ForegroundColor Cyan
Write-Host "---------------------" -ForegroundColor Cyan

Get-MgUser `
    -UserId $UserUPN `
    -Property "DisplayName,UserPrincipalName,AccountEnabled,AssignedLicenses" |
    Format-List DisplayName,UserPrincipalName,AccountEnabled,AssignedLicenses

if ($group) {
    Write-Host "`nRemaining Group Members:" -ForegroundColor Cyan
    Get-MgGroupMember -GroupId $group.Id
}

Write-Host "`nOffboarding process completed for $DisplayName." -ForegroundColor Green