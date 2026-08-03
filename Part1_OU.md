
# Part 1: Organizational Units (OUs)

## 📖 Business Context

Organizational Units are the building blocks of an Active Directory hierarchy. They allow administrators to group users, computers, and other objects for easier management and delegated administration.

**Why we did this:**  
Northwind wanted a clear, logical structure to:

- **Separate concerns** – distinguish between managed objects (`_MANAGED`) and default containers.
- **Group by function** – place users in `EMPLOYEES`, `CONTRACTORS`, and `ADMIN`; computers in `WORKSTATIONS` and `SERVERS`.
- **Prepare for Group Policy** – OUs enable targeted policy application (e.g., hardening only workstations, redirecting only employee folders).
- **Simplify auditing** – quickly identify which objects belong to which department or role.

## 🏗️ The Final OU Structure

lab.local
└── _MANAGED
├── _GROUPS
├── _SERVICE_ACCOUNTS
├── COMPUTERS
│ ├── SERVERS
│ └── WORKSTATIONS
└── USERS
├── ADMIN
├── CONTRACTORS
└── EMPLOYEES


This design:
- Keeps service accounts (`_SERVICE_ACCOUNTS`) isolated from regular users.
- Contains all groups in `_GROUPS` for easy discovery.
- Organises computers by type, enabling workstation‑specific policies.

## 🖥️ Implementation Steps

1. **Open Active Directory Users and Computers**  
   - Log in to the Domain Controller (`DC01`) as Administrator.  
   - Launch `dsa.msc` from the Run dialog (`Win + R`).

2. **Create the top-level OU `_MANAGED`**  
   - Right‑click the domain root (`lab.local`) → **New** → **Organizational Unit**.  
   - Name it `_MANAGED` and click **OK**.

3. **Create the four main sub‑OUs inside `_MANAGED`**  
   - Right‑click `_MANAGED` → **New** → **Organizational Unit**.  
   - Create (one by one): `_GROUPS`, `_SERVICE_ACCOUNTS`, `COMPUTERS`, `USERS`.

4. **Create nested OUs inside `USERS` and `COMPUTERS`**  
   - Inside `USERS`: `EMPLOYEES`, `CONTRACTORS`, `ADMIN`.  
   - Inside `COMPUTERS`: `WORKSTATIONS`, `SERVERS`.

5. **Verify the structure** – your left pane should match the tree shown below.


<img width="1022" height="723" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/OU_Tree.png" /> 

– The complete OU tree with `_MANAGED`, its sub‑OUs, and the groups already created inside `_GROUPS`. 

<img width="1022" height="723" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Expanded_Users.png" /> – The expanded `USERS` OU showing the `ADMIN`, `CONTRACTORS`, and `EMPLOYEES` sub‑OUs.

## ✅ Summary

The OU structure is now complete. It provides a clean separation of objects and prepares the domain for group creation, user provisioning, and policy application in the subsequent steps.
