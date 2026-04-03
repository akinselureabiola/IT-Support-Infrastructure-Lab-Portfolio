# 🔧 DHCP IP Assignment Issue – Configuration & Troubleshooting Lab

### Simulating Real-World IP Assignment and Network Validation in Windows Server

---

## 🎯 Objective

In this lab, I configured a DHCP server and investigated a scenario where a client was unable to obtain an IP address.

The goal was to identify the root cause and restore proper network connectivity using a structured troubleshooting approach.

---

## 🧾 Incident Summary

A client machine was unable to obtain an IP address from the DHCP server, preventing access to network resources.

The issue was investigated and resolved by validating DHCP configuration and retriggering the lease process.

---

## Ticket Context (Simulated Support Case)

For this lab, I approached the issue as a real support request.

A user reported that their system was connected to the network but was not receiving an IP address, which prevented access to internal resources.

## Ticket Summary

Issue: Client unable to obtain IP address  
Service: Network (DHCP)  
Impact: User cannot access network resources or connect to the domain  
Priority: Medium  
Status: Resolved  

## Ticket Description

The client machine was unable to obtain an IP address from the DHCP server after being configured to use automatic IP assignment.

As a result, the system could not communicate properly on the network, and access to domain resources was unavailable.

The issue needed to be investigated from both the client side and the DHCP server to identify where the failure was occurring.

---

## 🧾 Scenario

In this lab, I simulated a support case where a user reported:

> “My system is connected to the network, but I’m not getting an IP address.”

This type of issue is common in enterprise environments and can prevent users from accessing internal resources or logging into the domain.

---

## 🖥️ Lab Environment

| System   | Role                           | IP Address     |
| -------- | ------------------------------ | -------------- |
| DC01     | Domain Controller + DHCP + DNS | 192.168.10.10  |
| CLIENT01 | Domain-joined Windows Client   | DHCP (dynamic) |

**Network:**
`192.168.10.0/24`

---

## ⚙️ DHCP Configuration Overview

The DHCP server was configured with the following settings:

* **Scope Name:** LabScope
* **IP Range:** 192.168.10.100 – 192.168.10.200
* **Subnet Mask:** 255.255.255.0
* **Default Gateway:** 192.168.10.1
* **DNS Server:** 192.168.10.10
* **Domain Name:** bpurple.com

---

## 🛠️ Implementation Steps

### ✅ 1. Installed DHCP Role

* Opened **Server Manager**
* Added **DHCP Server role**
* Completed post-install configuration

![Server Manager showing DHCP role active](./screenshots/dhcp-role-installed.png)

---

### ✅ 2. Authorized DHCP Server

* Authorized the server in Active Directory
* Ensured only trusted DHCP servers can assign IP addresses

![Authorized server in Active Directory](./screenshots/dhcp-authorized.png)

---

### ✅ 3. Created and Configured DHCP Scope

* Defined IP range for clients
* Configured subnet mask
* Activated the scope

![Created and Configured DHCP Scope](./screenshots/dhcp-scope-created.png)

---

### ✅ 4. Configured DHCP Options (Critical Step)

Configured:

* **003 Router (Gateway):** 192.168.10.1
* **006 DNS Server:** 192.168.10.10
* **015 Domain Name:** bpurple.com

![Configured DHCP Options](./screenshots/dhcp-scope-options.png)

---

## 🚨 Incident Simulation

## 🚨 Incident Simulation

To simulate the issue, I configured the client to use DHCP and attempted to obtain an IP address.

commands used:

```bash
ipconfig /release
ipconfig /renew
```

---

## ❗ Observed Issue

The client failed to obtain an IP address.

Error observed:

> “An address has not yet been associated with the network endpoint”

![IP Address Error](./screenshots/dhcp-release-error.png)

---

## 🔍 Troubleshooting Process

I followed a structured troubleshooting approach, starting from client-side checks and moving toward DHCP server validation.

---

