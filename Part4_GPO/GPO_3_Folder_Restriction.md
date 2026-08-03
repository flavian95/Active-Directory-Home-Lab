
### 3. Folder Redirection (Custom GPO)
- Create a new GPO named `User Experience – Folder Redirection`.
- Edit and go to `User Configuration → Policies → Windows Settings → Folder Redirection → Documents`.
- Set target to: `Basic – Redirect everyone's folder to the same location`.
- Root path: `\\DC01\Users$\%USERNAME%\Documents`.

<img width="1000" height="500" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/Document_Properties_Users.png"/>


> The **Documents Properties** window with the root path `\\DC01\Users$` and the preview showing the user’s folder.

- Link this GPO to the `EMPLOYEES` OU.

<img width="1000" height="500" alt="8" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/screenshots/UX_Linked.png"/>

The `User Experience - Folder Redirection` GPO linked to the `EMPLOYEES` OU.
