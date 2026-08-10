# Microsoft 365 Identity & Mailbox Provisioning Issue – License Dependency

In this lab, I worked through a simulated Microsoft 365 support ticket where a user was unable to access Outlook and could not send or receive email.

Instead of treating the problem as an Outlook application issue, I approached it as an identity and service-provisioning problem. I started by checking the user's account and license status, then verified whether Exchange Online had been provisioned for the user.

The issue turned out to be related to the user's Microsoft 365 license. Without the required license, Exchange Online was not available for the user and a mailbox had not been provisioned.

This lab reinforced an important troubleshooting habit: when a Microsoft 365 service is unavailable, check the account and service configuration before assuming the application itself is the problem.

---

## Lab Refresh

I revisited this Microsoft 365 support scenario to refresh the troubleshooting workflow and review the relationship between user licensing and Exchange Online mailbox provisioning.

Rather than simply repeating the original steps, I focused on how I would approach the issue from an IT Support perspective:

- Confirm the user's reported symptoms
- Check the Microsoft 365 account status
- Verify whether a license was assigned
- Check Exchange Online mailbox availability
- Identify the missing license as the cause
- Assign the appropriate license
- Allow time for mailbox provisioning
- Verify that Outlook and email functionality were restored

The main goal was to reinforce a structured troubleshooting process rather than immediately assuming the issue was caused by Outlook.

---

## Ticket Information

| Field | Details |
| --- | --- |
| **Title** | User unable to access Outlook and send emails |
| **Category** | Microsoft 365 / Exchange Online / Identity |
| **User** | John Adewale |
| **Priority** | High |
| **Status** | Resolved |

### User Issue

> "I can't access Outlook and I'm not able to send or receive emails."

---

## Scenario

The simulated user reported that they were unable to access Outlook and could not send or receive emails.

Because the symptoms involved both Outlook access and email functionality, I did not immediately assume that the Outlook application was the problem.

I started by checking the user's Microsoft 365 account and service configuration, then worked toward verifying whether Exchange Online had been provisioned correctly.

---

## Investigation

I followed a structured troubleshooting process, starting with the user's account and then checking the services required for email.

### Step 1 – Confirm the Initial Symptoms

The user was unable to access Outlook Web and reported that email functionality was unavailable.

The login attempt produced an error, and the user could not send or receive email.

At this point, the issue could have been related to account configuration, licensing, mailbox provisioning, or the Outlook service itself.

Rather than making changes immediately, I moved on to checking the user's Microsoft 365 account.

---

### Step 2 – Verify Microsoft 365 License

I checked the user's account in the Microsoft 365 Admin Center.

The account was active, but there was **no Microsoft 365 license assigned**.

This was an important finding because the required Microsoft 365 services had not been assigned to the user.

At this point, the missing license became the main area of investigation.

---

### Step 3 – Verify Mailbox Provisioning

Next, I checked the user's Exchange Online mailbox status.

The user did not have a provisioned mailbox and Exchange Online was not available for the account.

This connected the earlier findings:

**No required license → Exchange Online not provisioned → No mailbox → No email access**

The problem therefore appeared to be a service-provisioning issue rather than an Outlook application problem.

---

## Root Cause

The root cause was that the user did not have the required Microsoft 365 license assigned.

Because the appropriate license had not been assigned:

- Exchange Online was not available for the user
- A mailbox had not been provisioned
- Outlook email functionality was unavailable
- The user could not send or receive email

The investigation showed that the issue was not simply an Outlook client problem. The underlying Microsoft 365 service configuration needed to be corrected first.

---

## Resolution

To resolve the issue, I assigned a **Microsoft 365 Business Standard** license to the user.

I also confirmed that Exchange Online was included with the assigned license.

After assigning the license, I allowed time for Microsoft 365 to provision the required services and mailbox.

Once provisioning completed, the user's mailbox became available and Outlook access was restored.

---

## Verification

After the license assignment and mailbox provisioning completed, I verified the result from the user's perspective.

The following were confirmed:

- Microsoft 365 license assigned successfully
- Exchange Online service available
- User mailbox provisioned
- Outlook access restored
- Email functionality restored

The user was then able to access Outlook and use email normally.

This confirmed that the license assignment resolved the underlying provisioning issue.

