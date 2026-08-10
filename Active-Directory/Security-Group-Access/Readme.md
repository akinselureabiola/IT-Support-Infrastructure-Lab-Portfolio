# Security Group Access – Shared Folder Permission Troubleshooting

In this lab, I worked through a simulated IT support ticket where a user was unable to access a departmental shared folder.

The interesting part wasn't simply fixing the access. I wanted to approach it like a real support investigation: start with the basic connectivity checks, confirm the shared resource was available, review permissions, and then investigate the user's Active Directory group membership.

The issue turned out to be a simple one — the user was missing the security group that granted access to the Finance share.

This lab helped reinforce an important troubleshooting habit: don't assume the problem is where the error message points. Work through the possible causes and eliminate them one by one.

---

## Lab Refresh

I revisited this lab to refresh the troubleshooting workflow and validate the access-control process again.

Rather than simply repeating the original configuration, I focused on the investigation side of the problem:

- Confirming the client could communicate with the Domain Controller
- Confirming the shared folder was available
- Checking the access-denied behaviour
- Reviewing the user's security group membership
- Correcting the missing group membership
- Re-testing access after the change

The main goal was to make the lab reflect how I would approach a real IT Support access issue rather than treating it as just an Active Directory configuration exercise.

---

## Ticket Information

- **Category:** Active Directory / File Server / Access Control  
- **Priority:** P3 – Medium  
- **Impact:** Single user unable to access shared company folder  
- **SLA Target:** 4 hours  
- **Resolution Time:** 50 minutes  
- **Status:** Resolved  

---

## Scenario

In this lab, I simulated a support ticket where a user reported they could not access a shared company folder.

When the user tried to open the folder, they received an **Access Denied** error, while other users were able to access it without any issues.

This is a common access control issue in Active Directory environments, usually related to permissions or group membership.

---

## Lab Environment

| Component | Configuration |
|---|---|
| Domain | bpurple.com |
| Domain Controller | DC01 |
| Domain Controller IP | 192.168.10.10 |
| Client | CLIENT01 |
| Shared Folder | `\\DC01\Finance-Share` |
| Security Group | Finance-Access |
| Virtualization | VirtualBox |
| Network | Internal Network + NAT |
| DNS Server | 192.168.10.10 |

---

### Network Architecture

The lab used a VirtualBox internal network for communication between the Domain Controller and client machine, with NAT providing internet connectivity where required.

![AD Lab Network Architecture](./screenshots/ad-lab-network-architecture.png)

---

**Configuration Notes:**

- Adapter 1 → Internal Network (intnet)  
- Adapter 2 → NAT (Internet access)  
- DNS Server → 192.168.10.10  
- Domain → bpurple.com  

---

## Initial Symptoms

The simulated user reported that they were unable to access the Finance shared folder.

I tested the network path:

```text
\\DC01\Finance-Share
```

The client could see the server and shared resources, but attempting to open the Finance share resulted in:

Access Denied  

![Access Denied Error](./screenshots/File-access-denied.png) 

At this point, I didn't assume the problem was immediately related to Active Directory permissions. I first wanted to rule out a basic connectivity problem.

---

## Business Impact

From a support perspective, issues like this can slow down a user’s ability to work, especially if the folder contains important department files.

In this case, the user was unable to access the finance shared folder, which could delay tasks and require additional support time to resolve.

Even though the issue affected only one user, it still impacted productivity and needed to be resolved within SLA.

---

## Investigation

I followed a structured troubleshooting approach to isolate the issue, starting with basic connectivity checks and gradually moving toward access control validation.

### Step 1 — Validate Network Connectivity

I first confirmed that CLIENT01 could communicate with the Domain Controller.

I executed:

```powershell
ping 192.168.10.10
```

**Result:** Successful

The successful response confirmed network communication with the Domain Controller, so I could rule out a basic connectivity problem.

![Successful Network Connectivity](./screenshots/Successful-network-connectivity.png)

