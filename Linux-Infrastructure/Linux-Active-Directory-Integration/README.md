# Linux Server Integration – Active Directory Domain Environment

This lab demonstrates how a Linux server can be prepared for integration with a Windows Active Directory domain by validating DNS configuration, network connectivity, and domain discovery prerequisites.

## Ticket Information

- **Category:** Linux Infrastructure / Identity Integration  
- **Priority:** P2 – High  
- **Impact:** Linux server integration into Active Directory environment  
- **SLA Target:** 1 Business Day  
- **Resolution Time:** ~2 hours  
- **Status:** Completed  

---

# Scenario

**Task Assigned**

> Integrate a Linux server into an existing Active Directory domain environment.

In many enterprise environments, Linux servers must authenticate against **Active Directory** for centralized identity management.

The objective of this lab was to deploy a Linux server and configure it to communicate with a **Windows Server Domain Controller** within an enterprise network.

The Linux system needed to:

- Connect to the internal enterprise network
- Use the Active Directory DNS server
- Resolve domain controller hostnames
- Communicate with the Domain Controller
- Prepare the system for domain authentication

This setup simulates real-world infrastructure where Linux servers interact with Windows Active Directory environments.

---

# Environment

| System | Role | IP Address |
|------|------|------|
| DC01 | Domain Controller | 192.168.10.10 |
| CLIENT01 | Windows Domain Client | DHCP |
| LINUX-SRV01 | Linux Server | 192.168.10.30 |

---

### Domain

bpurple.com

---

### Operating Systems

Domain Controller: Windows Server 2016  
Linux Server: Ubuntu Server 24.04 LTS  

---

### Virtualization Platform

Oracle VirtualBox

---

### Network

Internal Network (LABNET)  
Network Range: 192.168.10.0/24

---

# Network Architecture

![Architecture](./screenshots/lab-network-architecture.png)


This diagram illustrates the structure of the lab environment.

It shows the relationship between:

- **DC01** (Domain Controller)
- **CLIENT01** (Windows domain client)
- **LINUX-SRV01** (Linux server)

All systems communicate within the **192.168.10.0/24 LABNET internal network**.

---

# Linux Server Deployment

A Linux virtual machine was deployed using **Ubuntu Server 24.04 LTS** inside Oracle VirtualBox.

The server was connected to the **LABNET internal network** to allow communication with the Domain Controller.

The system was configured with the hostname:

linux-srv01

The following command was used to verify the system configuration:

```bash
hostnamectl
```

![Linux Server Installation](./screenshots/linux-server-installation.png)

The screenshot confirms:

1. The server hostname linux-srv01.bpurple.com

2. The operating system Ubuntu 24.04 LTS

3. The virtualization environment Oracle VirtualBox

This verifies that the Linux server installation completed successfully.

---

# Network Configuration

The Linux server was configured with a static IP address to ensure reliable communication with the Domain Controller.

Network configuration values:

| Setting | Value |
|--------|------|
| IP Address | 192.168.10.30 |
| Subnet | 255.255.255.0 |
| DNS Server | 192.168.10.10 |

The network configuration was verified using the command:

ip a

![Linux Server IP Address](./screenshots/linux-ip-address.png)

The output confirms that the Linux server has been assigned the correct IP address within the 192.168.10.0/24 enterprise network.

---

# DNS Configuration

Active Directory environments rely heavily on DNS for service discovery.

The Linux server was configured to use the Domain Controller as its DNS server.

Verification command:

