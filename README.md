# Open5GS 5GC Cloud Connect using UERANSIM
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

By addressing these aspects within the defined scope, the "5G CloudConnect with UERANSIM Integration" project aims to deliver a robust, secure, and high-performance platform for efficient file transfer over 5G networks, validated through thorough testing and simulation using UERANSIM.

---

<a id="architecture"></a>
<h1 align="Left">2. General Architecture </h1>

This section explains the basic architecture of 5G network core. ![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/General_architecture.jpeg)

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
| VM4 | Open5GS 5GC U-Plane1   | 10.8.2.7/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM5 | Open5GS 5GC U-Plane2 & Next Cloud for File Sharing  | 10.8.2.15/24 | Ubuntu 22.04 | 1GB | 10GB |

Two UEs were created in two separate VMs. We have provided separate slicing to individual User Equipment for File Sharing. UE1 uses the slice marked with colour Red and similarly UE2 uses slice marked with colour Blue.  

As per the project requirement UE1 and UE2 have access to File sharing with UPF1 and UPF2 respectively. The NSSF file is used for network slice selection as per the slicing parameters provided by the UEs. 
 
| NF | IP address | Supported S-NSSAI |
| --- | --- | --- |
| AMF | 10.8.2.8/24  | SST:1, SD:1 <br> SST:1, SD:2 <br> SST:2, SD:1 <br> SST:2, SD:2 |
| NSSF | 10.8.2.8/24 | SST:1, SD:1 <br> SST:1, SD:2 <br> SST:2, SD:1 <br> SST:2, SD:2 |


Subscriber Information (other information is the same) is as follows. These User informations were registered with Open5GS WebUI

| UE # |	IMSI |	DNN	 |  OP/OPc  |
| --- | --- | --- | --- |
| UE1 | 999700000000001  |	internet | OPc |
| UE2 |	999700000000003  | internet2	 | OPc |
| UE3 | 999700000000006  | internet | OPc |
| UE4 | 999700000000004  | internet	| OPc |

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



<a id="Analysis"></a>
<h1 align="Left">6. Execution </h1>

<h3 align="Left">6.1.1 Network Settings of Open5GS 5GC C-Plane </h3>
Before starting the SMF's files, configure the network setting as mentioned below.

Add IP addresses for SMF1 and SMF2 .

```
ip addr add 10.8.2.112/24 dev enp0s8
ip addr add 10.8.2.113/24 dev enp0s8 
```
<h3 align="Left">6.1.2 Network Settings of Open5GS 5GC C-Plane UPF-1 </h3>

First, uncomment the next line in the `/etc/sysctl.conf` file and reflect it in the OS.

```
net.ipv4.ip_forward=1

# sysctl -p
```

Next, configure the TUNnel interface and NAPT.

```
ip tuntap add name ogstun mode tun
ip addr add 10.45.0.1/16 dev ogstun
ip link set ogstun up

iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE
```

<h3 align="Left">6.1.3 Network Settings of Open5GS 5GC C-Plane UPF-2 </h3>

First, uncomment the next line in the `/etc/sysctl.conf` file and reflect it in the OS.
```
net.ipv4.ip_forward=1
```
```
# sysctl -p
```
Next, configure the TUNnel interface and NAPT.
```
ip tuntap add name ogstun mode tun
ip addr add 10.46.0.1/16 dev ogstun
ip link set ogstun up

iptables -t nat -A POSTROUTING -s 10.46.0.0/16 ! -o ogstun -j MASQUERADE
```

<h2 align="Left">6.2 SMF to UPF connection Establishment. </h2>
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

<h3 align="Left">6.2.1 SMF1 to UPF1 connection Establishment. </h3>

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

<h3 align="Left">6.2.2 SMF2 to UPF2 connection Establishment. </h3>

Similarly, initialization of the UPF in U-Plane2. The following commands can be performed by
running and stopping the required as mentioned below

```
$ sudo systemctl stop open5gs-smfd
$ sudo systemctl stop open5gs-amfd
$ sudo systemctl stop open5gs-nrfd
$ sudo systemctl stop open5gs-scpd
$ sudo systemctl stop open5gs-ausfd
$ sudo systemctl stop open5gs-udmd
$ sudo systemctl stop open5gs-pcfd
$ sudo systemctl stop open5gs-nssfd
$ sudo systemctl stop open5gs-bsfd
$ sudo systemctl stop open5gs-udrd
$ sudo systemctl stop open5gs-webui
$ sudo systemctl restart open5gs-upfd

```

So the wireshark traces of PFCP association between SMF2 and UPF2 is given below

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/WT-between-SMF2-n-UPF2.png)

The MSC of PFCP association between SMF2 and UPF2

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/MSC-between-SMF2-n-UPF2.png)

<h2 align="Left">6.3 Running UERAN </h2>
<h3 align="Left">6.3.1 NG Setup between gNB1 to AMF </h3>