### 🔎 Step 1 — Verify Client IP Configuration

```bash
ipconfig
```

**Observation:**

* No valid IP or incorrect configuration

![Incorrect Configuration](./screenshots/client-no-ip.png)

---

### 🔎 Step 2 — Verify DHCP Service

On DC01:

* DHCP service → **Running**
* Server → **Authorized**

![DHCP Server Status](./screenshots/dhcp-service-running.png)

---

### 🔎 Step 3 — Verify DHCP Scope

* Scope configured correctly
* Scope activated
* Address pool verified (IP range visible)

![DHCP Scope Status](./screenshots/dhcp-scope-active.png)

---

### 🔎 Step 4 — Renew DHCP Lease

```bash
ipconfig /renew
```

**Result:**

* Client successfully received IP from DHCP

![DHCP Assignment Successful](./screenshots/dhcp-successful-assignment.png)

---

## 💡 Root Cause

The issue occurred after switching the client from a static IP to DHCP.

At that moment, the client had no valid IP address and was unable to communicate properly with the DHCP server, which caused the lease request to fail initially.

Once the DHCP process was retriggered, the client was able to successfully obtain an IP address from the configured scope.

---

## 🧠 Root Cause

The issue occurred because the client had just been switched from a static IP configuration to DHCP and did not yet have a valid lease.

Without a valid IP address, the client could not properly communicate with the DHCP server, causing the initial request to fail.

Once the DHCP process was retriggered, the client successfully obtained an IP address.

---

## 🛠 Resolution

To resolve the issue, I ensured the client was configured to:

- Obtain an IP address automatically  
- Obtain DNS server automatically  

I then renewed the DHCP lease using:

ipconfig /renew  

This allowed the client to successfully obtain an IP address from the DHCP server.

---

## ✅ Validation

### IP Assignment

ipconfig  

The client received a valid IP address within the configured DHCP scope.

![IP Assignment Validation](./screenshots/final-ipconfig.png)

---

### Connectivity Test

ping 192.168.10.10  
ping dc01.bpurple.com  

Both tests were successful, confirming:

- Network connectivity  
- DNS resolution  

![Domain Connectivity Verification](./screenshots/ping-dc-success.png)

---

### Gateway Test

ping 192.168.10.1  

Result: Destination host unreachable  

![Gateway Connectivity Failure](./screenshots/ping-gateway-fail.png)

This was expected, as there is no router configured in the lab environment.

Internal communication works correctly, but external routing is not available.

---

## 🧠 Observation

The gateway was configured via DHCP as 192.168.10.1, but there is no actual router in this lab environment using that address.

As a result:

- Internal communication within the lab network works  
- External routing is not available  

This is expected behavior in an isolated lab setup.

---

## 🧠 Key Takeaways

This lab helped reinforce how DHCP works in a real environment and how small configuration changes can affect client connectivity.

It also showed the importance of verifying both client-side and server-side settings when troubleshooting IP assignment issues.

Finally, it highlighted that not all errors indicate misconfiguration — sometimes they are expected based on how the environment is designed.

---

## 🔧 Skills Demonstrated

- Configured and authorized a DHCP server in a Windows Server environment  
- Created and managed DHCP scopes and options  
- Investigated IP assignment issues on a client machine  
- Diagnosed DHCP lease failures using command-line tools  
- Verified network connectivity and DNS resolution  
- Applied structured troubleshooting to identify and resolve the issue  

---

## 💼 Real-World Relevance

DHCP issues are common in enterprise environments and can prevent users from accessing the network or logging into the domain.

Being able to quickly diagnose and resolve IP assignment issues is an essential skill for IT support and system administration roles.

---

## 🧠 What I Would Do in a Real Environment

In a production environment, I would also:

* Check DHCP logs for lease activity
* Verify no IP conflicts exist in the scope
* Confirm network adapter and VLAN configuration
* Escalate if multiple clients are affected

This ensures the issue is not part of a larger network problem.