```bash
cat /etc/resolv.conf

![Linux DNS Configuration](./screenshots/linux-resolv-conf.png)

This screenshot shows the DNS configuration file verified using:
cat /etc/resolv.conf

It confirms that the Linux server is configured to use **192.168.10.10**, as its primary DNS server, allowing it to resolve Active Directory resources.

---

# Connectivity Validation

Connectivity between the Linux server and Domain Controller was tested using ICMP.

Command executed:

ping -c 4 192.168.10.10

![Linux Ping Domain Controller](./screenshots/linux-ping-dc.png)

The screenshot displays the result of the connectivity test:

ping -c 4 192.168.10.10


Successful replies confirm:

1. The Linux server can reach the Domain Controller

2. Internal lab network communication is functioning correctly

3. The infrastructure is ready for Active Directory integration.

---

# Domain Name Resolution

Proper DNS resolution is required before Linux systems can authenticate against Active Directory.

Command executed:

ping -c 4 dc01.bpurple.com

![Linux Domain Resolution](./screenshots/linux-domain-resolution.png)

This screenshot shows the result of:
ping -c 4 dc01.bpurple.com

The successful hostname resolution confirms:

1. The Linux server can resolve Active Directory DNS records

2. The Domain Controller is discoverable through DNS

3. The system is ready for Kerberos-based authentication



# Virtual Machine Network Configuration

The Linux virtual machine network adapter was configured in Oracle VirtualBox.

Network settings:

Adapter 1 → Internal Network
Network Name → LABNET

![VirtualBox Network Settings](./screenshots/virtualbox-network-settings.png)

The screenshot above shows the **Oracle VirtualBox network adapter configuration**.

The Linux virtual machine is connected to the **LABNET internal network**

This configuration allows communication between:

- Domain Controller (DC01)
- Windows Client (CLIENT01)
- Linux Server (LINUX-SRV01)

within the isolated lab environment.

---

# Domain Integration Preparation

The Linux system was prepared for Active Directory integration by installing the required authentication and identity services packages.

Packages installed:

- realmd
- sssd
- krb5-user
- adcli
- samba-common-bin
- oddjob
- oddjob-mkhomedir

These components enable Linux systems to integrate with Active Directory using **Kerberos authentication and SSSD identity services**.

The installation was completed using the following command:
sudo apt install realmd sssd krb5-user adcli samba-common-bin oddjob oddjob-mkhomedir

---

## Active Directory Discovery

Before joining the domain, the Linux server must confirm it can discover the Active Directory environment.

Command executed:
realm discover bpurple.com


Expected output confirms:

- Active Directory domain detected
- Kerberos realm discovered
- Domain join configuration available

Successful discovery verifies that the Linux server can communicate with Active Directory services and is ready for domain authentication configuration.

---

# Domain Join (Next Phase)

Once the Linux server successfully discovers the Active Directory domain, the next step is joining the system to the domain.

Command used for domain join:

```
sudo realm join bpurple.com
```

During the join process, the system requests credentials from a domain administrator with permission to add computers to the domain.

Successful domain integration enables:

* Active Directory authentication for Linux logins
* Centralized identity management
* Kerberos-based authentication
* SSSD-based user identity services

This lab focused on validating the infrastructure prerequisites required before performing a domain join operation.

---

# Troubleshooting Notes

During validation, the following checks were performed:

| Check | Purpose |
|------|------|
| `ip a` | Verify network interface configuration |
| `cat /etc/resolv.conf` | Validate DNS configuration |
| `ping 192.168.10.10` | Confirm network connectivity |
| `ping dc01.bpurple.com` | Confirm domain name resolution |


All checks returned successful results, indicating that the Linux server was correctly configured to communicate with the Active Directory environment.

# Business Impact

Linux and Windows environments often coexist in enterprise infrastructure.

Integrating Linux servers with Active Directory allows organizations to:

- Centralize authentication
- Manage user access from a single directory
- Improve security and identity governance
- Simplify system administration

---

# Skills Demonstrated

- Linux server deployment
- Enterprise network configuration
- DNS troubleshooting
- Windows–Linux interoperability
- Active Directory integration preparation
- Virtual infrastructure setup
- Network diagnostics
- Infrastructure documentation

---

# Key Takeaway

In enterprise environments, Linux servers frequently integrate with Windows Active Directory infrastructure.

Before joining a Linux system to a domain, administrators must ensure:

1. Correct network configuration

2. Proper DNS resolution

3. Reliable connectivity to the Domain Controller

Without these prerequisites, Kerberos authentication and domain join operations will fail.

This lab demonstrates the foundational infrastructure checks required before integrating Linux systems into enterprise identity environments.

---

# Conclusion

The Linux server was successfully deployed within the **bpurple.com Active Directory lab environment**.

The server can now:

- Communicate with the Domain Controller
- Resolve domain resources using DNS
- Participate in enterprise network infrastructure

This lab prepares the environment for **future Linux Active Directory authentication integration** using Kerberos and SSSD.
