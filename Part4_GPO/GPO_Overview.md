
# Part 4: Group Policy Objects (GPOs)

## 📖 Business Context

Group Policy is the primary tool for centrally managing Windows settings across your domain. It allows you to enforce security, deploy configurations, and improve user experience without touching each machine individually.

**Why we did this:**  
Northwind required:

- **Strong security** – enforce complex passwords, lock out intruders, and harden workstations against attacks.
- **Consistent user environment** – redirect user folders to a central file server (roaming documents) and map a shared drive for easy access to company files.
- **Compliance** – meet internal and external security standards (e.g., minimum password length, inactivity lock).

## 🛡️ The Four GPOs Implemented

| GPO Name                         | Scope / Target OU            | Purpose |
|----------------------------------|------------------------------|---------|
| **Default Domain Policy**        | Domain level                 | Password & lockout policies. |
| **Security Hardening – Workstations** | `COMPUTERS\WORKSTATIONS`    | UAC restrictions, NTLM level, inactivity timeout, and restricted local admin membership. |
| **User Experience – Folder Redirection** | `USERS\EMPLOYEES`          | Redirects the `Documents` folder to a network share (`\\DC01\Users$\%USERNAME%\Documents`). |
| **User Experience – Map Network Drive** | `USERS\EMPLOYEES`          | Maps the `S:` drive to `\\DC01\Shared`. |

---

# Verification

After creating all GPOs, the **Group Policy Objects** container should list all four policies.

<img width="700" height="400" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/GPO_List.png"/>


The complete list of GPOs: Default Domain Controller, Default Domain Policy, Security Hardening - Workstations, User Experience - Folder Redirection, and User Experience - Map Network Drive

The `EMPLOYEES` OU should show both user‑experience GPOs linked.


<img width="700" height="400" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/OU_Link_Order.png"/>


The `EMPLOYEES` OU with **Link Order 1** (Folder Redirection) and **Link Order 2** (Map Network Drive), both enabled.

## ✅ Summary

All four GPOs are now configured and linked. Northwind’s environment is now secure, with strong passwords, locked‑down workstations, and a consistent user experience. New users will automatically get redirected folders and a mapped `S:` drive, making collaboration seamless.
