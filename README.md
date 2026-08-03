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

<img width="1022" height="723" alt="8" src="https://github.com/user-attachments/assets/8fe1bb0f-030f-4d22-8e17-f351377dee57" /> -The `Install-ADDSForest` script that created the `lab.local` forest.

This provided the foundation (Domain Controller `DC01`) on which all subsequent OUs, groups, users, and policies were built.

## 🗂️ Documentation Structure

The setup is broken into four logical parts, each documented in its own file:

| File | Description |
|------|-------------|
| [`part1-ous.md`](part1-ous.md) | Organizational Units (OUs) – how we structured the directory. |
| [`part2-groups.md`](part2-groups.md) | Security groups – role‑based and resource‑based groups for access control. |
| [`part3-users.md`](part3-users.md) | User accounts – manual creation and bulk provisioning via PowerShell. |
| [`part4-gpos.md`](part4-gpos.md) | Group Policy Objects – password/lockout policies, hardening, folder redirection, and drive mapping. |


## 📈 Outcome

After completing these steps, Northwind now has a fully functional Active Directory environment with:

- A logical OU hierarchy that mirrors the company’s organisational units.
- Security groups that separate role-based access from resource permissions.
- User accounts (both manually created and bulk-imported) properly placed in their respective OUs and groups.
- GPOs that enforce password policies, lock out intruders, harden workstations, redirect user documents, and map a shared drive.

---

**Author:** [Flavian Osip]  
**Date:** [03/03/2026]  
