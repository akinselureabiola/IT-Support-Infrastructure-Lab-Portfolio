# Group Policy Drive Mapping – Automated Network Drive Deployment

In this lab, I set up automated network drive mapping using Group Policy in a Windows Server environment.

The goal was to simulate how IT administrators provide users with access to shared folders without manually configuring each workstation.

This is a common setup in enterprise environments where access needs to be consistent, controlled, and scalable.

---

## Lab Refresh

I revisited this Group Policy drive-mapping lab to refresh the workflow and verify how Group Policy, Active Directory security groups, and shared resources work together.

Rather than simply repeating the original configuration steps, I focused on the support side of the process: identifying who should receive the drive, controlling access through group membership, applying the policy, and then verifying the result from the client machine.

The review covered shared folder configuration, security group access, GPO drive mapping, item-level targeting, Group Policy updates, and client-side validation.

---


## Lab Objective

The objective of this lab was to configure a Group Policy that automatically maps a shared network drive for specific users based on their security group membership.

This approach helps avoid manual setup on each device and ensures users get the correct access when they log in.

---

## Real-World Scenario

I simulated a common IT Support request where HR users need access to a shared departmental folder.

Instead of manually mapping the drive on each workstation, I configured Group Policy to provide the drive automatically to users who belong to the appropriate security group.

This makes the setup easier to manage because access can be controlled centrally through Active Directory rather than configured separately on every computer.

---

## Ticket Context – Simulated Support Case

I approached this lab as a simulated IT Support request.

**Issue:** HR users need access to a shared departmental drive.

**Service:** Active Directory / Group Policy

**Impact:** Users are unable to access shared departmental files.

**Priority:** P3 – Medium

**Status:** Resolved

The goal was not just to fix access for one user, but to create a solution that would automatically provide the correct drive to members of the HR group.

---

## Approach

I wanted to solve this as a repeatable IT administration task rather than manually mapping the drive on the client.

I created a shared folder, created a security group for users who should receive access, and then used Group Policy Preferences to map the folder as a network drive.

I also used item-level targeting so that the policy would only apply to users who belong to the `HR-Drive-Access` group.

---

## Lab Environment

| System   | Role              | IP Address    |
|----------|-------------------|---------------|
| DC01     | Domain Controller | 192.168.10.10 |
| CLIENT01 | Windows Client    | DHCP          |
| Domain   | Active Directory  | bpurple.com   |

---

## Technologies Used

- Active Directory Domain Services (AD DS)
- Group Policy Management (GPMC)
- Windows Server 2016
- NTFS & Share Permissions

---

## Configuration Steps

### 1. Create Shared Folder

I created a shared folder on the domain controller to represent a departmental resource.

Path:
C:\HR  

Network path:
\\dc01\HR  

![Shared Folder](./screenshots/hr-share-folder.png)

---

### 2. Create Security Group

To control access, I created a security group in Active Directory called HR-Drive-Access.

I added users to this group so that access could be managed centrally instead of assigning permissions individually.

![Security Group](./screenshots/hr-security-group.png)

---

### 3. Create Group Policy Object (GPO)

I then created a new Group Policy Object (GPO) called "Map HR Drive" to handle the drive mapping automatically.

![GPO Created](./screenshots/gpo-created.png)

---

### 4. Configure Drive Mapping

Inside the GPO, I configured the drive mapping using the following settings:

- Action: Create  
- Location: \\dc01\HR  
- Label: HR Drive  
- Drive Letter: H:  

This ensures that the drive is automatically created when the user logs in.

![Drive Mapping](./screenshots/gpo-drive-mapping.png)

---

### 5. Configure Item-Level Targeting

To make sure only the correct users receive the drive, I configured item-level targeting.

I set the condition so that only users in the HR-Drive-Access group would receive the mapped drive.

This prevents the drive from appearing for users who shouldn’t have access.

![Item Level Targeting](./screenshots/item-level-targeting.png)

---

### 6. Link GPO to Domain

I linked the GPO to:

bpurple.com  

![GPO Linked](./screenshots/gpo-linked.png)

---

### 7. Testing and Validation

To test the configuration, I logged into the client machine and forced a Group Policy update using:

```text
gpupdate /force
```
I then logged off and back in and checked This PC to verify whether the H: drive appeared.

This gave me a simple way to confirm that the policy was being applied to the intended user.

---

## Result

After the Group Policy update and a new login, the H: drive appeared automatically on the client machine.

This confirmed that the drive mapping, security group membership, and item-level targeting were working together as expected.

![Mapped Drive](./screenshots/hr-drive-mapped.png)

---

## Troubleshooting

During testing, I approached the drive-mapping issue step by step rather than immediately changing the GPO.

I checked the following:

- Confirmed the user was a member of the `HR-Drive-Access` security group
- Forced a Group Policy update using `gpupdate /force`
- Logged off and back in to allow the policy to apply
- Checked **This PC** to verify whether the H: drive appeared

After completing these checks, the H: drive appeared correctly on the client machine.

The main takeaway for me was that when a Group Policy configuration does not appear immediately, it is worth checking the user's group membership and policy application before changing the configuration itself.

### Resolution

The issue was resolved by confirming the user's group membership, refreshing Group Policy, and starting a new login session.

### Outcome

The H: drive was successfully mapped to the client machine for the intended user.

---

## Business Impact

In a real environment, setting this up manually on each computer would take time and could lead to errors.

Using Group Policy makes the process automatic, consistent, and easier to manage, especially as the number of users grows. 

---

## Security Considerations

I used the `HR-Drive-Access` security group to control who receives the mapped drive instead of assigning access to individual users.

This makes the configuration easier to manage because access can be changed by updating group membership rather than modifying the GPO for each user.

It also reinforces the principle of giving users access based on their role and responsibilities.

---

## IT Support Takeaway

This lab reinforced that solving an access issue is not always about changing the user's computer.

In this case, the user's access depended on several pieces working together: Active Directory group membership, the shared folder, the Group Policy configuration, and the client receiving the policy.

That gave me a better understanding of how I would approach a similar ticket in a real support environment: check the user's access, verify the relevant group and policy, make the required change, and then confirm the result from the user's side.

---

## Skills Demonstrated

- Configured Group Policy Preferences to automatically map network drives
- Used Active Directory security groups to control access to shared resources
- Configured item-level targeting to apply the drive mapping to the intended users
- Worked with shared folders and NTFS/share permissions
- Used `gpupdate /force` to refresh Group Policy during troubleshooting
- Verified Group Policy results from the Windows client
- Applied a structured troubleshooting process to an access-related support scenario  

---

## Key Takeaway

The biggest thing I took from this lab was seeing how Group Policy can turn what would normally be a repetitive support task into an automated process.

Instead of manually configuring a drive on every workstation, I could use Group Policy and security group membership to control who receives the resource.

It also reinforced that when something doesn't appear as expected, I need to check the user's group membership, policy application, and login state before assuming the GPO itself is broken.

---

## Conclusion

Overall, this lab gave me practical experience with using Group Policy and Active Directory security groups to automate access to a shared resource.

It also gave me another opportunity to practise approaching a configuration issue from an IT Support perspective: identify the issue, check the relevant configuration, apply the fix, and verify the result.