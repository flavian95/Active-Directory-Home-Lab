
# Part 2: Security Groups

## 📖 Business Context

Security groups are the primary mechanism for granting permissions to resources (file shares, printers, applications). They also simplify administration by allowing you to assign rights to a group instead of individual users.

**Why we did this:**  
Northwind needed to:

- **Separate roles from resources** – use **Global Groups** for departmental roles (e.g., IT, HR) and **Domain Local Groups** for resource permissions (e.g., printer access, folder read/write).
- **Streamline access management** – when a new employee joins, adding them to one group gives them all necessary permissions.
- **Follow the AGDLP model** – Accounts → Global groups → Domain Local groups → Permissions, a best practice for delegation.

## 👥 Group Design

### Global Groups (Role‑based)
These groups represent the functional roles within the company.

| Group Name       | Purpose                           |
|------------------|-----------------------------------|
| `G_IT_Staff`     | IT department members             |
| `G_HR_Staff`     | Human Resources personnel         |
| `G_Finance_Staff`| Finance team                      |
| `G_Sales_Staff`  | Sales representatives             |

### Domain Local Groups (Resource‑based)
These groups are assigned permissions to specific resources.

| Group Name              | Purpose                                      |
|-------------------------|----------------------------------------------|
| `DL_Printers_All`       | Gives access to all network printers.        |
| `DL_HR_Share_RW`        | Read/Write access to the HR shared folder.   |
| `DL_Finance_Share_RO`   | Read‑Only access to the Finance shared folder.|

This split allows us to add/remove users from global groups (roles) independently of the resource permissions. If we later change the HR share permissions, we only update the domain local group, not every user.

## 🖥️ Implementation Steps

### 1. Create the Global Groups
- In **Active Directory Users and Computers**, select the `_GROUPS` OU.
- Right‑click in the right pane → **New** → **Group**.
- For each group, fill:
  - **Group name**: `G_IT_Staff` (or the others)
  - **Group scope**: `Global`
  - **Group type**: `Security`
- Repeat for `G_HR_Staff`, `G_Finance_Staff`, `G_Sales_Staff`.

### 2. Create the Domain Local Groups
- Still in `_GROUPS`, right‑click → **New** → **Group**.
- For each group, choose:
  - **Group name**: `DL_Printers_All` (and the others)
  - **Group scope**: `Domain Local`
  - **Group type**: `Security`
- Repeat for `DL_HR_Share_RW` and `DL_Finance_Share_RO`.

<img width="500" height="300" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/All_Groups.png" /> 

– The right pane of the `_GROUPS` OU showing all seven groups (`G_FINANCE`, `G_HR_STAFF`, `G_IT_STAFF`, `G_SALES`, `DL_PRINTERS`, `DL_HR_SHARE`, `DL_FINANCE`) successfully created.

## ✅ Summary

All required security groups have been created. In the next step, we will populate them by creating user accounts and assigning them to the appropriate global groups. Later, we can link these global groups to the domain local groups to grant resource access.
