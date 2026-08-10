# Microsoft 365 Identity Lifecycle Automation Lab (Enterprise Simulation)

##  Project Summary

In this lab, I simulated a real-world Microsoft 365 onboarding and offboarding process using Microsoft Graph PowerShell.

The goal was to automate how users are created, assigned access, and later removed from the system, just like in a real IT support environment.

This project demonstrates hands-on experience in:

- Creating and managing user accounts  
- Assigning and removing Microsoft 365 licenses  
- Using security groups for access control  
- Validating and troubleshooting identity lifecycle operations  

---

## Overview

In most organizations, IT teams manage the full lifecycle of user accounts — from onboarding new employees to securely removing access when they leave.

In this lab, I focused on how that process works in Microsoft 365, using PowerShell to automate and validate each step.

The goal was not just to run commands, but to understand how access is granted, verified, and revoked in a real environment.

---

## Scenario

In this scenario, I simulated onboarding a new employee into the Finance department and later offboarding them securely.

**User Details:**

* Name: John Adewale
* Role: Finance Analyst
* Department: Finance

The IT team provisions access, assigns licenses, and manages the full lifecycle of the user.

Later, the employee leaves the organization, and all access is revoked securely.

---

## Simulated Helpdesk Ticket

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

## Objectives

In this lab, my goal was to automate and validate the full user lifecycle in Microsoft 365.

Specifically, I aimed to:

- Create and manage user accounts using Microsoft Graph PowerShell  
- Assign licenses and confirm provisioning behavior  
- Use security groups to control access to resources  
- Simulate both onboarding and offboarding processes  
- Verify each step using PowerShell and the Admin Center  

---

## Tools & Technologies

* Microsoft 365 Admin Center
* Microsoft Graph PowerShell
* PowerShell (macOS)
* Azure Active Directory (Entra ID concepts)

---

#  Onboarding Workflow (Joiner Process)

---

## 1️⃣ User Creation

A new enterprise user account is created with required attributes.

 **Screenshot: User Created in Admin Portal**

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

 **Screenshot: Usage Location Set**

![Usage Location](./screenshots/usage-location.png)

---

## 5️⃣ License Assignment

A Microsoft 365 Business license is assigned to the user.

 **Screenshot: License Assigned (Admin Portal)**

![License Assigned](./screenshots/license-assigned.png)

 **Screenshot: License Verification via PowerShell**

![License PowerShell](./screenshots/license-powershell.png)

---

## 6️⃣ Verification

All onboarding steps are validated using PowerShell queries.

📸 **Screenshot: Verification Output**

![Verification](./screenshots/onboarding-verification.png)

---

# Offboarding Workflow (Leaver Process)

---

## 1️⃣ License Removal

All assigned licenses are removed from the user.

 **Screenshot: License Removed**

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

## Challenges Encountered

While working through the lab, I ran into a few real-world issues:

- License assignment delays due to provisioning latency  
- Missing output in PowerShell due to variable inconsistencies  
- Some Microsoft Graph queries required explicit property selection  

These issues helped me understand how Microsoft 365 behaves in real environments and how to troubleshoot unexpected results.

---

## Troubleshooting Approach

To resolve the issues, I verified each step using Microsoft Graph PowerShell:

- Checked user properties using `Get-MgUser`  
- Verified license assignment through the `AssignedLicenses` property  
- Confirmed group membership using `Get-MgGroupMember`  
- Reviewed script output to ensure variables were returning correct values  

This step-by-step validation helped ensure that all actions were completed correctly and could be confirmed.

---

## Validation Checklist

After completing the onboarding and offboarding process, I verified the following:

- [x] User account created successfully  
- [x] Usage location configured before license assignment  
- [x] License assigned and confirmed via Admin Center and PowerShell  
- [x] User added to Finance-Team group  
- [x] Account status validated after provisioning  
- [x] Offboarding actions completed (license removed, account disabled)  

---

# Project Structure

The project is organized into separate scripts for onboarding and offboarding:

``` id="kw8rf5"
```
identity-lifecycle/
├── onboarding.ps1     # Handles user creation, licensing, and group assignment  
├── offboarding.ps1    # Handles license removal, group cleanup, and account disable  
├── README.md          # Project documentation  
└── screenshots/       # Evidence of each step and validation  

---

# Skills Demonstrated

- Automated user onboarding and offboarding using Microsoft Graph PowerShell  
- Created and managed Microsoft 365 user accounts in a simulated enterprise environment  
- Assigned and removed licenses while validating provisioning behavior  
- Implemented group-based access control using security groups  
- Troubleshot identity lifecycle issues using PowerShell queries  
- Verified configurations using both PowerShell and Microsoft 365 Admin Center

---

# Key Learnings

- Microsoft Graph often requires explicit property selection to return accurate results  
- Usage location must be set before assigning licenses  
- Security groups simplify access control in enterprise environments  
- PowerShell automation improves consistency and reduces manual errors  
- Identity lifecycle management is a core responsibility in IT support and administration  

---

# Real-World Relevance

This project reflects the type of tasks handled daily in IT support and Microsoft 365 administration.

In real environments, IT teams are responsible for creating users, assigning access, managing licenses, and securely removing access when employees leave.

Working through this lab helped me understand how these processes are handled in practice, especially the importance of validating each step and troubleshooting issues when things don’t behave as expected.

---

# Future Improvements

To improve this project further, I plan to:

- Add input parameters to make the scripts reusable for different users  
- Implement logging to track actions performed during onboarding and offboarding  
- Extend the workflow to include Teams and Exchange configuration  
- Improve error handling to better reflect real-world automation scenarios  

---

## Conclusion

In this lab, I implemented a full Microsoft 365 identity lifecycle workflow, covering both onboarding and offboarding.

I was able to automate user creation, assign access, validate configurations, and securely remove access when the user left.

This project helped me understand how identity management works in real environments, especially the importance of validation and troubleshooting during provisioning.

It reflects the type of day-to-day tasks handled by IT support and system administrators in Microsoft 365 environments. 