---

## Troubleshooting Summary

| Check | Result | Finding |
| --- | --- | --- |
| User account | Successful | Account was active |
| Microsoft 365 license | Failed | No required license assigned |
| Exchange Online | Unavailable | Service had not been provisioned |
| Mailbox | Not provisioned | No mailbox available |
| License assignment | Successful | Microsoft 365 Business Standard assigned |
| Mailbox provisioning | Successful | Mailbox became available |
| Outlook access | Restored | User could access Outlook |
| Email functionality | Restored | User could send and receive email |

This troubleshooting process helped narrow the issue down from a possible Outlook problem to an underlying Microsoft 365 licensing and service-provisioning issue.

---

## Business Impact

From an IT Support perspective, a missing Microsoft 365 license can prevent a newly created or existing user from accessing important services such as email.

In this scenario, the user could not access Outlook or communicate through email, which could quickly affect day-to-day productivity.

Identifying the licensing issue and restoring the required services allowed the user to resume normal work without making unnecessary changes to Outlook itself.

---

## Screenshots

The lab includes screenshots showing the different stages of the investigation and resolution.

## 📸 Screenshots Included

* User account without license assigned

![No License Assigned](screenshots/no-license.png)

* Outlook access denied due to license no license assigned

![Outlook Error](screenshots/outlook-error)


* Outlook access restored after license assignment

![Outlook Access Restored](screenshots/outlook-restored.png)

* User account with license assignement

![License Assignment](screenshots/license-assigned.png)


### Evidence Included

- User account without a Microsoft 365 license assigned
- Outlook access failure before the license was assigned
- Outlook access restored after license assignment
- User account showing the assigned Microsoft 365 license

These screenshots provide supporting evidence for the investigation, root cause, and successful resolution.

---

## Key Learning

The biggest lesson from this lab was that Microsoft 365 problems often need to be investigated beyond the application the user is reporting the problem through.

When the user said:

> "I can't access Outlook."

It would have been easy to start troubleshooting Outlook itself.

Instead, I worked through the issue in a logical order:

1. Confirm the user's symptoms
2. Check the Microsoft 365 account
3. Verify licensing
4. Check Exchange Online availability
5. Check mailbox provisioning
6. Correct the licensing issue
7. Verify the result from the user's perspective

The actual fix was straightforward, but the investigation was the important part.

---

## Real-World Insight

This scenario reflects a common type of Microsoft 365 support issue that can occur during onboarding or account configuration.

If a user cannot access email, I would not immediately assume the Outlook application is broken.

I would first consider:

- Is the account active?
- Does the user have the appropriate license?
- Is Exchange Online available?
- Does the mailbox exist?
- Can the user access Outlook after the required services are provisioned?

This helps separate application problems from account, licensing, and service-provisioning problems.

---

## Skills Demonstrated

- Troubleshot a simulated Microsoft 365 identity and email issue
- Checked Microsoft 365 account and license status
- Investigated Exchange Online mailbox provisioning
- Identified a missing license as the underlying cause
- Assigned a Microsoft 365 Business Standard license
- Verified that Exchange Online became available after licensing
- Confirmed mailbox provisioning and restored Outlook access
- Used a structured troubleshooting approach to isolate the root cause
- Documented the investigation, resolution, and verification process

---

## Key Takeaway

This lab reinforced the importance of checking the underlying Microsoft 365 service configuration before assuming that an application is broken.

The user experienced the problem through Outlook, but the actual issue was further upstream:

**Missing License → Exchange Online Not Provisioned → No Mailbox → No Email Access**

Once the appropriate license was assigned and the services were provisioned, the user's access was restored.

The main lesson for me was simple: troubleshoot the service behind the symptom, not just the application where the symptom appears.

---

## Conclusion

This lab gave me another opportunity to practise a realistic Microsoft 365 support scenario.

The user could not access Outlook or use email, but the underlying problem was not the Outlook application itself. The user did not have the required Microsoft 365 license, which meant Exchange Online and the mailbox had not been provisioned.

By checking the account, licensing, mailbox status, and then verifying the result after making the change, I was able to identify and resolve the actual cause.

It reinforced the value of a structured troubleshooting process and of validating the user's experience after making an administrative change.
