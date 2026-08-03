
# Part 3: User Accounts

## 📖 Business Context

User accounts are the core of Active Directory – they represent every person who needs access to the network. Proper provisioning ensures that users have the correct permissions from day one.

**Why we did this:**  
Northwind needed to:

- **Onboard new employees efficiently** – automate the creation of accounts and group memberships.
- **Maintain consistency** – ensure all users follow the same naming convention and are placed in the correct OU.
- **Provide self‑service password reset** – by enforcing "change password at next logon" for new accounts.
- **Scale easily** – with PowerShell, we can create dozens of users in seconds.

## 👤 User Creation Methods

### Manual Creation (Example: John Smith)
This method is useful for one‑off accounts or testing.

- In `USERS\EMPLOYEES`, create a new user with:
  - First name: `John`, Last name: `Smith`
  - User logon name: `john.smith`
  - Password: `P@ssw0rd123!` (with *User must change password at next logon* enabled).

### Bulk Creation via PowerShell (Recommended)
The provided script creates multiple users from a list and automatically adds them to the correct department group. This saves time and reduces errors.

**Benefits of the script:**
- Reads a structured array of user data.
- Creates each user in the correct OU (`EMPLOYEES`).
- Sets the password and forces a change on first login.
- Adds each user to their department’s global group (e.g., `G_IT_Staff`).

## 🖥️ Implementation Steps

### Manual User (John Smith)
1. In `USERS\EMPLOYEES`, right‑click → **New** → **User**.
2. Fill the details as described.
3. Click **Next**, set the temporary password, enable *User must change password at next logon*, and finish.

### Bulk Users via PowerShell
1. Open **Windows PowerShell** as Administrator.
2. Copy and paste the script below (adjusting the domain/OU paths if needed):

```powershell
# Define the OU for new users
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