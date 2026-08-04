
Phase 3: Folder Redirection (User Experience – Folder Redirection)
Business Need: User documents should be stored centrally on the server for backup, roaming, and disaster recovery.

Test Case	Action	Expected Result	Actual Result	Screenshot
3.1 – Verify redirection target	Right‑click Documents folder → Properties → Location tab.	Path shows \\DC01\Users$\john.smith\Documents.	✅ Pass – path is correct.

3.2 – Save a test file	Open Documents, create new text file TestRedirection.txt.	File saves without access errors.	✅ Pass – file created.


<img width="800" height="450" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/test-redirection-host.png" /> 

the local client view showing TestRedirection.txt in the redirected Documents folder.

3.3 – Verify on server	On DC01, navigate to C:\UserData\john.smith\Documents.	TestRedirection.txt appears.	✅ Pass – file exists on server.


<img width="1000" height="550" src="https://github.com/flavian95/Active-Directory-Home-Lab/blob/main/testing-screenshots/test-redirection_server.png"> 

the server-side location confirming the file is stored centrally.
