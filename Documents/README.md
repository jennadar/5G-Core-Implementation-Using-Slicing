# Open5GS 5GC Cloud Connect 
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
<a id="overview"></a>
<h2 align="Left">1. Project Description </h2>

"5G CloudConnect with EURANSIM Integration" is a comprehensive project focusing on the utilization of 5G core network technology in conjunction with EURANSIM, an open-source platform for simulating and testing 5G networks, to facilitate efficient file transfer between two User Equipment (UE) via Nextcloud. The project aims to exploit the capabilities of 5G networks, including ultra-low latency and high bandwidth, to optimize file sharing performance while leveraging EURANSIM for thorough testing and validation of the network infrastructure. By integrating Nextcloud with the advanced features of 5G core networks and utilizing EURANSIM for comprehensive testing, the project seeks to ensure the reliability, scalability, and performance of the file transfer system under varying network conditions. 

---
<a id="scope"></a>
<h3 align="Left">1.1 Project Scope </h3>

The scope of the "5G CloudConnect" project encompasses the following key aspects:

<!-- - **5G Core Network Implementation**: Implementation and configuration of a 5G core network infrastructure, leveraging EURANSIM for simulation and testing purposes, to support enhanced Mobile Broadband (eMBB) services and ultra-reliable communication.

- **Integration with Nextcloud**:  Development of interfaces and protocols to seamlessly integrate Nextcloud with the 5G core network, enabling efficient and secure file transfer functionalities.

- **Performance Optimization**:  Fine-tuning network configurations and protocols to maximize file transfer speeds, minimize latency, and optimize resource utilization within the 5G CloudConnect system.

- **Security and Privacy Measures**: Implementation of robust security mechanisms, such as end-to-end encryption and access control, to ensure the confidentiality and integrity of transferred files within the Nextcloud environment.

- **Scalability and Reliability**: Designing the system architecture to be scalable and resilient, capable of handling increasing user loads and maintaining high availability under dynamic network conditions.

- **Usability and User Experience Enhancement**: Conducting usability testing and incorporating user feedback to improve the user interface and overall experience of the file transfer process within the 5G CloudConnect ecosystem.

- **Documentation and Training**: Providing comprehensive documentation, user guides, and training materials to facilitate the deployment, configuration, and usage of the 5G CloudConnect solution, including guidance on integrating with EURANSIM for testing purposes. -->

- Designing and deploying a 5G core network architecture optimized for file transfer applications utilizing Nextcloud.
- Configuring and utilizing the EURANSIM simulation platform for testing the 5G core network's performance.
- Implementing two network slices to establish separate connections between User Equipment (UE) and Nextcloud, enabling evaluation of differentiated services.
- Conducting comprehensive performance testing, including measurement of latency, throughput, and reliability, to assess the network's suitability for file transfer requirements.
- Analyzing collected data to identify strengths, weaknesses, and potential optimizations of the 5G core network in supporting file transfers.
- Documenting findings and insights obtained from the evaluation process, providing valuable information for network optimization and future deployments.
- Offering recommendations for enhancing the 5G core network's capabilities to better support file transfer applications and similar use cases.

By addressing these aspects within the defined scope, the "5G CloudConnect with EURANSIM Integration" project aims to deliver a robust, secure, and high-performance platform for efficient file transfer over 5G networks, validated through thorough testing and simulation using EURANSIM.

---
<a id="Requirement"></a>
<h2 align="Left">2. Requirement </h2>
This section explains all the required installation and pre-requisites and dependencies need to establish a 5G Core network and UERANSIM.

<h2 align="Left">2.1 Installation of Virtual Box</h2>

Download VirtualBox: Visit the official VirtualBox website (https://www.virtualbox.org/) and download the latest version of VirtualBox for your operating system (Windows, macOS, Linux).
Install VirtualBox: Run the installer and follow the on-screen instructions to install VirtualBox on your computer.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Virtual%20box.png)

<h3 align="Left">2.1.1 Creation of Virtual machines for both 5Gcore and UERANSIM  </h3>

Open VirtualBox: Launch the VirtualBox application on your computer.
Click "New": In the VirtualBox main window, click on the "New" button to create a new virtual machine.
Set Name and Type: Provide a name for your virtual machine (e.g., 5Gcore_VM), select the type (Linux), and choose the version that matches your operating system.
Allocate Memory: Specify the amount of RAM for the virtual machine. For 5G core and UERANSIM, allocate sufficient memory based on your system requirements.
Create a Virtual Hard Disk: Create a virtual hard disk and choose the size. Allocate enough space for the operating system and applications.
Click "Create" and "Create" again to confirm.
Repeat the process to create another virtual machine for UERANSIM.