---

### Step 2 — Validate Share Availability

Next, I checked whether the shared resource itself was available.

I accessed the Finance share from another user account.

**Result:** Successful

The shared folder opened successfully, confirming that the server and shared resource were operational.

This helped narrow the issue down to the affected user's access rather than a problem with the file server or shared folder itself.

---

### Step 3 — Review Share and NTFS Permissions

I then reviewed the permissions configured for the Finance shared folder on DC01.

The intended access configuration was:

- Share permissions assigned through the **Finance-Access** security group
- NTFS permissions assigned through the **Finance-Access** security group
- Access managed through group membership rather than individual user permissions

The permissions appeared to be correctly configured, so I moved on to checking the affected user's Active Directory group membership.

---

### Step 4 — Verify Security Group Membership

I opened:

```text
Active Directory Users and Computers
```

and checked the user's membership in the relevant security groups.

The user was **not a member of the Finance-Access security group**.

![User Without Required Group Access](./screenshots/No-Group-Access.png)

At this point, the cause of the Access Denied error became clear.

---

## Root Cause

The user was unable to access the Finance shared folder because they were missing membership in the **Finance-Access** security group.

The shared folder was configured to use group-based access control, so the user did not receive the required permissions until they were added to the appropriate group.

This was a useful reminder that an **Access Denied** error does not always mean the permissions themselves are incorrectly configured. The user's security group membership also needs to be checked.

---

## Resolution

To resolve the issue, I added the affected user to the **Finance-Access** security group in Active Directory.

![Finance Access Group Membership](./screenshots/Group-Access-granted.png)

After making the change, I logged the user off and back in so that their updated group membership could be reflected in their authentication session.

---

## Verification

After the user logged back in, I tested the same network path again:

```text
\\DC01\Finance-Share
```

The Finance share opened successfully and the user could access the folders inside it.

![Finance Share Access Restored](./screenshots/File-Access-granted.png)

This confirmed that the group membership change resolved the issue and restored the user's access.

---

## Troubleshooting Summary

| Check | Result | Finding |
|---|---|---|
| Network connectivity | Successful | CLIENT01 could communicate with DC01 |
| Shared folder availability | Successful | Finance share was operational |
| Share and NTFS configuration | Validated | Access was controlled through Finance-Access |
| Security group membership | Failed | User was missing Finance-Access membership |
| Access after correction | Successful | User could access the Finance share |

This troubleshooting process helped narrow the problem down from a possible network or server issue to an identity and access-control issue.

---

## Skills Demonstrated

- Troubleshot a simulated **Access Denied** issue using a structured IT Support workflow
- Verified network connectivity before investigating access permissions
- Used **Active Directory Users and Computers (ADUC)** to check security group membership
- Used security groups to control access to shared departmental resources
- Investigated the difference between connectivity issues and identity/access issues
- Reviewed Share and NTFS permissions as part of access troubleshooting
- Resolved an access issue by adding the user to the appropriate security group
- Verified access before and after making an administrative change
- Documented the investigation, root cause, resolution, and verification process

---

## Key Takeaway

The biggest lesson from this lab was the value of troubleshooting in a structured order.

When I saw the **Access Denied** message, it would have been easy to immediately start changing permissions. Instead, I worked through connectivity, resource availability, permissions, and finally group membership.

The actual fix was simple: add the user to the correct security group.

The investigation was the important part.

It reinforced for me that good IT Support is not just about knowing which setting to change. It is about narrowing down the problem, identifying the actual cause, and making the smallest appropriate change to resolve it.

---

## Conclusion

This lab gave me another opportunity to practise a common IT Support scenario: a user has network connectivity and the shared resource is available, but the user still cannot access it.

By checking each layer separately, I was able to identify that the problem was not connectivity or the shared resource itself, but missing security group membership.

It also reinforced how Active Directory security groups can be used to manage access consistently instead of assigning permissions directly to individual users.
