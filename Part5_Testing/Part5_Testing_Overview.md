Part 5: Validation & Testing
📖 Business Context
After configuring the Active Directory infrastructure, security policies, and user experience settings, it is critical to verify that everything works as intended. Testing ensures:

Security controls are effective – passwords meet complexity, lockouts work, and workstations are hardened.

User experience is seamless – documents roam correctly and network drives appear automatically.

Administrative confidence – the environment behaves as designed before going into production.

This section documents the validation test plan, executed against a test workstation (a new VM joined to the lab.local domain). Each test case is mapped to a business requirement and includes screenshots and results.

🖥️ Test Environment
Domain Controller: DC01.lab.local

Test Workstation: New Windows VM joined to the domain

Test User: john.smith (created manually in Part 3)

Additional Users: david.park, emily.rodriguez, etc. (bulk‑created)

The workstation received the GPOs linked to the WORKSTATIONS and EMPLOYEES OUs, as configured in Part 4.


📈 Overall Test Summary
All four testing phases passed without issues. The Active Directory environment is production‑ready:

✅ Password policies enforce 14‑character minimum and complexity.

✅ Account lockout triggers after 5 failures and resets after 30 minutes.

✅ Workstations are hardened – standard users are not local admins, idle screens lock, and insecure protocols are blocked.

✅ User documents are redirected to the server, ensuring central storage.

✅ A shared drive (S:) is automatically mapped, simplifying collaboration.

These tests confirm that the business requirements defined at the start of the project have been fully met.