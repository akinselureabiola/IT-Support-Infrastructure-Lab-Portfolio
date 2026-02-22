# Mail Not Delivered from Gmail (Exchange Online Mail Flow Investigation)

## Ticket Information

- **Category:** Microsoft 365 / Exchange Online / Mail Flow  
- **Priority:** P2 – High  
- **Impact:** External communication disruption (Gmail senders)  
- **SLA Target:** 4 hours  
- **Resolution Time:** 1 hour 10 minutes (within SLA)
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
- External non-Gmail emails delivered successfully  
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

## 📸 Evidence (Screenshots)

### 1. Mail Flow Rule Blocking Gmail (Before Fix)
![Mail Flow Rule Enabled](./mail-flow-rule-enabled.png)

### 2. Gmail Bounce-Back Error (User Impact)
![Bounce Back Error](./gmail-bounce-back-error.png)

### 3. Message Trace Showing Failure
![Message Trace Failure](./message-trace-delivery-failure.png)

### 4. Mail Flow Rule Disabled (Fix Applied)
![Rule Disabled](./mail-flow-rule-disabled.png)

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

Transport rules in Exchange Online can override standard email delivery behavior and should always be reviewed during mail flow investigations.

When troubleshooting missing external emails:

1. Perform a Message Trace to identify delivery status  
2. Review mail flow (transport) rules for policy-based blocks  
3. Check anti-spam and security policies  
4. Verify quarantine before escalating  

A structured troubleshooting approach ensures faster root cause identification and prevents unnecessary configuration changes.

---

## 📌 Conclusion

This issue was resolved by identifying and disabling a misconfigured mail flow rule. The structured troubleshooting approach ensured quick resolution within SLA and minimal business impact.
