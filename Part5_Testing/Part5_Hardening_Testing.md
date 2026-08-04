
Phase 2: Workstation Hardening (Security Hardening – Workstations)
Business Need: Prevent standard users from gaining administrative privileges, automatically lock idle sessions, and block insecure legacy protocols.

Test Case	Action	Expected Result	Actual Result	Screenshot

2.1 – UAC elevation denial	As john.smith, try to delete the C:\Windows folder.	UAC prompt appears with no user accounts listed (auto‑deny).	✅ Pass – access denied.	

<img width="1000" height="550" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/file_access.png" /> 

(shows "You'll need to provide administrator permission").

2.2 – Inactivity lock	Leave workstation idle for 15 minutes (900 sec).	Screen locks automatically, requiring password.	✅ Pass – lock occurred.

2.3 – Local admin restriction	Open Command Prompt and run whoami /groups. Look for BUILTIN\Administrators.	Attributes show "Deny only" – user is not a local admin.	✅ Pass – see output below.

<img width="1000" height="550" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/whoami_groups.png" /> 

2.4 – Legacy protocol blocking	Run net config workstation and check Requested Protocols.	Should not show LAN Manager or NTLM; only NTLMv2 or SMB.	✅ Pass – no insecure protocols listed.


Conclusion: Workstation hardening is effective: standard users have no admin rights, idle sessions lock, and legacy authentication is disabled.