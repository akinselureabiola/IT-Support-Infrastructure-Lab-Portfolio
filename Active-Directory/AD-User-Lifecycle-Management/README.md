# Active Directory User Lifecycle Management – Account Provisioning, Access & Troubleshooting

In this lab, I worked through common Active Directory user management tasks in a simulated enterprise environment.

The goal was to practice real helpdesk activities like creating user accounts, resetting passwords, disabling accounts, and assigning security group access.

These are the kind of tasks handled daily in IT support, especially when onboarding new users, troubleshooting login issues, or offboarding employees.

---

## Lab Refresh – August 2026

I revisited this Active Directory user-management lab to refresh the workflow and verify the key operations again.

Rather than simply repeating the original steps, I focused on how these tasks would be handled from an IT Support perspective: identifying the user issue, checking account status and group membership, making the appropriate change, and verifying the result.

The refreshed walkthrough covered user creation, password reset, account disablement, security group membership, and validation of the resulting account state.

This review also reinforced the importance of troubleshooting the user's access issue before making changes, rather than immediately assuming the cause.

---

# Ticket Information

- **Category:** Identity & Access Management / Active Directory  
- **Priority:** P3 – Medium  
- **Impact:** User authentication and access management  
- **SLA Target:** 4 Hours  
- **Resolution Time:** ~25 Minutes  
- **Status:** Completed  

---

# Scenario

**Task Assigned**

In this lab, I simulated the full lifecycle of a user account in Active Directory.

This includes what typically happens in a real environment:
- creating a new user (onboarding)
- managing access through security groups
- resetting credentials when issues occur
- disabling the account when access is no longer needed

The idea was to go through each stage the same way it would happen in a real IT support role.

---

# Environment

| System | Role | IP Address |
|------|------|------|
| DC01 | Domain Controller | 192.168.10.10 |
| CLIENT01 | Windows Client | DHCP |
| Domain | Active Directory | bpurple.com |

---

# Operating System

Windows Server 2016

---

# Tools Used

- Active Directory Users and Computers (ADUC)
- Server Manager
- Windows Server Administration Tools

---

# User Provisioning – Account Creation

To simulate onboarding, I created a new user account in Active Directory.

This represents a typical scenario where a new employee joins the organization and needs access to company systems.

User information:

| Attribute | Value |
|------|------|
| Name | Musa Ceesay |
| Username | musaceesay |
| Domain | bpurple.com |

### Steps

1. Open **Active Directory Users and Computers**
2. Navigate to the domain container
3. Right-click the **Users** container
4. Select:
```
New → User
```


5. Enter the user information
6. Configure password settings
7. Complete the user creation wizard

![User Creation](./screenshots/user-creation.png)

This confirms that the user account **Musa Ceesay** was successfully created in Active Directory.

---

# Password Reset 

Next, I simulated a common support request where a user forgets their password and needs it reset.

Password reset is one of the most frequent tasks in IT support, so I followed the same process used in a real environment.

### Steps

1. Locate the user account in **Active Directory Users and Computers**
2. Right-click the user account
3. Select:
```
Reset Password
```

4. Enter a new password
5. Confirm the password change

![Password Reset](./screenshots/password-reset.png)

The password reset operation completed successfully.

---

# Account Disable Operation

I then disabled the user account to simulate an offboarding scenario.

This is typically done when an employee leaves the organization or when access needs to be temporarily restricted.

### Steps

1. Locate the user account
2. Right-click the user
3. Select:
```
Disable Account
```


![Account Disabled](./screenshots/account-disabled.png)

The system confirms that the **Musa Ceesay user account was disabled**, preventing authentication access.

---

# Security Group Assignment

In most environments, access to resources is not given directly to users but managed through security groups.

To simulate this, I added the user to the Finance-Access group, which controls access to finance-related resources.

### Steps

1. Open **User Properties**
2. Navigate to the **Member Of** tab
3. Click **Add**
4. Add the group:
Finance-Access


5. Apply the configuration

![Group Membership](./screenshots/group-membership.png)

This confirms that the user was successfully added to the **Finance-Access security group**.

