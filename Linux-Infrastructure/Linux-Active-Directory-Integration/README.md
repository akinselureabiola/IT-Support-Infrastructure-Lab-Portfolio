# Linux Server Integration – Active Directory Domain Environment Preparation

This lab demonstrates how I prepared a Linux server for integration with a Windows Active Directory environment.

I focused on the prerequisites that need to be working before attempting a domain join: network configuration, DNS, connectivity, hostname configuration, and Active Directory DNS resolution.

The lab was built in VirtualBox using an Ubuntu Server 24.04 LTS virtual machine connected to the same internal network as the Windows Domain Controller.

## Ticket Information

- **Category:** Linux Infrastructure / Identity Integration  
- **Priority:** P2 – High  
- **Impact:** Linux server integration into Active Directory environment  
- **SLA Target:** 1 Business Day  
- **Resolution Time:** ~2 hours  
- **Status:** Completed  

---

## Scenario

In this lab, I worked on preparing a Linux server for integration into an existing Active Directory environment.

In many real-world setups, Linux servers need to authenticate against Active Directory for centralized user management.

My goal here was to make sure the Linux server could properly communicate with the Domain Controller by validating network connectivity, DNS configuration, and domain discovery.

This is a critical step before attempting a domain join, as most integration failures are caused by DNS or connectivity issues.

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

The lab environment was built on a VirtualBox internal network called **LABNET** using the `192.168.10.0/24` address range.

The environment consisted of:

- **DC01** – Windows Server Domain Controller
- **CLIENT01** – Windows domain-joined client
- **LINUX-SRV01** – Ubuntu Server prepared for Active Directory integration

![Linux Server Integration Network Architecture](./screenshots/lab-network-architecture.png)

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

The network configuration was verified using the following command:

```bash
ip a
```

![Linux Server IP Address](./screenshots/linux-ip-address.png)

The output confirms that the Linux server has been assigned the correct IP address within the 192.168.10.0/24 enterprise network.

---

# DNS Configuration

Active Directory environments rely heavily on DNS for service discovery.

The Linux server was configured to use the Domain Controller as its DNS server.

Verification command:

```bash
cat /etc/resolv.conf
```

![Linux DNS Configuration](./screenshots/linux-resolv-conf.png)

This screenshot shows the DNS configuration file verified using the command above.

It confirms that the Linux server is configured to use 192.168.10.10 as its primary DNS server, allowing it to resolve Active Directory resources.

---

# Connectivity Validation

Connectivity between the Linux server and Domain Controller was tested using ICMP.

Command executed:

```bash
ping -c 4 192.168.10.10
```
![Linux and Domain Controller Connectivity](./screenshots/linux-ping-dc.png)

The screenshot displays the result of the connectivity test.

Successful replies confirm:

The Linux server can reach the Domain Controller

Internal lab network communication is functioning correctly

The infrastructure is ready for Active Directory integration

---

# DNS Resolution

The successful hostname resolution confirms that the Linux server can resolve Active Directory DNS records and communicate with the domain environment.

Command executed:

```bash
ping -c 4 dc01.bpurple.com
```


![Linux Domain Resolution](./screenshots/linux-domain-resolution.png)

The successful hostname resolution confirms:

The Linux server can resolve Active Directory DNS records

The Domain Controller is discoverable through DNS

The system is ready for Kerberos-based authentication



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

```bash
sudo apt install realmd sssd krb5-user adcli samba-common-bin oddjob oddjob-mkhomedir
```

---

## Active Directory Discovery

Before joining the domain, the Linux server must confirm it can discover the Active Directory environment.

Command executed:

```bash
realm discover bpurple.com
```

Expected output confirms:

- Active Directory domain detected
- Kerberos realm discovered
- Domain join configuration available

Successful discovery verifies that the Linux server can communicate with Active Directory services and is ready for domain authentication configuration.

---

# Next Step – Active Directory Domain Join

With the Linux server's hostname, network connectivity, DNS configuration, and Active Directory name resolution validated, the environment is prepared for the next stage: joining the Linux server to the domain.

The expected next step would be:

```bash
```
realm discover bpurple.com

followed by a domain join using:

sudo realm join bpurple.com

I did not treat the domain join as completed in this lab because the focus of this exercise was validating the infrastructure prerequisites required before attempting the join.

This separation helped me understand an important troubleshooting principle: before performing a major configuration change, first make sure the underlying network and DNS requirements are working correctly.

---

# Troubleshooting Notes

During validation, the following checks were performed:

| Check | Purpose |
|---|---|
| `hostnamectl` | Verify hostname and operating system |
| `ip a` | Verify network interface and IP configuration |
| `cat /etc/resolv.conf` | Validate DNS configuration |
| `ping 192.168.10.10` | Confirm connectivity with DC01 |
| `ping dc01.bpurple.com` | Confirm Active Directory DNS resolution |

All validation checks completed successfully.

The results confirmed that the Linux server could communicate with the Domain Controller and resolve it using its Active Directory hostname.

# Business Impact

In real enterprise environments, Linux servers are often required to integrate with Active Directory for centralized authentication.

If DNS or connectivity is not properly configured, domain join operations will fail, leading to delays in system deployment and increased troubleshooting time.

Ensuring these prerequisites are correctly set up helps prevent authentication issues and reduces onboarding time for new systems.

---

# Skills Demonstrated

- Deployed and configured a Linux server in a simulated enterprise environment  
- Configured network settings and validated connectivity with a Windows Domain Controller  
- Verified DNS configuration to ensure proper Active Directory service discovery  
- Tested domain name resolution to confirm readiness for Kerberos authentication  
- Prepared a Linux system for Active Directory integration using realmd and SSSD  
- Performed step-by-step validation to identify and prevent potential integration issues  

---

# Key Takeaway

This lab showed me how critical DNS and network configuration are when integrating Linux systems with Active Directory.

Before attempting a domain join, it’s important to verify connectivity, DNS resolution, and domain discovery.

In many cases, integration issues are not caused by the domain itself, but by missing prerequisites on the Linux system.

---

# Conclusion

In this lab, I prepared an Ubuntu Server system for integration with an existing Active Directory environment.

I configured and verified the Linux server's hostname, IP addressing, DNS configuration, network connectivity, and Active Directory DNS resolution.

The validation confirmed that the Linux server could communicate with the Domain Controller and resolve it using its Active Directory hostname.

The next stage would be to perform Active Directory discovery and complete the domain join using the realmd and SSSD stack.

The main lesson from this lab was that successful Linux and Active Directory integration starts with getting the fundamentals right — especially networking and DNS.
