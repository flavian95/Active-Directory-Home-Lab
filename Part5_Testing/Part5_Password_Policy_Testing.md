
Phase 1: Password & Lockout Policy (Default Domain Policy)
Business Need: Enforce strong passwords and protect against brute‑force attacks by locking out accounts after repeated failures.

Test Case	Action	Expected Result	Actual Result	Screenshot
1.1 – Password complexity	Press Ctrl+Alt+Del → Change password. Attempt to change to Password123 (<14 chars).	Rejected with error: "The password does not meet the password policy requirements."	✅ Pass – error shown.

<img width="1000" height="550" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/password_change.png" /> 

shows the password change failure due to insufficient length/complexity.

1.2 – Valid password	Change to Winter2026!Northwind$ (over 14 chars, complex).	Password changes successfully.	✅ Pass (no error).


1.3 – Account lockout	Log out and attempt to log in as john.smith with wrong password 5 times.	After 5th failure, error: "The referenced account is currently locked out…"	✅ Pass – lockout message appears.

<img width="1000" height="550" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/invalid_credentials.png" /> 

confirms the lockout message after too many invalid attempts.

1.4 – Lockout duration	Wait exactly 30 minutes, then log in with correct password.	Login succeeds.	✅ Pass – account unlocked.


Conclusion: Password policies and lockout settings are correctly enforced, meeting enterprise security standards.