<h3 align="Left">2.1.2 Install Operating Systems</h3>

Start the Virtual Machines: Select the virtual machines you created and click "Start" to power them on.
Install Operating System: Follow the on-screen instructions to install the operating system on each virtual machine. This could involve mounting an ISO file with the installation media and going through the installation process.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/twoVMs.png)

<h3 align="Left">2.1.3. Go to Network settings in virtual box to enable Adapters 1 and 2 </h3>

Select a Virtual Machine: Choose one of the virtual machines (e.g., 5Gcore_VM) and go to the "Settings."
Navigate to "Network": In the VM settings, go to the "Network" tab.
Enable Adapter 1: Check the "Enable Network Adapter" box. Choose "Bridged Adapter" from the drop-down menu. This will allow the VM to connect to the physical network.
Enable Adapter 2: Click on "Adapter 2" and check the "Enable Network Adapter" box. Choose "Host-Only Adapter" from the drop-down menu. This creates a private network between the two virtual machines.
Apply and Save: Click "OK" to apply the changes and save the settings.
Repeat the process for the UERANSIM virtual machine.

<h4 align="Left">Adapter 1:</h4>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Adapter1%20settings.png)

<h4 align="Left">Adapter 2: </h4>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Adapter2%20settings.png)

<h2 align="Left">2.2 Installing MongoDB and Open5GS</h2>

<h3 align="Left">2.2.1 Getting MongoDB: </h3>
Open a terminal on your Ubuntu machine. You can do this by pressing Ctrl + Alt + T or searching for "Terminal" in the applications menu.
Emter the following bash codes to installDB on Ubuntu

```
# Importing public key for package management system
$ sudo apt update
$ sudo apt install gnupg
$ curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor
```
```
# Creating a list file /etc/apt/sources.list.d/mongodb-org-6.0 for our Ubuntu version 22.04
$ echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
```
```
# Installing MongoDB packages 
$ sudo apt update
$ sudo apt install -y mongodb-org
$ sudo systemctl start mongod (if '/usr/bin/mongod' is not running)
$ sudo systemctl enable mongod
```

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/mongodb.png)

<h3 align="Left">2.2.2 Installation of Open5GS in our Ubuntu on VM.</h3>
Installing Open5GS on Ubuntu involves several steps, including installing dependencies, compiling the source code, and configuring the system. Below is a general guide to help installing Open5GS:

```
#easy way to install Open5GS in ubuntu
$ sudo add-apt-repository ppa:open5gs/latest
$ sudo apt update
$ sudo apt install open5gs
```
Ensure that the Open5GS components are running without errors. Check the terminal outputs for any error messages.

<h2 align="Left">2.3 Installation of WebUI of Open5GS</h2>

**Node.js is mandatory for installing WebUI of Open5GS **

Ensure that Node.js and npm (Node Package Manager) are installed on your system. You can typically install them using your system's package manager.
```
#Installing Node.js
$ sudo apt update
$ sudo apt install curl
$ curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
$ sudo apt install nodejs
```
WebUI is a web interface that allows you to get access to user (subscriber) DB of Open5GS where you can add new user or change information for existing UE (subscribers).

```
#Installing WebUI of Open5GS
$ curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -
```

<h4 align="Left">After WebUI installation, we get automatically generated username and password : </h4>

```
Username: admin
Password: 1432
```

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/webUI.png)


<h2 align="Left">2.4 Installation of UERANSIM</h2>

<h3 align="Left">Getting Started with UERANSIM</h4>
Firstly, please make sure that you have the latest version of UERANSIM. Use the following commands to clone the UERANSIM repository.

```
$ cd ~
$ git clone https://github.com/aligungr/UERANSIM
```
<h3 align="Left">Download the dependencies for UERANSIM</h3>
Firstly it's better to update your apt repositories and upgrade the programs.

```
sudo apt update
sudo apt upgrade
```

Here is the list of dependencies you need to install

```
sudo apt install make
sudo apt install gcc
sudo apt install g++
sudo apt install libsctp-dev lksctp-tools
sudo apt install iproute2
sudo snap install cmake --classic
```

<h3 align="Left">Building and compiling  UERANSIM</h4>
And here's command for building:

```
cd ~/UERANSIM
make
```
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM_build.png)
And that's it. After successfully compiling the project, output binaries will be copied to ~/UERANSIM/build folder. And you should see the following files:

nr-gnb       | Main executable for 5G gNB (RAN)

nr-ue        | Main executable for 5G UE

