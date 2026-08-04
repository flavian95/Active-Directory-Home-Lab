
Phase 4: Drive Mapping (User Experience – Map Network Drive)
Business Need: Provide all employees with a shared network drive (S:) for collaboration and access to common resources.

Test Case	Action	Expected Result	Actual Result	Screenshot

4.1 – Drive appears	Log in as john.smith, open File Explorer, look under "This PC".	"Shared Drive (S:)" appears.	✅ Pass – drive is visible.	


<img width="1000" height="550" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/shared.png" /> 


the mapped drive appears as Shared Drive (S:) under This PC, confirming successful GPO application.


4.2 – Write a file	Open S: drive, create a new text file TestMapping.txt.	File saves successfully.	✅ Pass – file created.	(Not screenshot separately; implied by shared.png)

4.3 – Verify on server	On DC01, check C:\Shared folder (shared location).	TestMapping.txt is present.	✅ Pass – file exists.


Conclusion: Group Policy Preferences successfully map the S: drive, giving users instant access to shared company files.