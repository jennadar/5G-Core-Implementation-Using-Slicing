# Open5GS 5GC Cloud Connect using EURANSIM
<!-- PROJECT LOGO -->
<img src="Figures/FRA-UAS_Logo_rgb.jpg" width="150"/>

<h1 align="center">Team Gen5 Designers</h1>
<p align="center">
    <strong>Master of Engineering</strong>
    <br>
    Information Technology
    <br>
    | Nastayeen Abdul Majid(1427970) | Shiva Kumar Biru(1436929) | Jenny Nadar(1427226) | Sriram Karunanithi(1438891) |
</p>
<br/>

---

<a id="toc"></a>

## Table of Contents

- [Overview of Open5GS 5GC Simulation Mobile Network](#overview)
- [Changes in configuration files of Open5GS 5GC and UERANSIM UE / RAN](#changes)
  - [Changes in configuration files of Open5GS 5GC C-Plane](#changes_cp)
  - [Changes in configuration files of Open5GS 5GC U-Plane1](#changes_up1)
  - [Changes in configuration files of Open5GS 5GC U-Plane2](#changes_up2)
  - [Changes in configuration files of UERANSIM UE / RAN](#changes_ueransim)
    - [Changes in configuration files of RAN (gNodeB)](#changes_ran)
    - [Changes in configuration files of UE[SST:1, SD:0x000001] (IMSI-001010000000000)](#changes_ue_sd1)
    - [Changes in configuration files of UE[SST:1, SD:0x000002] (IMSI-001010000000000)](#changes_ue_sd2)
- [Network settings of Open5GS 5GC and UERANSIM UE / RAN](#network_settings)
  - [Network settings of Open5GS 5GC C-Plane](#network_settings_cp)
  - [Network settings of Open5GS 5GC U-Plane1](#network_settings_up1)
  - [Network settings of Open5GS 5GC U-Plane2](#network_settings_up2)
- [Build Open5GS and UERANSIM](#build)
- [Run Open5GS 5GC and UERANSIM UE / RAN](#run)
  - [Run Open5GS 5GC C-Plane](#run_cp)
  - [Run Open5GS 5GC U-Plane1 & U-Plane2](#run_up)
  - [Run UERANSIM (gNodeB)](#run_ran)
  - [Run UERANSIM (UE[SST:1, SD:0x000001])](#run_sd1)
    - [UE connects to U-Plane1 based on SST:1 and SD:0x000001](#con_sd1)
    - [Ping google.com going through DN=10.45.0.0/16 on U-Plane1](#ping_sd1)
  - [Run UERANSIM (UE[SST:1, SD:0x000002])](#run_sd2)
    - [UE connects to U-Plane2 based on SST:1 and SD:0x000002](#con_sd2)
    - [Ping google.com going through DN=10.46.0.0/16 on U-Plane2](#ping_sd2)
- [Changelog (summary)](#changelog)

---
<a id="intro"></a>
<h1 align="Left">1. Introduction  </h1>

<h3 align="Left"> Project Description: </h3>

"5G CloudConnect with EURANSIM Integration" is a comprehensive project focusing on the utilization of 5G core network technology in conjunction with EURANSIM, an open-source platform for simulating and testing 5G networks, to facilitate efficient file transfer between two User Equipment (UE) via Nextcloud. The project aims to exploit the capabilities of 5G networks, including ultra-low latency and high bandwidth, to optimize file sharing performance while leveraging EURANSIM for thorough testing and validation of the network infrastructure. By integrating Nextcloud with the advanced features of 5G core networks and utilizing EURANSIM for comprehensive testing, the project seeks to ensure the reliability, scalability, and performance of the file transfer system under varying network conditions. 

---
<a id="scope"></a>
<h3 align="Left">1.1 Project Scope </h3>

The scope of the "5G CloudConnect" project encompasses the following key aspects:

- Designing and deploying a 5G core network architecture optimized for file transfer applications utilizing Nextcloud.
- Configuring and utilizing the EURANSIM simulation platform for testing the 5G core network's performance.
- Implementing two network slices to establish separate connections between User Equipment (UE) and Nextcloud, enabling evaluation of differentiated services.
- Conducting comprehensive performance testing, including measurement of latency, throughput, and reliability, to assess the network's suitability for file transfer requirements.
- Analyzing collected data to identify strengths, weaknesses, and potential optimizations of the 5G core network in supporting file transfers.
- Documenting findings and insights obtained from the evaluation process, providing valuable information for network optimization and future deployments.
- Offering recommendations for enhancing the 5G core network's capabilities to better support file transfer applications and similar use cases.

By addressing these aspects within the defined scope, the "5G CloudConnect with EURANSIM Integration" project aims to deliver a robust, secure, and high-performance platform for efficient file transfer over 5G networks, validated through thorough testing and simulation using EURANSIM.

---

<a id="architecture"></a>
<h1 align="Left">2. General Architecture </h1>

This section explains the basic architecture of 5G network core. ![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/general_architecture.jpg)

<h2 align="Left"> Open5GS </h2>
Open5GS is an open-source implementation of 5G Core Network (5GC) and EPC (Evolved Packet Core), designed to provide a platform for researchers, developers, and operators to experiment, test, and deploy 5G networks. It offers a flexible and modular architecture, allowing for customization and extension to meet various deployment scenarios and requirements. Open5GS aims to promote innovation and collaboration in the 5G ecosystem by providing an accessible and interoperable framework for building next-generation mobile networks. 

<h2 align="Left"> EURANSIM </h2>
UERANSIM is an open source 5G UE & 5G RAN (gNodeB) implementation. It can be considered as a 5G mobile phone and a base station in basic terms. There are 3 main interfaces in UE/RAN perspective,  

- Control Interface (between RAN and AMF) 

- User Interface (between RAN and UPF) 

- Radio Interface (between UE and RAN).  

UERANSIM supports to run with Open5GS and Free5GC 5G Core networks. We can connect UERANSIM to one of these 5G Core network and test the functionality. 

<h2 align="Left"> Network Slicing </h2>
Network slicing is a fundamental concept in 5G networks that allows the creation of multiple virtual networks, each tailored to serve specific types of applications, services, or customers. It enables the efficient allocation of network resources and the customization of network behaviour to meet diverse requirements, such as ultra-reliable low-latency communication (URLLC), massive machine type communication (mMTC), and enhanced mobile broadband (eMBB).

---

<a id="Requirement"></a>
<h1 align="Left">3. Requirements </h1>

This section explains all the required installation and pre-requisites and dependencies need to establish a 5G Core network and UERANSIM.
Please refer to the link below to complete the installation of the dependencies. [Installations Process Guide](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Documents/Requirements-README.md)


<a id="Planning"></a>
<h1 align="Left">4. Planning </h1>

This section explains the work plan for our team and the work distribution, roles and responsiblities for each team members

***** Addd image of waterfall **

---
<a id="realisation"></a>
<h1 align="Left">5. Realization of the Project </h1>
In the realization phase of the "5G CloudConnect with EURANSIM Integration" project, significant configuration changes are made to the 5G core network components, specifically the Access and Mobility Management Function (AMF), the Session Management Function (SMF), and the Network Slice Selection Function (NSSF). These changes are essential to optimize the network architecture for efficient file transfer applications using Nextcloud and to facilitate thorough testing and validation using EURANSIM.

A brief description of the whole project is demonstrated in the image below.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM&5G-core.png)


<h2 align="Left"> Architecture Explaination </h2>
<!-- <h3 align="Left"> Overview of Open5GS 5GC Simulation Mobile Network</h3>-->

<!--The following minimum configuration was set as a condition.
- The UE selects a pair of SMF and UPF based on S-NSSAI.

The 5GC / UE / RAN used are as follows.
- 5GC - Open5GS v2.6.1 (2023.03.18) - https://github.com/open5gs/open5gs
- UE / RAN - UERANSIM v3.2.6 (2023.03.17) - https://github.com/aligungr/UERANSIM -->

The network components are configured in separate Virtual Machine labelled as VM. The details of each VM are mentioned in the table below. 

Each VMs are as follows.  
| VM # | SW & Role | IP address | OS | Memory (Min) | HDD (Min) |
| --- | --- | --- | --- | --- | --- |
| VM1 | Open5GS 5GS C-plane | 10.8.2.8/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM2 | UE&RAN (gNodeB &UEs)  | 10.8.2.2/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM3 | UE&RAN (gNodeB &UEs)  | 10.8.2.14/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM4 | Open5GS 5GC U-Plane1   | 10.8.2.9/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM5 | Open5GS 5GC U-Plane1 & Next Cloud for File Sharing  | 10.8.2.15/24 | Ubuntu 22.04 | 1GB | 10GB |

Two UEs were created in two separate VMs. We have provided separate slicing to individual User Equipment for File Sharing. UE1 uses the slice marked with colour Red and similarly UE2 uses slice marked with colour Blue.  

As per the project requirement UE1 and UE2 have access to File sharing with UPF1 and UPF2 respectively. The NSSF file is used for network slice selection as per the slicing parameters provided by the UEs. 
 
| NF | IP address | Supported S-NSSAI |
| --- | --- | --- |
| AMF | 10.8.2.8/24  | SST:1, SD:1 <br> SST:1, SD:2 |
| NSSF-SST1-SSD1 | 10.8.2.8/24 | SST:1, SD:1 |
| NSSF-SST1-SSD2 | 10.8.2.8/24 | SST:1, SD:2 |

Subscriber Information (other information is the same) is as follows. These User informations were registered with Open5GS WebUI

| UE # |	IMSI |	DNN	 |  OP/OPc  |
| --- | --- | --- | --- |
| UE1 | 999700000000001  |	internet | OPc |
| UE2 |	999700000000003  | internet2	 | OPc |
| UE3 | 999700000000006  | voip | OPc |
| UE4 | 999700000000004  | voip2	| OPc |

Each DNs are as follows.

| DN | TUNnel interface of DN |	APN/DNN	| TUNnel interface of UE | U-Plane # |
| --- | --- | --- | --- | --- |
| 10.45.0.0/16 | ogstun | internet | uesimtun0 | U-Plane1 |
| 10.46.0.0/16 | ogstun | internet | uesimtun1 | U-Plane1 |
| 10.55.0.0/16 | ogstun2 | voip | uesimtun2 | U-Plane2 |
| 10.56.0.0/16 | ogstun2 | voip | uesimtun3 | U-Plane2 |


<a id="changes"></a>

## Changes in configuration files of Open5GS 5GC and UERANSIM UE / RAN

Please refer to the following for building Open5GS and UERANSIM respectively.
- Open5GS v2.6.1 (2023.03.18) - https://open5gs.org/open5gs/docs/guide/02-building-open5gs-from-sources/
- UERANSIM v3.2.6 (2023.03.17) - https://github.com/aligungr/UERANSIM/wiki/Installation

<a id="changes_cp"></a>

### Changes in configuration files of Open5GS 5GC C-Plane

- `open5gs/install/etc/open5gs/amf.yaml`
```diff
--- amf.yaml.orig       2023-02-18 16:56:58.000000000 +0900
+++ amf.yaml    2023-02-18 17:53:50.000000000 +0900
@@ -416,28 +416,31 @@
       - addr: 127.0.0.5
         port: 7777
     ngap:
-      - addr: 127.0.0.5
+      - addr: 10.8.2.8
     metrics:
       - addr: 127.0.0.5
         port: 9090
     guami:
       - plmn_id:
-          mcc: 999
-          mnc: 70
+          mcc: 001
+          mnc: 01
         amf_id:
           region: 2
           set: 1
     tai:
       - plmn_id:
-          mcc: 999
-          mnc: 70
+          mcc: 001
+          mnc: 01
         tac: 1
     plmn_support:
       - plmn_id:
-          mcc: 999
-          mnc: 70
+          mcc: 001
+          mnc: 01
         s_nssai:
           - sst: 1
+            sd: 000001
+          - sst: 1
+            sd: 000002
     security:
         integrity_order : [ NIA2, NIA1, NIA0 ]
         ciphering_order : [ NEA0, NEA1, NEA2 ]
```
- `open5gs/install/etc/open5gs/smf1.yaml`
```diff
--- smf.yaml.orig       2023-03-10 21:49:28.000000000 +0900
+++ smf1.yaml   2023-03-11 17:42:14.000000000 +0900
@@ -20,7 +20,7 @@
 #    domain: core,sbi,ausf,event,tlv,mem,sock
 #
 logger:
-    file: /root/open5gs/install/var/log/open5gs/smf.log
+    file: /root/open5gs/install/var/log/open5gs/smf1.log
 
 #
 #  o TLS enable/disable
@@ -602,20 +602,17 @@
       - addr: 127.0.0.4
         port: 7777
     pfcp:
-      - addr: 127.0.0.4
-      - addr: ::1
+      - addr: 10.8.2.8
     gtpc:
       - addr: 127.0.0.4
-      - addr: ::1
     gtpu:
-      - addr: 127.0.0.4
-      - addr: ::1
+      - addr: 10.8.2.8
     metrics:
       - addr: 127.0.0.4
         port: 9090
     subnet:
       - addr: 10.45.0.1/16
-      - addr: 2001:db8:cafe::1/48
+        dnn: internet
     dns:
       - 8.8.8.8
       - 8.8.4.4
@@ -624,7 +621,18 @@
     mtu: 1400
     ctf:
       enabled: auto
-    freeDiameter: /root/open5gs/install/etc/freeDiameter/smf.conf
+    freeDiameter: /root/open5gs/install/etc/freeDiameter/smf1.conf
+    info:
+      - s_nssai:
+          - sst: 1
+            sd: 000001
+            dnn:
+              - internet
+        tai:
+          - plmn_id:
+              mcc: 001
+              mnc: 01
+            tac: 1
 
 #
 #  <SBI Client>>
@@ -813,7 +821,8 @@
 #
 upf:
     pfcp:
-      - addr: 127.0.0.7
+      - addr: 10.8.2.8
+        dnn: internet
 
 #
 #  o Disable use of IPv4 addresses (only IPv6)
```
- `open5gs/install/etc/open5gs/smf2.yaml`
```diff
--- smf.yaml.orig       2023-03-10 21:49:28.000000000 +0900
+++ smf2.yaml   2023-03-17 21:10:44.184592280 +0900
@@ -20,7 +20,7 @@
 #    domain: core,sbi,ausf,event,tlv,mem,sock
 #
 logger:
-    file: /root/open5gs/install/var/log/open5gs/smf.log
+    file: /root/open5gs/install/var/log/open5gs/smf2.log
 
 #
 #  o TLS enable/disable
@@ -599,23 +599,20 @@
 #
 smf:
     sbi:
-      - addr: 127.0.0.4
+      - addr: 127.0.0.24
         port: 7777
     pfcp:
-      - addr: 127.0.0.4
-      - addr: ::1
+      - addr: 192.168.0.113
     gtpc:
-      - addr: 127.0.0.4
-      - addr: ::1
+      - addr: 127.0.0.24
     gtpu:
-      - addr: 127.0.0.4
-      - addr: ::1
+      - addr: 192.168.0.113
     metrics:
-      - addr: 127.0.0.4
+      - addr: 127.0.0.24
         port: 9090
     subnet:
-      - addr: 10.45.0.1/16
-      - addr: 2001:db8:cafe::1/48
+      - addr: 10.46.0.1/16
+        dnn: internet
     dns:
       - 8.8.8.8
       - 8.8.4.4
@@ -624,7 +621,18 @@
     mtu: 1400
     ctf:
       enabled: auto
-    freeDiameter: /root/open5gs/install/etc/freeDiameter/smf.conf
+    freeDiameter: /root/open5gs/install/etc/freeDiameter/smf2.conf
+    info:
+      - s_nssai:
+          - sst: 1
+            sd: 000002
+            dnn:
+              - internet
+        tai:
+          - plmn_id:
+              mcc: 001
+              mnc: 01
+            tac: 1
 
 #
 #  <SBI Client>>
@@ -813,7 +821,8 @@
 #
 upf:
     pfcp:
-      - addr: 127.0.0.7
+      - addr: 192.168.0.115
+        dnn: internet
 
 #
 #  o Disable use of IPv4 addresses (only IPv6)
```
- `open5gs/install/etc/open5gs/nssf.yaml`
```diff
--- nssf.yaml.orig      2023-02-18 16:56:58.000000000 +0900
+++ nssf.yaml   2023-02-18 17:54:48.000000000 +0900
@@ -313,6 +313,12 @@
         port: 7777
         s_nssai:
           sst: 1
+          sd: 000001
+      - addr: 127.0.0.10
+        port: 7777
+        s_nssai:
+          sst: 1
+          sd: 000002
 
 #
 #  <SBI Client>>
```
- `open5gs/install/etc/freeDiameter/smf1.conf`  
`smf1.conf` is equal to the original `smf.conf`.

- `open5gs/install/etc/freeDiameter/smf2.conf`
```diff
--- smf.conf.orig       2023-01-12 20:33:20.131297687 +0900
+++ smf2.conf   2023-01-12 22:22:40.352706816 +0900
@@ -79,7 +79,7 @@
 #ListenOn = "202.249.37.5";
 #ListenOn = "2001:200:903:2::202:1";
 #ListenOn = "fe80::21c:5ff:fe98:7d62%eth0";
-ListenOn = "127.0.0.4";
+ListenOn = "127.0.0.24";
 
 
 ##############################################################
```

<a id="changes_up1"></a>

### Changes in configuration files of Open5GS 5GC U-Plane1

- `open5gs/install/etc/open5gs/upf.yaml`
```diff
--- upf.yaml.orig       2023-03-02 22:07:32.000000000 +0900
+++ upf.yaml    2023-03-11 17:45:02.000000000 +0900
@@ -196,12 +196,13 @@
 #
 upf:
     pfcp:
-      - addr: 127.0.0.7
+      - addr: 192.168.0.114
     gtpu:
-      - addr: 127.0.0.7
+      - addr: 192.168.0.114
     subnet:
       - addr: 10.45.0.1/16
-      - addr: 2001:db8:cafe::1/48
+        dnn: internet
+        dev: ogstun
     metrics:
       - addr: 127.0.0.7
         port: 9090
```

<a id="changes_up2"></a>

### Changes in configuration files of Open5GS 5GC U-Plane2

- `open5gs/install/etc/open5gs/upf.yaml`
```diff
--- upf.yaml.orig       2023-03-02 22:18:20.000000000 +0900
+++ upf.yaml    2023-03-11 17:46:06.000000000 +0900
@@ -196,12 +196,13 @@
 #
 upf:
     pfcp:
-      - addr: 127.0.0.7
+      - addr: 192.168.0.115
     gtpu:
-      - addr: 127.0.0.7
+      - addr: 192.168.0.115
     subnet:
-      - addr: 10.45.0.1/16
-      - addr: 2001:db8:cafe::1/48
+      - addr: 10.46.0.1/16
+        dnn: internet
+        dev: ogstun
     metrics:
       - addr: 127.0.0.7
         port: 9090
```

<a id="changes_ueransim"></a>

### Changes in configuration files of UERANSIM UE / RAN

<a id="changes_ran"></a>

#### Changes in configuration files of RAN (gNodeB)

- `UERANSIM/config/open5gs-gnb.yaml`
```diff
--- open5gs-gnb.yaml.orig       2022-07-03 13:06:43.000000000 +0900
+++ open5gs-gnb.yaml    2023-01-12 23:39:36.000000000 +0900
@@ -1,22 +1,25 @@
-mcc: '999'          # Mobile Country Code value
-mnc: '70'           # Mobile Network Code value (2 or 3 digits)
+mcc: '001'          # Mobile Country Code value
+mnc: '01'           # Mobile Network Code value (2 or 3 digits)
 
 nci: '0x000000010'  # NR Cell Identity (36-bit)
 idLength: 32        # NR gNB ID length in bits [22...32]
 tac: 1              # Tracking Area Code
 
-linkIp: 127.0.0.1   # gNB's local IP address for Radio Link Simulation (Usually same with local IP)
-ngapIp: 127.0.0.1   # gNB's local IP address for N2 Interface (Usually same with local IP)
-gtpIp: 127.0.0.1    # gNB's local IP address for N3 Interface (Usually same with local IP)
+linkIp: 192.168.0.131   # gNB's local IP address for Radio Link Simulation (Usually same with local IP)
+ngapIp: 192.168.0.131   # gNB's local IP address for N2 Interface (Usually same with local IP)
+gtpIp: 192.168.0.131    # gNB's local IP address for N3 Interface (Usually same with local IP)
 
 # List of AMF address information
 amfConfigs:
-  - address: 127.0.0.5
+  - address: 192.168.0.111
     port: 38412
 
 # List of supported S-NSSAIs by this gNB
 slices:
   - sst: 1
+    sd: 0x000001
+  - sst: 1
+    sd: 0x000002
 
 # Indicates whether or not SCTP stream number errors should be ignored.
 ignoreStreamIds: true
```

<a id="changes_ue_sd1"></a>

#### Changes in configuration files of UE[SST:1, SD:0x000001] (IMSI-001010000000000)

- `UERANSIM/config/open5gs-ue-sd1.yaml`
```diff
--- open5gs-ue.yaml.orig        2023-03-17 19:17:14.000000000 +0900
+++ open5gs-ue-sd1.yaml 2023-03-18 18:11:17.083028852 +0900
@@ -1,9 +1,9 @@
 # IMSI number of the UE. IMSI = [MCC|MNC|MSISDN] (In total 15 digits)
-supi: 'imsi-999700000000001'
+supi: 'imsi-001010000000000'
 # Mobile Country Code value of HPLMN
-mcc: '999'
+mcc: '001'
 # Mobile Network Code value of HPLMN (2 or 3 digits)
-mnc: '70'
+mnc: '01'
 # Routing Indicator
 routingIndicator: '0000'
 
@@ -22,7 +22,7 @@
 
 # List of gNB IP addresses for Radio Link Simulation
 gnbSearchList:
-  - 127.0.0.1
+  - 192.168.0.131
 
 # UAC Access Identities Configuration
 uacAic:
@@ -44,15 +44,17 @@
     apn: 'internet'
     slice:
       sst: 1
+      sd: 0x000001
 
 # Configured NSSAI for this UE by HPLMN
 configured-nssai:
   - sst: 1
+    sd: 0x000001
 
 # Default Configured NSSAI for this UE
 default-nssai:
   - sst: 1
-    sd: 1
+    sd: 0x000001
 
 # Supported integrity algorithms by this UE
 integrity:
```

<a id="changes_ue_sd2"></a>

#### Changes in configuration files of UE[SST:1, SD:0x000002] (IMSI-001010000000000)

- `UERANSIM/config/open5gs-ue-sd2.yaml`
```diff
--- open5gs-ue.yaml.orig        2023-03-17 19:17:14.000000000 +0900
+++ open5gs-ue-sd2.yaml 2023-03-18 18:11:23.769956928 +0900
@@ -1,9 +1,9 @@
 # IMSI number of the UE. IMSI = [MCC|MNC|MSISDN] (In total 15 digits)
-supi: 'imsi-999700000000001'
+supi: 'imsi-001010000000000'
 # Mobile Country Code value of HPLMN
-mcc: '999'
+mcc: '001'
 # Mobile Network Code value of HPLMN (2 or 3 digits)
-mnc: '70'
+mnc: '01'
 # Routing Indicator
 routingIndicator: '0000'
 
@@ -22,7 +22,7 @@
 
 # List of gNB IP addresses for Radio Link Simulation
 gnbSearchList:
-  - 127.0.0.1
+  - 192.168.0.131
 
 # UAC Access Identities Configuration
 uacAic:
@@ -44,15 +44,17 @@
     apn: 'internet'
     slice:
       sst: 1
+      sd: 0x000002
 
 # Configured NSSAI for this UE by HPLMN
 configured-nssai:
   - sst: 1
+    sd: 0x000002
 
 # Default Configured NSSAI for this UE
 default-nssai:
   - sst: 1
-    sd: 1
+    sd: 0x000002
 
 # Supported integrity algorithms by this UE
 integrity:
```

<a id="Analysis"></a>
<h1 align="Left">6. Execution </h1>

After the configurations of the components of 5GC in Open5GS, to receive the changes in the machine we need to restart the 5GC services as mentioned below. As multiple SMFs need to be implemented, these services are made to run separately.

```
$ sudo systemctl stop open5gs-smfd
$ sudo systemctl stop open5gs-upfd
$ sudo systemctl restart open5gs-amfd
$ sudo systemctl restart open5gs-nrfd
$ sudo systemctl restart open5gs-scpd
$ sudo systemctl restart open5gs-ausfd
$ sudo systemctl restart open5gs-udmd
$ sudo systemctl restart open5gs-pcfd
$ sudo systemctl restart open5gs-nssfd
$ sudo systemctl restart open5gs-bsfd
$ sudo systemctl restart open5gs-udrd
$ sudo systemctl restart open5gs-webui
$ sudo ./open5gs-smfd -c /smf.yaml
$ sudo ./open5gs-smfd -c /smf2.yaml
$ sudo ./open5gs-smfd -c /smf3.yaml
$ sudo ./open5gs-smfd -c /smf4.yaml

```

After restarting the 5G components, we have depicted the working of the architecture through Wireshark traces captured at Service Based Interfaces.

<h3 align="Left">6.1.1 Network Settings of Open5GS 5GC C-Plane </h3>

Before starting the SMF's files, configure the network setting as mentioned below.

Add IP addresses for SMF1 and SMF2 .

```
ip addr add 10.8.2.112/24 dev enp0s8
ip addr add 192.168.0.113/24 dev enp0s8 
```

To run the smf1 and smf2:

```
sudo /bin/open5gs-smfd -c /etc/open5gs/smf1.yaml 
sudo /bin/open5gs-smfd -c /etc/open5gs/smf2.yaml 
```

After running the above commands you will establish a smf connection as show in the image below.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/SMF_Connection.png)

The wireshark traces of PFCP association b/w SMF1 and UPF1

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/WT-between-SMF1-n-UPF1.png)

The MSC of PFCP association b/w SMF1 and UPF1

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/MSC-between-SMF1-n-UPF1.png)


<h3 align="Left">6.1.1 Network Settings of Open5GS 5GC C-Plane </h3>










## Conclusion


## References