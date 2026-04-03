# 🚀 Group Policy Drive Mapping – Automated Network Drive Deployment

In this lab, I set up automated network drive mapping using Group Policy in a Windows Server environment.

The goal was to simulate how IT administrators provide users with access to shared folders without manually configuring each workstation.

This is a common setup in enterprise environments where access needs to be consistent, controlled, and scalable.

---

## 📌 Lab Objective

The objective of this lab was to configure a Group Policy that automatically maps a shared network drive for specific users based on their security group membership.

This approach helps avoid manual setup on each device and ensures users get the correct access when they log in.

---

## 🧠 Real-World Scenario

I simulated a scenario where users in the HR department need access to a shared folder.

Instead of mapping the drive manually on each computer, I used Group Policy to automate the process so that users get the drive automatically when they log in.

---

## Ticket Context (Simulated Support Case)

For this lab, I approached it like a real support request.

A user from the HR department needed access to a shared folder, but instead of setting it up manually on each system, the goal was to provide a solution that works automatically for all users in that group.

## Ticket Summary
Issue: HR users do not have access to shared drive
Service: Active Directory / Group Policy
Impact: Users unable to access shared departmental files
Priority: Medium
Status: Resolved

---

## Approach

To handle this, I focused on creating a scalable solution instead of a one-time fix.

I set up a Group Policy to automatically map the shared drive and used a security group to control who gets access.

This way, any user added to the group would receive the drive automatically without manual configuration.

---

## 🖥️ Lab Environment

| System   | Role              | IP Address    |
|----------|-------------------|---------------|
| DC01     | Domain Controller | 192.168.10.10 |
| CLIENT01 | Windows Client    | DHCP          |
| Domain   | Active Directory  | bpurple.com   |

---

## ⚙️ Technologies Used

- Active Directory Domain Services (AD DS)
- Group Policy Management (GPMC)
- Windows Server 2016
- NTFS & Share Permissions

---

## 🔧 Configuration Steps

### 1. Create Shared Folder

I created a shared folder on the domain controller to represent a departmental resource.

Path:
C:\HR  

Network path:
\\dc01\HR  

![Shared Folder](./screenshots/hr-share-folder.png)

---

### 2. Create Security Group

To control access, I created a security group in Active Directory called HR-Drive-Access.

I added users to this group so that access could be managed centrally instead of assigning permissions individually.

![Security Group](./screenshots/hr-security-group.png)

---

### 3. Create Group Policy Object (GPO)

I then created a new Group Policy Object (GPO) called "Map HR Drive" to handle the drive mapping automatically.

![GPO Created](./screenshots/gpo-created.png)

---

### 4. Drive Mapping Configure

Inside the GPO, I configured the drive mapping using the following settings:

- Action: Create  
- Location: \\dc01\HR  
- Label: HR Drive  
- Drive Letter: H:  

This ensures that the drive is automatically created when the user logs in.

![Drive Mapping](./screenshots/gpo-drive-mapping.png)

---

### 5. Configure Item-Level Targeting

To make sure only the correct users receive the drive, I configured item-level targeting.

I set the condition so that only users in the HR-Drive-Access group would receive the mapped drive.

This prevents the drive from appearing for users who shouldn’t have access.

![Item Level Targeting](./screenshots/item-level-targeting.png)

---

### 6. Link GPO to Domain

I linked the GPO to:

bpurple.com  

![GPO Linked](./screenshots/gpo-linked.png)

---

### 7. Testing & Validation Section

To test the configuration, I logged into the client machine and forced a Group Policy update:

gpupdate /force  

After logging off and back in, I checked "This PC" to confirm whether the drive was mapped.

---

## ✅ Result

The HR drive (H:) was automatically mapped for the user.The HR drive (H:) appeared automatically on the client machine after login.

This confirmed that the Group Policy and security group targeting were working as expected.

![Mapped Drive](./screenshots/hr-drive-mapped.png)

---

## 🔍 Troubleshooting Section

To troubleshoot the issue, I checked a few key things:

- I verified that the user was added to the HR-Drive-Access group  
- I forced a Group Policy update using gpupdate /force  
- I logged off and back on to allow the policy to apply  

After these steps, the drive appeared correctly.

This reminded me that Group Policy changes often require a logoff/logon cycle before they take effect.

### Resolution

To resolve the issue, I checked the most likely causes step by step.

First, I confirmed that the user was part of the **HR-Drive-Access** security group, since access to the drive is controlled through group membership.

Next, I forced a Group Policy update using:

gpupdate /force  

After that, I logged off and back on to allow the policy to apply properly.

### Outcome

After logging back in, the HR drive (H:) appeared automatically on the client machine.

This confirmed that the GPO and security group targeting were working as expected.

This also reminded me that Group Policy changes often require a logoff/logon cycle before they fully take effect.

---

## 📊 Business Impact

In a real environment, setting this up manually on each computer would take time and could lead to errors.

Using Group Policy makes the process automatic, consistent, and easier to manage, especially as the number of users grows. 

---

## 🔐 Security Considerations

Access to the shared folder is controlled using security groups instead of assigning permissions directly to users.

This makes it easier to manage access and reduces the risk of giving the wrong permissions. 

---

## 🧠 Skills Demonstrated

- Configured Group Policy to automate drive mapping across domain users  
- Used Active Directory security groups to control access to shared resources  
- Implemented network drive mapping using GPO preferences  
- Applied item-level targeting to restrict access based on group membership  
- Troubleshot Group Policy issues using gpupdate and login cycle testing  
- Worked with Windows Server tools to manage users, groups, and policies  

---

## 💡 Key Takeaway

This lab showed me how powerful Group Policy can be for automating user access.

Instead of configuring each system manually, using GPO with security groups makes access easier to manage, more consistent, and less prone to errors.

---

## ✅ Conclusion

Overall, this lab helped me understand how drive mapping is handled in real enterprise environments.

It reinforced how Group Policy and security groups work together to automate access and reduce manual work for IT teams.