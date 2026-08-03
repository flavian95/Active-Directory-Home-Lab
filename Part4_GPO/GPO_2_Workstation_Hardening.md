
### 2. Workstation Hardening (Custom GPO)
- Create a new GPO named `Security Hardening – Workstations` inside **Group Policy Objects**.
- Edit it and navigate to `Computer Configuration → Policies → Windows Settings → Security Settings → Local Policies → Security Options`.

Configure these specific settings:

- **User Account Control: Admin Approval Mode for the built‑in Administrator account** → `Enabled`

- **User Account Control: Behavior of the elevation prompt for standard users** → `Automatically deny elevation requests`

<img width="150" height="250" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/UAC_Settings.png/> 

– The two UAC settings configured as shown above.

- **Network security: LAN Manager authentication level** → `Send NTLMv2 response only. Refuse LM & NTLM`

<img width="150" height="250" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/LAN_Manager_Auth.png"/>

– LAN Manager authentication level set to the most secure option.

- **Microsoft network client: Digitally sign communications (always)** → `Enabled`

<img width="150" height="250" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Digital_Signin_Enforced.png"/>

> – Digital signing enforced for network communications.

- **Interactive logon: Machine inactivity limit** → `900` seconds (15 minutes)

<img width="150" height="250" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Machine_Inactivity-Limit.png"/>

– Machine inactivity limit set to 900 seconds.

- Under **Restricted Groups**, add the `Administrators` group and ensure `Domain Admins` is its only member (this removes other local admins).

<img width="150" height="250" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Restricted_Groups.png"/>

– Navigating to **Restricted Groups** within the Security Settings tree.

- Link this GPO to the `WORKSTATIONS` OU.
- 

<img width="150" height="250" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Security_Hardening_Workstations.png"/>


The `Security Hardening - Workstations` GPO linked to the `WORKSTATIONS` OU with Link Order 1.
