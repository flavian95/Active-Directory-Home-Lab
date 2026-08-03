
### 4. Drive Mapping (Custom GPO)
- Create a new GPO named `User Experience – Map Network Drive`.
- Edit and navigate to `User Configuration → Policies → Windows Settings → Drive Maps`.
- Create a new mapped drive with:
  - Action: `Replace`
  - Location: `\\DC01\Shared`
  - Reconnect: `Yes`
  - Label: `Shared Drive`
  - Drive Letter: `S:`

> 📸 **Screenshot:** `screenshots/Drive_Properties.png` – * showing the full Drive Map configuration with the `Replace` action, `S:` drive letter, and `\\DC01\Shared` location.

- Link this GPO to the `EMPLOYEES` OU.
