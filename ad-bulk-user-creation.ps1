$OU = "OU=EMPLOYEES,OU=USERS,OU=_MANAGED,DC=lab,DC=local"

# List of users (FirstName, LastName, Department)
$users = @(
    @{FirstName="Sarah"; LastName="Chen"; Department="IT"},
    @{FirstName="David"; LastName="Park"; Department="Finance"},
    @{FirstName="Emily"; LastName="Rodriguez"; Department="HR"},
    @{FirstName="Michael"; LastName="Williams"; Department="Sales"}
)

# Loop through and create each user
foreach ($user in $users) {
    $firstName = $user.FirstName
    $lastName = $user.LastName
    $dept = $user.Department
    $samAccountName = "$($firstName.ToLower()).$($lastName.ToLower())"
    $displayName = "$firstName $lastName"
    $password = "P@ssw0rd123!"

    New-ADUser -Name "$displayName" `
               -GivenName $firstName `
               -Surname $lastName `
               -SamAccountName $samAccountName `
               -UserPrincipalName "$samAccountName@lab.local" `
               -DisplayName $displayName `
               -Department $dept `
               -Path $OU `
               -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
               -Enabled $true `
               -ChangePasswordAtLogon $true

    switch ($dept) {
        "IT" { Add-ADGroupMember -Identity "G_IT_Staff" -Members $samAccountName }
        "HR" { Add-ADGroupMember -Identity "G_HR_Staff" -Members $samAccountName }
        "Finance" { Add-ADGroupMember -Identity "G_Finance_Staff" -Members $samAccountName }
        "Sales" { Add-ADGroupMember -Identity "G_Sales_Staff" -Members $samAccountName }
    }
    Write-Host "Successfully created: $displayName"
}
