
### 2. Workstation Hardening (Custom GPO)
- Create a new GPO named `Security Hardening – Workstations` inside **Group Policy Objects**.
- Edit it and navigate to `Computer Configuration → Policies → Windows Settings → Security Settings → Local Policies → Security Options`.

Configure these specific settings:

- **User Account Control: Admin Approval Mode for the built‑in Administrator account** → `Enabled`

- **User Account Control: Behavior of the elevation prompt for standard users** → `Automatically deny elevation requests`

> 📸 **Screenshot:** `screenshots/UAC_Settings.png` – The two UAC settings configured as shown above.

- **Network security: LAN Manager authentication level** → `Send NTLMv2 response only. Refuse LM & NTLM`

> 📸 **Screenshot:** `screenshots/LAN_Manager_Auth.png` – LAN Manager authentication level set to the most secure option.

- **Microsoft network client: Digitally sign communications (always)** → `Enabled`

> 📸 **Screenshot:** `screenshots/Digital_Signin_Enforced.png` – Digital signing enforced for network communications.

- **Interactive logon: Machine inactivity limit** → `900` seconds (15 minutes)

> 📸 **Screenshot:** `screenshots/Machine_Inactivity_Limit.png` – Machine inactivity limit set to 900 seconds.

- Under **Restricted Groups**, add the `Administrators` group and ensure `Domain Admins` is its only member (this removes other local admins).

> 📸 **Screenshot:** `screenshots/Restricted_Groups.png` – Navigating to **Restricted Groups** within the Security Settings tree.

- Link this GPO to the `WORKSTATIONS` OU.

> 📸 **Screenshot:** `screenshots/Security_Hardening_Workstations.png` – The `Security Hardening - Workstations` GPO linked to the `WORKSTATIONS` OU with Link Order 1.