Security groups allow administrators to control access to:

- shared folders
- network resources
- departmental systems

---

# Example Helpdesk Incident

**Ticket:** User Unable to Access Finance Shared Folder

**Issue Reported:**

User reported that they were unable to access the department finance shared folder.

**Initial Investigation:**

Rather than immediately changing permissions, I first checked the user's Active Directory account and access configuration.

I verified:

- The user account existed in Active Directory
- The account status was correct
- The user's security group membership was checked
- The required `Finance-Access` group was identified as the group controlling access to the resource

**Finding:**

The user was not a member of the `Finance-Access` security group.

**Resolution:**

- Added the user to the `Finance-Access` security group
- Verified the updated group membership
- User logged off and logged back in
- Access to the finance shared resource was restored

**Troubleshooting Lesson:**

This reinforced the importance of checking account status and group membership before making permission changes. A structured troubleshooting process helps identify the actual cause instead of changing settings unnecessarily.

---

# User Account Lifecycle Workflow

Active Directory user accounts follow a structured lifecycle within enterprise environments.

This lifecycle ensures proper access provisioning, credential management, and access revocation.

| Lifecycle Stage | Action | Description |
|---|---|---|
| Provisioning | Create User | New employee account created in Active Directory |
| Access Assignment | Add to Security Group | User assigned appropriate department permissions |
| Credential Management | Reset Password | Helpdesk resets user authentication credentials |
| Access Revocation | Disable Account | User access revoked when employee leaves |

This workflow ensures organizations maintain secure identity management practices.

---

# Identity Lifecycle Model

User Creation  
↓  
Security Group Assignment  
↓  
Authentication & Daily Usage  
↓  
Password Management  
↓  
Account Disable / Offboarding

This model reflects the operational identity management processes used by enterprise IT teams.

---

# Verification

After completing the account-management operations, I verified the resulting configuration in Active Directory.

| Validation | Result |
|---|---|
| User account creation | Successful |
| Password reset | Successful |
| Security group assignment | Successful |
| Account disable operation | Successful |
| Account status verification | Confirmed |

The verification step reinforced that completing an administrative action is only part of the process. The result should also be checked to confirm that the expected configuration was applied.

---

# IT Support Takeaway

This lab reinforced a simple troubleshooting approach for Active Directory issues:

1. Identify the user's reported problem
2. Check the user's account status
3. Check relevant security group membership
4. Make the appropriate administrative change
5. Verify the result
6. Confirm that the user's access or authentication issue is resolved

This approach helps avoid making unnecessary changes and provides a repeatable process for handling common identity and access tickets.

---

# Troubleshooting Notes

The following tools were used to validate configuration and user management operations:

| Tool | Purpose |
|------|------|
| Active Directory Users and Computers | Manage user accounts |
| User Properties | Verify security group membership |
| Reset Password Tool | Manage user credentials |

These tools are standard utilities used by IT administrators for identity management.

---

# Business Impact

In a real environment, issues like this can stop users from accessing important systems or files, which can slow down work and affect productivity.

Managing user accounts properly helps ensure that users have the right access at the right time, while also reducing security risks.

---

# Skills Demonstrated

## Skills Demonstrated

- Created and managed user accounts in Active Directory to simulate onboarding processes  
- Performed password resets as part of a common helpdesk support scenario  
- Disabled user accounts to simulate offboarding and access revocation  
- Assigned users to security groups to control access to resources  
- Used Active Directory tools (ADUC) to manage user properties and permissions  
- Applied structured steps to verify account status, group membership, and access issues  

---

# Key Takeaway

This lab helped me understand how often user account management comes up in IT support.

Tasks like creating users, resetting passwords, and managing group access may seem simple, but they are critical for keeping systems secure and users productive.

It also reinforced the importance of using security groups instead of assigning permissions directly to users, as it makes access easier to manage and troubleshoot.

---

# Conclusion

Overall, this lab helped me practice the day-to-day user management tasks performed in Active Directory.

It gave me a better understanding of how onboarding, access control, and offboarding work in a real IT environment, and how important it is to manage user access properly.