Once the 5GC is up and running, initialization of the gNB1 & UE1 can be performed by the following
commands in the UERANSIM/build directory respectively.
To run gnb - `sudo build/nr-gnb -c config/open5gs-gnb1.yaml`

To ensure successful connection between 5GC and gnb, we need to receive `NG connection successful` in the same terminal.

To run the first ue, UE1 - `sudo ./build/nr-ue -c config/open5gs-ue1.yam`
The successful initialization of UE can be verified by receiving the `PDU Session Establishment successful` with TUNnel interface[uesimtun0,10.45.0.2] in the same terminal. 
888888 image terminal 88888

The above figure represents the Wireshark traces and message sequence chart (MSC) which is
generated after successful start of UERANSIM gNB, between gnb and AMF

88888imageeeee ws88888

The NGAP traces has
the NG set up request and response to initialize a gNB and PDU association request and response
for initializing the UE0

88888image msg8888

<h3 align="Left">6.3.2 NG Setup between gNB2 to AMF </h3>

Similarly in UE2 and gnB2 follow the command to run them.
initialization of the gNB2 & UE2 can be performed by the following
commands in the UERANSIM/build directory respectively.
To run gnb - `sudo build/nr-gnb -c config/open5gs-gnb2.yaml`

To ensure successful connection between 5GC and gnb, we need to receive `NG connection successful` in the same terminal.

To run the first ue, UE1 - `sudo ./build/nr-ue -c config/open5gs-ue2.yam`
The successful initialization of UE can be verified by receiving the `PDU Session Establishment successful` with TUNnel interface[uesimtun0,10.45.0.2] in the same terminal. 

Similarly, other UEs (UE4, UE2) can be realized.


<h2 align="Left">6.3 Accessing Data Networks. </h2>
<h3 align="Left">6.3.1 Testing the network using UE1</h3>
To ping google.com
Open a new terminal

`./nr-binder 10.45.0.4 ping google.com`

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE1.png)

Wireshark traces are shown in the image below.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE1-wireshark.png)

MSC diagram is shown below.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE1-MSC.png)

Confirm by using tcpdump that the packet goes through if=ogstun on U-Plane1.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/U_plane1/UE1_UPLANE1_TCPDUMP.png)

<h3 align="Left">6.3.2 Testing the network using UE2 via</h3>
To ping google.com
Open a new terminal

`./nr-binder 10.45.0.4 ping google.com`

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE2.png)

Wireshark traces are shown in the image below.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE2-wireshark.png)

MSC diagram is shown below.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE2-msc.png)


Confirm by using tcpdump that the packet goes through if=ogstun on U-Plane2.
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/tree/main/Figures/U_plane2)


<h1 align="Left">7 Network Slicing. </h1>

This section Includes all the network slicing that was performed.

<h2 align="Left">7.1 Next Cloud. </h2>

The NextCloud File Hosting server has been implemented on a Ip subnet 10.8.2.15 in the User Plane 2. The users who are connected to the 5G Core via ‘internet’ DNN will be able to access the NextCloud server by with pinging to the server Ip. 

<h3 align="Left">7.1.1 Creation on Users in Next Cloud (Server)</h3>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/nectcloud_Usercreations.png)

Below series of steps are involved in accessing the file sharing service:
1. NG Connection establishment between gNB and 5GC-Control Plane.  

2. PDU session establishment between U-Plane 1 and UE1.  

3. PDU session establishment between U-Plane 2 and UE2.  

4. The IP address for the ‘uesimtun0’ interfaces of both the UEs are shown in Table 7:  

| UE | IP of interface uesimtun0  | Slice used |
| --- | --- | --- |
| UE1 | 10.45.0.4  | SST:1, SD:1 |
| UE2 | 10.46.0.2 | SST:1, SD:2 |

5. Once the UEs are assigned the IP addresses on the ‘uesimtun0’ interface then ‘nr-binder’ tool
available as a part of UERANSIM is used to access the NextCloud server via web browser already
installed in both UE1 and UE2 using the below command:

```
cd UERANSIM/build  

sh nr-binder 10.45.0.4 firefox (for ue1)  

sh nr-binder 10.46.0.2 firefox (for ue2)
```
6. In the browser windows the NextCloud server can be accessed from the url https://10.8.2.15/nextcloud/ by logging in to 	users ‘UE1’ and ‘UE2’ already registered in the NextCloud server (10.8.2.15) ‘ue1’ and ‘ue2’ respectively.  

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/nextcloud_user1.png)

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/nextcloud_User2.png)

<h3 align="Left">6.4.2 File Sharing from UE1(SST:1, SD:1) to UE2(SST:1, SD:2) </h3>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/pic_nextcloud_user1(user1).png)

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/nextcloud_file_from_user1.png)



The wireshark traces and MSC is given below
***** insert image

<h2 align="Left">7.2 Connecting to a Website. </h2>


## Conclusion


## References
