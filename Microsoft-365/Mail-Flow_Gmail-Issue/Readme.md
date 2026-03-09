# Mail Not Delivered from Gmail (Mail Flow Investigation)

## Ticket Information

- **Category:** Microsoft 365 / Exchange Online / Mail Flow  
- **Priority:** P2 – High  
- **Impact:** External communication disruption (Gmail senders)  
- **SLA Target:** 4 hours  
- **Resolution Time:** 1 hour 10 minutes  
- **Status:** Resolved  

---

## Scenario

**User Reported:**

> “I’m not receiving emails from Gmail addresses.”

The user reported that messages sent from Gmail accounts were not appearing in their inbox. Internal emails were functioning normally.

---

## Environment

- **Platform:** Microsoft 365 (Exchange Online)  
- **Tenant Domain:** daizsign.onmicrosoft.com  
- **Mailbox Tested:** ehisevans@daizsign.onmicrosoft.com  
- **Admin Portals Used:**  
  - Exchange Admin Center (EAC)  
  - Microsoft Defender Portal  
- **Mail Flow Rules:** Transport rule configured to block Gmail (lab simulation)  

---

## Initial Symptoms

- Internal emails delivered successfully  
- External emails from Gmail were rejected due to a transport rule 
- Emails from Gmail addresses were not delivered  
- No messages visible in Inbox or Junk folder  

Test performed from external Gmail account:

```

Email sent → No inbox delivery

```

---

## Business Impact

If unresolved, this issue could:

- Disrupt communication with clients using Gmail  
- Delay business correspondence  
- Cause missed deadlines  
- Impact business reputation  

Mail flow interruptions from major providers like Gmail can significantly affect operations.

---

## Investigation Steps

### Step 1 — Confirm Mailbox Functionality

Sent internal test email.

**Result:** Delivered successfully  

Confirmed the mailbox was operational.

---

### Step 2 — Perform Message Trace

Navigated to:

```

Exchange Admin Center → Mail flow → Message trace

```

Filtered by:
- Sender: Gmail address  
- Recipient: ehisevans@daizsign.onmicrosoft.com  

**Result:**

```

Status: Failed
Action: Rejected
Reason: Transport rule

```

This confirmed the message was being blocked before reaching the mailbox.

---

### Step 3 — Review Mail Flow Rules

Navigated to:

```

Exchange Admin Center → Mail flow → Rules

```

Identified rule:

```

Block Gmail Test

```

**Condition:**
- Sender domain is gmail.com  

**Action:**
- Reject message  

The rule was enabled.

---

## Root Cause

A transport (mail flow) rule had been configured to reject emails originating from:

```

gmail.com

```

Because Gmail matched the rule condition, messages were automatically rejected during mail processing.

This was a configuration-based mail flow restriction — not a mailbox issue.

---

## Resolution Steps

1. Opened:

```

Exchange Admin Center → Mail flow → Rules

```

2. Located the rule:
   - **Block Gmail Test**

3. Disabled the rule.

4. Saved configuration changes.

5. Sent a new test email from Gmail account.

---

## Verification

- New Gmail email delivered successfully  
- Message visible in Inbox  
- Message trace showed:

```

Status: Delivered

```

- User confirmed successful receipt  

Mail flow restored.

---

## Skills Demonstrated

- Exchange Online mail flow troubleshooting  
- Message Trace analysis  
- Transport rule investigation  
- Microsoft 365 admin portal navigation  
- Structured root cause identification  
- Business-impact awareness  

---

## Key Takeaway

Transport rules in Exchange Online can override normal mailbox delivery behavior.

When users report missing external emails:

1. Perform a Message Trace  
2. Review mail flow (transport) rules  
3. Check anti-spam policies  
4. Verify quarantine before escalating  

Structured troubleshooting prevents unnecessary mailbox reconfiguration and quickly identifies policy-based blocks.
```

---

This version is:

* Clean
* Structured
* GitHub-friendly
* Professional
* Recruiter-readable
* ATS-friendly

If you’d like, I can now:

* Create a reusable master template for all 30 tickets
* Write your full GitHub README
* Structure your entire repository like a real enterprise documentation project