nr-cli       | CLI tool for 5G gNB and UE

nr-binder    | A tool for utilizing UE's internet connectivity.

libdevbnd.so | A dynamic library for nr-binder

Run `nr-gnb` and `nr-ue` to start using UE and gNB. 


## After the Installations of UERANSIM and Open5gs

### Open5gs

The initial topic for discussion is the Access and Mobility Function (AMF). The AMF is accessed by the gNodeB through the N2 interface. It is responsible for managing 5G NAS messaging, which is utilized by User Equipment (UE) or devices for requesting data services, overseeing handovers between gNodeBs during network transitions, and authenticating to the network.

By default, the AMF is configured to bind to a loopback IP. While this setup works well when everything is running on the same server, it becomes problematic for real gNodeBs or when using UERANSIM on a different machine.

To address this issue, it is necessary to configure the AMF to bind to the IP address of the machine it is running on. This configuration can be adjusted in the "/etc/open5gs/amf.yaml" file. Specifically, the ngap address needs to be modified to bind the AMF to the machine's IP. In my case, this IP is 10.0.2.4.

```bash
ngap:
  - addr: 10.0.2.4
```

![Images](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/amf_file.png)


Also, Edit the GTPU ip in UPF.yaml file

```bash
gtpu:
  - addr: 10.0.2.4
```

![Images](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/upf_file.png)


After the changes of amf.yaml and upf.yaml files, save the changes and restart both services by following the below command.

```bash

sudo systemctl restart open5gs-amfd
sudo systemctl restart open5gs-upfd

```

## Realization & Analysis 

## Overview of Open5GS 5GC Simulation Mobile Network

The following minimum configuration was set as a condition.
- The UE selects a pair of SMF and UPF based on S-NSSAI.

The built simulation environment is as follows.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM&5G-core.png)


The 5GC / UE / RAN used are as follows.
- 5GC - Open5GS v2.6.1 (2023.03.18) - https://github.com/open5gs/open5gs
- UE / RAN - UERANSIM v3.2.6 (2023.03.17) - https://github.com/aligungr/UERANSIM

Each VMs are as follows.  
| VM # | SW & Role | IP address | OS | Memory (Min) | HDD (Min) |
| --- | --- | --- | --- | --- | --- |
| VM1 | UERANSIM UE1 & gNB1 | 10.8.2.2/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM2 | Open5GS 5GS C-plane | 10.8.2.8/24 <br> 10.8.2.112/24 <br> 10.8.2.114/24 <br> 10.8.2.115/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM3 | UERANSIM UE2 & gNB2 & UPF | 10.8.2.7/24 | Ubuntu 22.04 | 1GB | 10GB |

AMF & SMF addresses are as follows.  
| NF | IP address | IP address on SBI | Supported S-NSSAI |
| --- | --- | --- | --- |
| AMF | 10.8.2.112/24 | 127.0.0.5 | SST:1, SD:0x000001 <br> SST:1, SD:0x000002 |
| SMF1 | 10.8.2.114/24 | 127.0.0.4 | SST:1, SD:0x000001 |
<!--| SMF2 | 192.168.0.115/24 | 127.0.0.24 | SST:1, SD:0x000002 |-->

gNodeB Information (other information is default) is as follows.  
| IP address | Supported S-NSSAI |
| --- | --- |
| 10.8.2.2 | SST:1, SD:0x000001 <br> SST:1, SD:0x000002 |

Subscriber Information (other information is default) is as follows.  
**Note. Please select OP or OPc according to the setting of UERANSIM UE configuration files.**
| UE | IMSI | DNN | OP/OPc | S-NSSAI |
| --- | --- | --- | --- | --- |
| UE | 001010000000000 | internet | OPc | SST:1, SD:0x000001 <br> SST:1, SD:0x000002|

<!-- I registered these information with the Open5GS WebUI.
In addition, [3GPP TS 35.208](https://www.3gpp.org/DynaReport/35208.htm) "4.3 Test Sets" is published by 3GPP as test data for the 3GPP authentication and key generation functions (MILENAGE). -->

Each DNs are as follows.
| DN | S-NSSAI |  TUNnel interface of DN | DNN | TUNnel interface of UE | U-Plane # |
| --- | --- | --- | --- | --- | --- |
| 10.45.0.0/16 | SST:1 <br> SD:0x000001 | ogstun | internet | uesimtun0 | U-Plane1 |
| 10.46.0.0/16 | SST:1 <br> SD:0x000002 | ogstun | internet | uesimtun0 | U-Plane2 |

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
## Conclusion


## References