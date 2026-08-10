
# Exchange Online Incident Investigation
## Mail Not Delivered from Gmail (Mail Flow Rule Misconfiguration)

---

# Incident Summary

In this lab, I investigated an issue where emails sent from Gmail accounts were not being delivered to a Microsoft 365 mailbox, while internal emails were working normally.

After analyzing the issue, I found that a mail flow (transport) rule was blocking messages from the Gmail domain.

I resolved the issue by identifying and disabling the misconfigured rule, which restored normal email delivery.

---

# Ticket Information

| Field | Details |
|-----|-----|
| Incident ID | LAB-EXO-002 |
| Category | Microsoft 365 / Exchange Online |
| Subcategory | Mail Flow |
| Priority | P2 – High |
| Impact | External communication disruption |
| SLA Target | 4 Hours |
| Resolution Time | 1 Hour 10 Minutes |
| Status | Resolved |

---

# Lab Environment

| Component | Details |
|------|------|
| Platform | Microsoft 365 |
| Service | Exchange Online |
| Tenant Domain | daizsign.onmicrosoft.com |
| Mailbox Tested | ehisevans@daizsign.onmicrosoft.com |
| Admin Portals Used | Exchange Admin Center |
| Investigation Tools | Message Trace, Mail Flow Rules |
| Lab Setup | Microsoft 365 Admin Lab |

---

# User Report

A user reported that they were not receiving emails from Gmail addresses.

---

# Initial Symptoms

Observed behaviour:

✔ Internal emails delivered successfully  
✔ Microsoft 365 tenant operational  
❌ Emails from Gmail accounts not delivered  
❌ No messages in Inbox or Junk folder  

Test performed from external Gmail account:

![Bounce Back Error](screenshots/gmail-bounce-back-error.png)

```
Email Sent → No Delivery
```

---

# Business Impact

In a real environment, this issue would prevent users from receiving emails from Gmail accounts, which could disrupt communication with clients or external partners.

Since Gmail is widely used, blocking messages from this domain could lead to missed emails, delays in communication, and increased support requests.

Even though the issue affected only external mail flow, it had a high impact due to the number of users relying on Gmail.

---

# Investigation Process

I followed a structured troubleshooting approach, starting with basic checks and then moving deeper into mail flow analysis.

## Step 1 — Confirm Mailbox Functionality

To make sure the issue wasn’t with the mailbox itself, I sent a test email from another internal user.

Result:

```
Email Delivered Successfully
```

This confirmed that the mailbox was working correctly and the issue was specific to external emails.

---

# Step 2 — Perform Message Trace

Next, I checked how the email was being processed in Exchange Online.

Navigated to:

```
Exchange Admin Center
→ Mail Flow
→ Message Trace
```

Filtered results by:

Sender: Gmail account  
Recipient: ehisevans@daizsign.onmicrosoft.com

![Message Trace Failure](screenshots/message-trace-delivery-failure.png)

Result:

```
Status: Not Delivered
Reason: Mail Flow Rule
```

This indicated that the message was being blocked during mail flow processing, so I moved on to review transport rules.

---

# Step 3 — Review Mail Flow Rules

I then checked if any transport rules were affecting external email delivery.

Navigated to:

```
Exchange Admin Center
→ Mail Flow
→ Rules
```

I identified the following rule:

```
Rule Name: Block Gmail Test
```
![Mail Flow Rule Enabled](screenshots/mail-flow-rule-enabled.png)

### Rule Configuration

Condition:

```
Sender domain = gmail.com
```

Action:

```
Reject the message
```

Since the rule was enabled, Exchange Online was rejecting all emails coming from Gmail.

---

# Root Cause

The issue was caused by a transport rule that was configured to block emails from the domain:

gmail.com  

Because the sender matched this condition, Exchange Online rejected the message during mail flow processing.

This confirmed that the issue was related to configuration, not mailbox or user settings.

---

# Resolution

To resolve the issue, I navigated to the Exchange Admin Center and located the mail flow rule named:

Block Gmail Test  

I disabled the rule and saved the changes.

![Mail Flow Rule Disabled](screenshots/mail-flow-rule-disabled.png)

This allowed emails from Gmail to pass through the transport pipeline normally.

---

# Verification

After disabling the rule, I tested the fix by sending another email from a Gmail account.

The email was delivered successfully and appeared in the user’s inbox.

I also confirmed that the delivery status changed from "Not Delivered" to "Delivered", indicating that mail flow was working as expected.

This confirmed that the issue was resolved.

---

# Lessons Learned

This lab showed me how powerful mail flow rules are in Exchange Online and how they can impact email delivery if not configured correctly.

It also reinforced the importance of using Message Trace when troubleshooting missing emails, as it helps quickly identify whether a message was blocked during transport.

Following a structured approach made it easier to isolate the issue and identify the root cause.

---

# Skills Demonstrated

- Investigated email delivery issues in Exchange Online using Message Trace  
- Identified and analyzed mail flow (transport) rules affecting message delivery  
- Diagnosed external email blocking based on domain conditions  
- Resolved a mail flow issue by modifying Exchange Online configuration  
- Applied structured troubleshooting to isolate and fix the root cause  
- Verified resolution using test emails and delivery status checks  

