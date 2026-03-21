# Microsoft 365 User License Troubleshooting Lab

🚀 This lab simulates a real-world IT support scenario where a user is unable to access email services after account creation.

Instead of a standard setup lab, this exercise focuses on **diagnosing and understanding the root cause of service access issues in Microsoft 365**.

---

## 🧠 Scenario

A new user account was successfully created in Microsoft 365.

However, the user reported:

> "I cannot access my email after login."

This lab investigates why the issue occurred and how to properly diagnose it.

---

## 🔍 Investigation Steps

### 1. Verify User Creation
- Navigated to **Microsoft 365 Admin Center → Users → Active Users**
- Confirmed that the user account was successfully created

![User Creation](./screenshots/user-created.png)

---

### 2. Check License Assignment
- Opened the user profile → **Licenses and Apps**
- Observed:
  - Microsoft Entra ID P2 → Assigned ✅
  - Microsoft 365 Business Standard → Not available ❌

![License Unavailable](./screenshots/license-unavailable.png)

---

### 3. Attempt License Assignment
- Attempted to assign Microsoft 365 Business Standard license
- Not possible due to **0 available licenses**

![License Assignment Attempt](./screenshots/license-assignment-attempt.png)


---

### 4. Verify Mailbox in Exchange Admin Center
- Accessed **Exchange Admin Center**
- Navigated to: **Recipients → Mailboxes**
- Searched for the user

Result:
- No mailbox found ❌

![No Mailbox](./screenshots/no-mailbox.png)

---

### 5. Verify Available Licenses (Tenant Level)
- Navigated to **Billing → Licenses**
- Observed:
  - Microsoft Entra ID P2 → Available ✅
  - No Microsoft 365 service licenses available ❌

  ![License Overview](./screenshots/license-overview-no-m365.png)

---

## 🧩 Findings

- User account was successfully created
- Only Microsoft Entra ID P2 license was assigned
- No Microsoft 365 service license (e.g., Business Standard) was available
- No mailbox was provisioned in Exchange Admin Center

---

## ⚠️ Root Cause

The issue was caused by the absence of a valid Microsoft 365 service license.

Microsoft Entra ID provides identity and access management, but **does not include email services**.

Without a license that includes **Exchange Online**, a mailbox is not created.

---

## 🛠️ Resolution

To resolve the issue:

- Assign a valid Microsoft 365 license (e.g., Business Standard, E3, etc.)
- Ensure licenses are available in the tenant
- Once assigned, mailbox provisioning will occur automatically

> Note: In this lab, resolution could not be completed due to license unavailability.

---

## 🎯 Outcome

The user was unable to access email services due to missing licensing.

This lab highlights how **licensing directly impacts service availability in Microsoft 365 environments**.

---

## 💡 Key Learnings

- Creating a user does not automatically grant access to services
- Microsoft 365 services (Exchange, Teams, SharePoint) depend on valid licenses
- Always verify license availability during onboarding
- Many real-world IT issues are caused by simple misconfigurations
- Troubleshooting should start with:
  - Identity
  - Licensing
  - Service availability

---

## 🧑‍💻 Skills Demonstrated

- Microsoft 365 Administration
- User Onboarding
- License Management
- Exchange Online Verification
- Troubleshooting & Root Cause Analysis
- IT Support Thinking (real-world scenario)

---

## 🔥 Real-World Insight

This type of issue is very common in IT support environments:

> “User cannot access email”

And in many cases, the root cause is not complex —  
it is simply **missing or incorrect licensing**.

Understanding this helps reduce resolution time and improves user experience.

---

## 📌 Tools Used

- Microsoft 365 Admin Center
- Exchange Admin Center
- Microsoft Entra ID
