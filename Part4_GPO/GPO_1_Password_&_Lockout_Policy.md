## 🖥️ Implementation Steps

### 1. Password & Lockout Policy (Default Domain Policy)
- Open **Group Policy Management** (`gpmc.msc`).
- Edit the `Default Domain Policy`.
- Navigate to `Computer Configuration → Policies → Windows Settings → Security Settings → Account Policies`.
- Under **Password Policy**, set the required values.

<img width="1022" height="723" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Password_Policy.png" /> 

- Navigating to the **Password Policy** section inside the Group Policy Management Editor.

- Under **Account Lockout Policy**, set:
  - Account lockout duration: `30` minutes
  - Account lockout threshold: `5` attempts
  - Reset account lockout counter after: `30` minutes

<img width="1022" height="723" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Account_Lockout_Policy.png" /> 


- The configured **Account Lockout Policy** settings (30 minutes, 5 attempts, 30 minutes).
