# Northwind Active Directory Infrastructure Setup

![Active Directory](https://img.shields.io/badge/Active_Directory-Organized-brightgreen)  
![Group Policy](https://img.shields.io/badge/Group_Policy-Enforced-blue)

## 📌 Project Overview

This repository documents the complete setup of an Active Directory (AD) environment for the fictional company **Northwind**. The goal was to build a centralized identity and access management system that supports:

- **Organized structure** – clear separation of users, computers, and groups.
- **Secure access control** – using security groups to grant permissions based on roles and resources.
- **Policy enforcement** – via Group Policy Objects (GPOs) to harden workstations, enforce strong passwords, and provide a consistent user experience.
- **Scalable user onboarding** – using both manual and bulk provisioning methods.

The implementation follows industry best practices and prepares the infrastructure for seamless integration with file shares, applications, and future services.

## 🏢 Business Requirements

Northwind needed a directory service that could:

1. **Simplify administration** – easily locate and manage users and computers.
2. **Enforce security standards** – meet password complexity, lockout, and workstation hardening requirements.
3. **Enable collaboration** – provide secure access to shared resources (e.g., HR documents, finance reports).
4. **Improve user experience** – automatically map network drives and redirect user folders to a central location.
5. **Support growth** – quickly onboard new employees with automated group memberships.

## 🖥️ Domain Deployment

Before building the structure, the domain itself was deployed using PowerShell.

<img width="1022" height="723" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/ad_setup.png" /> -The `Install-ADDSForest` script that created the `lab.local` forest.

This provided the foundation (Domain Controller `DC01`) on which all subsequent OUs, groups, users, and policies were built.

## 🗂️ Documentation Structure

The setup is broken into four logical parts, each documented in its own file:

## 📂 Documentation Structure

The setup is broken into logical parts, each documented in its own file or folder:

| File / Folder | Description |
|---|---|
| [`Part1_OU.md`](https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/Part1_OU.md) | Organizational Units (OUs) – how we structured the directory. |
| [`Part2_Security_Groups.md`](https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/Part2_Security_Groups.md) | Security groups – role‑based and resource‑based groups for access control. |
| [`Part3_User_Accounts.md`](https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/Part3_User_Accounts.md) | User accounts – manual creation and bulk provisioning via PowerShell. |
| [`Part4_GPO/`](https://github.com/flavian95/Active-Directory-Home-Lab/tree/main/Part4_GPO) | Group Policy Objects – password/lockout policies, hardening, folder redirection, and drive mapping. |
| [`Part5_Testing/`](https://github.com/flavian95/Active-Directory-Home-Lab/tree/main/Part5_Testing) | Validation & testing – step‑by‑step test cases covering password policies, workstation hardening, folder redirection, and drive mapping, with results and screenshots. |
| [`screenshots/`](https://github.com/flavian95/Active-Directory-Home-Lab/tree/main/screenshots) | Screenshots from the implementation phases (OUs, groups, users, GPOs). |
| [`testing-screenshots/`](https://github.com/flavian95/Active-Directory-Home-Lab/tree/main/testing-screenshots) | Screenshots from the validation testing phase. |
| [`ad-bulk-user-creation.ps1`](https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/ad-bulk-user-creation.ps1) | PowerShell script used for bulk user provisioning. |
| [`README.md`](https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/README.md) | This overview – project scope, business requirements, and outcomes. |


## 📈 Outcome

After completing these steps, Northwind now has a fully functional Active Directory environment with:

- A logical OU hierarchy that mirrors the company’s organisational units.
- Security groups that separate role-based access from resource permissions.
- User accounts (both manually created and bulk-imported) properly placed in their respective OUs and groups.
- GPOs that enforce password policies, lock out intruders, harden workstations, redirect user documents, and map a shared drive.

---

## 🧪 Testing & Validation

A robust infrastructure is only as good as its real‑world performance. After completing the setup, I thoroughly tested every critical component to ensure the environment meets Northwind’s business requirements for security, user experience, and reliability.

A **new Windows VM** was joined to the domain (`lab.local`) and used as the test workstation, with `john.smith` (and other test users) logging in to validate the applied Group Policies.

### 📋 Test Phases Overview

| Phase | Focus Area | Key Verifications |
|---|---|---|
| **1** | Password & Lockout Policy | Enforce 14‑char minimum, complexity, and lockout after 5 failed attempts (30‑min reset). |
| **2** | Workstation Hardening | Block standard users from admin tasks, auto‑lock idle screens (15 min), block insecure legacy protocols. |
| **3** | Folder Redirection | Confirm user `Documents` are stored centrally on `\\DC01\Users$\%USERNAME%\Documents`. |
| **4** | Drive Mapping | Verify the `S:` drive automatically maps to `\\DC01\Shared` upon login. |

### ✅ Test Results Summary

- **Password Policy** – Successfully rejected weak passwords (e.g., `Password123`) and enforced a 14‑character minimum. Lockout triggered after 5 invalid login attempts and reset after exactly 30 minutes.
  
- **Workstation Hardening** – Standard users (like `john.smith`) were unable to delete system folders (UAC auto‑deny). The `whoami /groups` command confirmed that `BUILTIN\Administrators` is set to **"Deny only"**, proving users have zero local admin rights. The screen locks automatically after 15 minutes of inactivity.

- **Folder Redirection** – Creating a file (`TestRedirection.txt`) in the `Documents` folder on the client made it instantly appear on the Domain Controller at `C:\UserData\john.smith\Documents`, confirming successful central storage.

- **Drive Mapping** – The `Shared Drive (S:)` appeared automatically in File Explorer under *This PC*. Files saved there (e.g., `TestMapping.txt`) were correctly written to the server’s `C:\Shared` folder.

> 📸 **All test screenshots** are available in the [`testing-screenshots/`](testing-screenshots/) folder, including the UAC elevation denial, invalid credential lockout, password change failure, mapped drive visibility, and client/server folder redirection verification.

### 🏁 Final Outcome

**All test cases passed.** The Active Directory environment is now fully operational and production‑ready:

- ✅ Strong password enforcement and account lockout protect against brute‑force attacks.
- ✅ Workstations are hardened, preventing privilege escalation and securing idle sessions.
- ✅ User documents are safely backed up on the server, enabling seamless roaming and disaster recovery.
- ✅ Automated drive mapping simplifies access to company‑wide resources.

This validation confirms that the infrastructure not only follows best practices but also delivers the business value Northwind required from day one.

---

**Need to replicate this setup?** Check out the [PowerShell script](ad-bulk-user-creation.ps1) for bulk user creation, and follow each part in order:
[`Part1_OU.md`](Part1_OU.md) ➜ [`Part2_Security_Groups.md`](Part2_Security_Groups.md) ➜ [`Part3_User_Accounts.md`](Part3_User_Accounts.md) ➜ [`Part4_GPO/`](Part4_GPO) ➜ [`Part5_Testing/`](Part5_Testing)

**Author:** [Flavian Osip]  
**Date:** [Aug 03 2026]  
