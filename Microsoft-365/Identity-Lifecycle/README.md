# Microsoft 365 Identity Lifecycle Automation Lab (Enterprise Simulation)

## 🚀 Project Summary

Simulated a real-world Microsoft 365 onboarding and offboarding workflow using Microsoft Graph PowerShell.

This project demonstrates hands-on experience in:
- User provisioning and deprovisioning
- License assignment and management
- Group-based access control (RBAC)
- Troubleshooting and validation of identity lifecycle operations

---

## 📌 Overview

In enterprise environments, IT teams are responsible for managing the full lifecycle of user identities — from onboarding new employees to securely offboarding them when they leave.

This project simulates that lifecycle using Microsoft 365, focusing on how user access is provisioned, validated, and revoked in a controlled environment.

---

## 🏢 Scenario

A new employee joins the Finance department at **Daizsign Ltd**.

**User Details:**

* Name: John Adewale
* Role: Finance Analyst
* Department: Finance

The IT team provisions access, assigns licenses, and manages the full lifecycle of the user.

Later, the employee leaves the organization, and all access is revoked securely.

---

## 🎫 Simulated Helpdesk Ticket

**Title:** New User Onboarding – Finance Department  
**Priority:** P3  
**Requestor:** HR Team  

**Description:**  
A new employee (John Adewale) has joined the Finance department.  
Provision a Microsoft 365 account, assign appropriate license, and grant access to Finance resources.

**Expected Outcome:**
- User can log in
- User has email access
- User is part of Finance-Team group

---

## 🎯 Objectives

* Automate user onboarding in Microsoft 365
* Implement role-based access control (RBAC)
* Assign and manage Microsoft 365 licenses
* Simulate full identity lifecycle (Joiner / Leaver process)
* Validate actions using PowerShell and Admin Center

---

## ⚙️ Tools & Technologies

* Microsoft 365 Admin Center
* Microsoft Graph PowerShell
* PowerShell (macOS)
* Azure Active Directory (Entra ID concepts)

---

# 🚀 Onboarding Workflow (Joiner Process)

---

## 1️⃣ User Creation

A new enterprise user account is created with required attributes.

📸 **Screenshot: User Created in Admin Portal**

![User Created](./screenshots/user-created.png)

---

## 2️⃣ Group Creation (Finance-Team)

A security group is created to represent department-based access.

📸 **Screenshot: Group Created**

![Group Created](./screenshots/group-created.png)

---

## 3️⃣ Add User to Group (RBAC)

The user is added to the Finance-Team group to simulate role-based access control.

📸 **Screenshot: User Added to Group**

![User Added to Group](./screenshots/user-added-to-group.png)

---

## 4️⃣ Usage Location Configuration

The usage location is set to enable license assignment.

📸 **Screenshot: Usage Location Set**

![Usage Location](./screenshots/usage-location.png)

---

## 5️⃣ License Assignment

A Microsoft 365 Business license is assigned to the user.

📸 **Screenshot: License Assigned (Admin Portal)**

![License Assigned](./screenshots/license-assigned.png)

📸 **Screenshot: License Verification via PowerShell**

![License PowerShell](./screenshots/license-powershell.png)

---

## 6️⃣ Verification

All onboarding steps are validated using PowerShell queries.

📸 **Screenshot: Verification Output**

![Verification](./screenshots/onboarding-verification.png)

---

# 🔴 Offboarding Workflow (Leaver Process)

---

## 1️⃣ License Removal

All assigned licenses are removed from the user.

📸 **Screenshot: License Removed**

![License Removed](./screenshots/license-removed.png)

---

## 2️⃣ Remove User from Group

The user is removed from the Finance-Team group.

📸 **Screenshot: Group Membership Removed**

![Group Removed](./screenshots/group-removed.png)

---

## 3️⃣ Disable Account

The user account is disabled to revoke access.

📸 **Screenshot: Account Disabled**

![Account Disabled](./screenshots/account-disabled.png)

---

## 4️⃣ Final Verification

All access removal actions are confirmed.

📸 **Screenshot: Offboarding Verification**

![Offboarding Verification](./screenshots/offboarding-verification.png)

---

## ⚠️ Challenges Encountered

During the lab, several real-world issues were observed:

- License assignment delay due to provisioning latency
- Missing output in script logs due to variable inconsistency
- Need for explicit property retrieval in Microsoft Graph queries

These issues were investigated and resolved through validation and troubleshooting.

---

## 🛠️ Troubleshooting Approach

To resolve issues encountered during provisioning:

- Verified user properties using `Get-MgUser`
- Confirmed license assignment using `AssignedLicenses` property
- Validated group membership using `Get-MgGroupMember`
- Checked variable output to ensure accurate script logging

This ensured all actions were successfully completed and verifiable.

---

## ✅ Validation Checklist

- [x] User account created successfully
- [x] Usage location configured
- [x] License assigned and verified
- [x] User added to Finance-Team group
- [x] Account status confirmed
- [x] Offboarding actions validated (license removed, account disabled)

---

# 📂 Project Structure

```text
identity-lifecycle/
├── onboarding.ps1
├── offboarding.ps1
├── README.md
└── screenshots/
```

---

# 🔍 Key Learnings

* Microsoft Graph requires explicit property queries for accurate output
* Usage location must be configured before license assignment
* RBAC simplifies permission management in enterprise environments
* PowerShell automation ensures consistency and efficiency
* Identity lifecycle management is a core IT function

---

# 💡 Real-World Relevance

This project reflects real IT administrative responsibilities such as:

* User provisioning and deprovisioning
* License management
* Group-based access control
* Identity lifecycle automation

Applicable roles:

* IT Support (L1/L2)
* IT Administrator
* Cloud Support Engineer
* Identity & Access Management (IAM)

---

# 📈 Future Improvements

* Parameterize scripts for dynamic input
* Add logging and audit tracking
* Extend to Teams and Exchange provisioning
* Convert scripts into reusable modules

---

## 🧠 Conclusion

This lab simulates a real IT onboarding and offboarding task performed in enterprise environments.

Beyond executing commands, the focus was on validating results, troubleshooting issues, and ensuring that access was correctly provisioned and revoked.

This reflects the day-to-day responsibilities of an IT Support or Junior System Administrator.