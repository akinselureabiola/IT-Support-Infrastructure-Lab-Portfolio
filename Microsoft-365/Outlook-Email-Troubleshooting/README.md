# 📧 Outlook Email Sending Issue – Troubleshooting Lab

This lab simulates a real-world IT support issue where a user was unable to send emails in Microsoft 365.

The focus of this exercise was to investigate the issue step by step, identify the root cause, and restore normal email functionality.

---

## 🧠 Scenario

In this lab, I worked on a simulated support ticket where a user reported:

> "I am unable to send emails from Outlook."

This is a common issue in Microsoft 365 environments and can be caused by account, licensing, or service-related problems.

## Ticket Details (Simulated IT Support Case)

Title: User unable to send emails in Outlook
Category: Microsoft 365 / Exchange Online
Priority: Medium (P3)
Status: Resolved

## Ticket Description

A user reported being unable to send emails from Outlook, which was affecting communication and daily work.

Initial symptoms included:

- Emails not sending
- No clear error message in Outlook
- Issue persists across both Outlook desktop and Outlook Web

## Impact Assessment
Affected user: 1
Business impact: Medium
Service affected: Email communication (Exchange Online)
Risk: Delay in communication and reduced productivity

---

## 🔍 Investigation Process

I followed a structured troubleshooting approach to isolate the issue, starting from basic checks and moving toward service-level validation.

### Step 1 — Verify User Account

I first confirmed that the user account exists and is active in the Microsoft 365 Admin Center.

This ruled out account-related issues.

---

### Step 2 — Check License Assignment

Next, I checked whether the user had a valid Microsoft 365 license assigned.

The license was present, so I proceeded to verify the services included in the license.

---

### Step 3 — Verify Mailbox Availability

I opened the Exchange Admin Center and checked:

Recipients → Mailboxes  

The mailbox existed and was properly provisioned, confirming that the issue was not due to a missing mailbox.

---

### Step 4 — Test Email via Outlook Web (OWA)

To rule out client-side issues, I tested sending an email using Outlook Web (OWA).

The issue persisted, confirming that it was not related to the Outlook desktop application.

---

## 💥 Issue Simulation

To replicate the issue, I disabled the Exchange Online service under the user’s license.

Result:

The user was unable to send emails.

---

## 🧩 Root Cause

The issue was caused by Exchange Online being disabled within the user’s license.

Without Exchange Online enabled, the mailbox cannot send or receive emails, even though the account and license appear valid.

---

## 🛠 Resolution

To resolve the issue, I re-enabled Exchange Online in the user’s license.

After allowing time for the changes to apply, I tested email functionality again.

---

## ✅ Verification

After re-enabling Exchange Online, I sent a test email using Outlook Web.

The email was delivered successfully, confirming that sending functionality had been restored.

This verified that the issue was resolved.

---

## SLA & Support Insight
Response Time: Immediate
Resolution Time: ~30 minutes
SLA Status: Resolved

---

## 💡 Key Learnings

This lab reinforced how closely email functionality in Microsoft 365 depends on service configuration within user licenses.

It also showed the importance of testing with Outlook Web (OWA) to rule out client-side issues.

Most importantly, it highlighted that many email issues are caused by simple configuration problems rather than system failures.

---

## 🧑‍💻 Skills Demonstrated

- Investigated email sending issues in a Microsoft 365 environment  
- Verified user account, mailbox, and licensing configuration  
- Identified service-level issues within Microsoft 365 licensing  
- Diagnosed email issues using Outlook Web (OWA)  
- Restored functionality by correcting license configuration  
- Applied structured troubleshooting to isolate and resolve the issue  

---

## 🔥 Real-World Insight

This is a common issue in IT support:

> “User cannot send email”

In many cases, the root cause is not complex, but related to missing or misconfigured services within a license.

Being able to quickly identify this helps reduce downtime and improves user experience.