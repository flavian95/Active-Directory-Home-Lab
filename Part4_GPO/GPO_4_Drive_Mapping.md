
### 4. Drive Mapping (Custom GPO)
- Create a new GPO named `User Experience – Map Network Drive`.
- Edit and navigate to `User Configuration → Policies → Windows Settings → Drive Maps`.
- Create a new mapped drive with:
  - Action: `Replace`
  - Location: `\\DC01\Shared`
  - Reconnect: `Yes`
  - Label: `Shared Drive`
  - Drive Letter: `S:`

<img width="800" height="450" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Driver_Properties.png"/>

> howing the full Drive Map configuration with the `Replace` action, `S:` drive letter, and `\\DC01\Shared` location.

- Link this GPO to the `EMPLOYEES` OU.
