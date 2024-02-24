#  Implementation and Testing of a 5G Core Network for Slicing and Application Connectivity using UERANSIM
<!-- PROJECT LOGO -->
<p align="center">
<img src="/Figures/Installations/FRA-UAS_Logo_rgb.jpg" width="650"/>
</p>

<h1 align="center">Team Gen5 Designers</h1>
<p align="center">
    <h3 align="center">Master of Engineering</h3>
    <h3 align="center">Information Technology</h3>
    <h5 align="center">Nastayeen Abdul Majid(1427970)</h5> 
    <h5 align="center">Shiva Kumar Biru(1436929)</h5> 
    <h5 align="center"> Jenny Nadar(1427226) </h5>
    <h5 align="center"> Sriram Karunanithi(1438891) </h5>
</p>


---

<a id="toc"></a>

## Table of Contents

- [1. Introduction](#intro)
  - [1.1 Project Scope](#scope)
- [2. General Architecture](#architecture)
  - [2.1: Open5GS](#Open5GS)
  - [2.2: UERANSIM](#UERANSIM)
  - [2.3: Network Slicing](#slicing)
- [3. Requirements](#Requirement)
- [4. Planning](#Planning)
- [5. Realization of the Project ](#realisation)
    - [5.1: Project Architecture Explaination](#archi)
    - [5.2:  Changes in configuration files of Open5GS 5GC and UERANSIM UE / RAN](#changes)
- [6. Execution](#execution)
  - [6.1 Network Setting](#network-set)
      - [6.1.1 Network Settings of Open5GS 5GC C-Plane ](#network-set)
      - [6.1.2 Network Settings of Open5GS 5GC C-Plane UPF-1](#network-set-up1)
      - [6.1.3 Network Settings of Open5GS 5GC C-Plane UPF-2](#network-set-up2)
  - [6.2 SMF to UPF connection Establishment.](#SMF-UPF)
      - [6.2.1 SMF1 to UPF1 connection Establishment.](#smf1-upf1)
      - [6.2.2 SMF2 to UPF2 connection Establishment.](#smf2-upf2)
  - [6.3 Running UERAN ](#run-ran)
      - [6.3.1: NG Setup between gNB1 to AMF](#run-ran)
      - [6.3.2: NG Setup between gNB2 to AMF](#ng-setup)
  - [6.4 Accessing Data Networks.](#data)
      - [6.4.1: Testing the network using UE1](#data)
      - [6.4.2: Testing the network using UE2](#data2)
- [7. Network Slicing.](#slice)
    - [7.1.1: Creation on Users in Next Cloud (Server)](#slice)
    - [7.2 Connecting to a Website.](#slice2)
- [Conclusion](#conclusion)
- [Reference](#refer)

---
<a id="intro"></a>
<h1 align="Left">1. Introduction  </h1>

<h3 align="Left"> Project Description: </h3>

This project focuses on the design, implementation, and testing of a 5G core network infrastructure with slicing capabilities using UERANSIM. The network architecture enables multiple User Equipment (UE) devices to utilize different network slices for distinct applications, such as file transfer via Nextcloud and web browsing. Specifically, four UEs are employed to test the network, with UE1 and UE2 assigned to transfer files via Nextcloud, while UE3 and UE4 connect to websites like google.com. Through this setup, the project aims to assess the efficacy and performance of 5G network slicing in facilitating diverse application requirements while ensuring efficient resource allocation and management. 

---
<a id="scope"></a>
<h3 align="Left">1.1 Project Scope </h3>

The scope of the "5G CloudConnect" project encompasses the following key aspects:

- Designing and deploying a 5G core network architecture optimized for file transfer applications utilizing Nextcloud.
- Configuring and utilizing the EURANSIM simulation platform for testing the 5G core network's performance.
- Implementing four network slices to establish separate connections between User Equipment (UE) and Nextcloud, and connecting to different application/webservices enabling evaluation of differentiated services.
- Conducting comprehensive performance testing, including measurement of latency, throughput, and reliability, to assess the network's suitability for file transfer requirements.
- Analyzing collected data to identify strengths, weaknesses, and potential optimizations of the 5G core network in supporting file transfers.
- Documenting findings and insights obtained from the evaluation process, providing valuable information for network optimization and future deployments.
- Offering recommendations for enhancing the 5G core network's capabilities to better support file transfer applications and similar use cases.

By addressing these aspects within the defined scope, the " Implementation and Testing of a 5G Core Network for Slicing and Application Connectivity using UERANSIM" project aims to deliver a robust, secure, and high-performance platform for efficient file transfer over 5G networks, validated through thorough testing and simulation using UERANSIM.

---

<a id="architecture"></a>
<h1 align="Left">2. General Architecture </h1>

This section explains the basic architecture of 5G network core.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Architecture/General_architecture.jpeg)

<a id="Open5GS"></a>
<h2 align="Left">2.1: Open5GS </h2>
Open5GS is an open-source implementation of 5G Core Network (5GC) and EPC (Evolved Packet Core), designed to provide a platform for researchers, developers, and operators to experiment, test, and deploy 5G networks. It offers a flexible and modular architecture, allowing for customization and extension to meet various deployment scenarios and requirements. Open5GS aims to promote innovation and collaboration in the 5G ecosystem by providing an accessible and interoperable framework for building next-generation mobile networks. 

<a id="UERANSIM"></a>
<h2 align="Left">2.2: UERANSIM </h2>
UERANSIM is an open source 5G UE & 5G RAN (gNodeB) implementation. It can be considered as a 5G mobile phone and a base station in basic terms. There are 3 main interfaces in UE/RAN perspective,  

- Control Interface (between RAN and AMF) 

- User Interface (between RAN and UPF) 

- Radio Interface (between UE and RAN).  

UERANSIM supports to run with Open5GS and Free5GC 5G Core networks. We can connect UERANSIM to one of these 5G Core network and test the functionality. 

<a id="slicing"></a>
<h2 align="Left">2.3: Network Slicing </h2>
Network slicing is a fundamental concept in 5G networks that allows the creation of multiple virtual networks, each tailored to serve specific types of applications, services, or customers. It enables the efficient allocation of network resources and the customization of network behaviour to meet diverse requirements, such as ultra-reliable low-latency communication (URLLC), massive machine type communication (mMTC), and enhanced mobile broadband (eMBB).

---

<a id="Requirement"></a>
<h1 align="Left">3. Requirements </h1>

This section explains all the required installation and pre-requisites and dependencies need to establish a 5G Core network and UERANSIM.
Please refer to the link below to complete the installation of the dependencies. [Installations Process Guide](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/User-Guide/Requirements-README.md)


<a id="Planning"></a>
<h1 align="Left">4. Planning </h1>

This section explains the work plan for our team and the work distribution, roles and responsiblities for each team members

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Project%20Planning.png)

---
<a id="realisation"></a>
<h1 align="Left">5. Realization of the Project </h1>
In the realization phase of the "5G CloudConnect with EURANSIM Integration" project, significant configuration changes are made to the 5G core network components, specifically the Access and Mobility Management Function (AMF), the Session Management Function (SMF), and the Network Slice Selection Function (NSSF). These changes are essential to optimize the network architecture for efficient file transfer applications using Nextcloud and to facilitate thorough testing and validation using EURANSIM.

A brief description of the whole project is demonstrated in the image below.


![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Architecture/Project%20Architecture.png)

<a id="archi"></a>
<h2 align="Left">5.1: Project Architecture Explaination </h2>

The network components are configured in separate Virtual Machine labelled as VM. The details of each VM are mentioned in the table below. 

Each VMs are as follows.  
| VM # | SW & Role | IP address | OS | Memory (Min) | HDD (Min) |
| --- | --- | --- | --- | --- | --- |
| VM1 | Open5GS 5GS C-plane | 10.8.2.8/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM2 | UE&RAN (gNodeB &UEs)  | 10.8.2.2/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM3 | UE&RAN (gNodeB &UEs)  | 10.8.2.14/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM4 | Open5GS 5GC U-Plane1   | 10.8.2.7/24 | Ubuntu 22.04 | 1GB | 10GB |
| VM5 | Open5GS 5GC U-Plane2 & Next Cloud for File Sharing  | 10.8.2.15/24 | Ubuntu 22.04 | 1GB | 10GB |

Four UEs were created in two separate VMs. We have provided separate slicing to individual User Equipment for File Sharing. UE1 uses the slice marked with colour Red and similarly UE2 uses slice marked with colour Blue and the other two UE's UE3,UE4 is used to connect to the website 

As per the project requirement UE1 and UE2 have access to File sharing with UPF1 and UPF2 respectively and the remaining UE's is for connecting to Data network. The NSSF file is used for network slice selection as per the slicing parameters provided by the UEs. 
 
| NF | IP address | Supported S-NSSAI |
| --- | --- | --- |
| AMF | 10.8.2.8/24  | SST:1, SD:1 <br> SST:1, SD:2 <br> SST:2, SD:1 <br> SST:2, SD:2 |
| NSSF | 10.8.2.8/24 | SST:1, SD:1 <br> SST:1, SD:2 <br> SST:2, SD:1 <br> SST:2, SD:2 |


Subscriber Information (other information is the same) is as follows. These User informations were registered with Open5GS WebUI

| UE # |	IMSI |	DNN	 |  OP/OPc  |
| --- | --- | --- | --- |
| UE1 | 999700000000001  | internet | OPc |
| UE2 |	999700000000003  | internet	 | OPc |
| UE3 | 999700000000006  | internet2 | OPc |
| UE4 | 999700000000004  | internet2| OPc |

Each DNs are as follows.

| DN | TUNnel interface of DN |	APN/DNN	| TUNnel interface of UE | U-Plane # |
| --- | --- | --- | --- | --- |
| 10.45.0.0/16 | ogstun | internet | uesimtun0 | U-Plane1 |
| 10.46.0.0/16 | ogstun | internet | uesimtun0 | U-Plane1 |
| 10.55.0.0/16 | ogstun2 | internet2 | uesimtun0 | U-Plane2 |
| 10.56.0.0/16 | ogstun2 | internet2 | uesimtun0 | U-Plane2 |


<a id="changes"></a>
<h2 align="Left">5.2:  Changes in configuration files of Open5GS 5GC and UERANSIM UE / RAN </h2>

Please refer to the following for building Open5GS and UERANSIM respectively.
[Configuration](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/User-Guide/Configurations-README.md)


<a id="execution"></a>
<h1 align="Left">6. Execution </h1>

<a id="network-set">

<h3 align="Left">6.1.1 Network Settings of Open5GS 5GC C-Plane </h3>

Before starting the SMF's files, configure the network setting as mentioned below.

Add IP addresses for SMF1 and SMF2.

```
ip addr add 10.8.2.112/24 dev enp0s8
ip addr add 10.8.2.113/24 dev enp0s8
```

Similarly do it for SMF3 and SMF4
<a id="network-set-upf1">
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
<a id="network-set-up2">
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

Similarly do it for the 10.55.0.2, 10.56.0.2 if=ogstun2 
<a id="SMF-UPF">
<h2 align="Left">6.2 SMF to UPF connection Establishment. </h2>

After the configurations of the components of 5GC in Open5GS, to receive the changes in the machine we need to restart the 5GC services as mentioned below. 


In U-Plane

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
$ sudo systemctl restart open5gs-upfd

```

As multiple SMFs need to be implemented, these services are made to run separately.

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
$ sudo /bin/open5gs-smfd -c /etc/open5gs/smf1.yaml
$ sudo /bin/open5gs-smfd -c /etc/open5gs/smf2.yaml
$ sudo /bin/open5gs-smfd -c /etc/open5gs/smf3.yaml
$ sudo /bin/open5gs-smfd -c /etc/open5gs/smf4.yaml

```


After restarting the 5G components, we have depicted the working of the architecture through Wireshark traces captured at Service Based Interfaces.

<a id="smf1-up1">
<h3 align="Left">6.2.1: SMF1 to UPF1 connection Establishment. </h3>

To run the smf1 and smf2:

```
sudo /bin/open5gs-smfd -c /etc/open5gs/smf1.yaml 
sudo /bin/open5gs-smfd -c /etc/open5gs/smf2.yaml 
```

After running the above commands you will establish a PFCP connection as shown in the image below.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/PFCP%20association%20between%20SMF1_2and%20UPF1_2.png)

The wireshark traces of PFCP association between SMF1 and UPF1

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/WT-between-SMF1-n-UPF1.png)

The MSC of PFCP association between SMF1 and UPF1

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/MSC-between-SMF1-n-UPF1.png)

<a id="smf2-up2">
<h3 align="Left">6.2.2 SMF2 to UPF2 connection Establishment. </h3>

Similarly, initialization of the UPF in U-Plane2. The following commands can be performed by
running and stopping the required as mentioned above


So the wireshark traces of PFCP association between SMF2 and UPF2 is given below

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/WT-between-SMF2-n-UPF2.png)

The MSC of PFCP association between SMF2 and UPF2

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Open5gs/MSC-between-SMF2-n-UPF2.png)

Similarly, you will do the same process for the PFCP association between the SMF3 and UPF1 

Similarly, you will do the same process for the PFCP association between the SMF4 and UPF2


```
sudo /bin/open5gs-smfd -c /etc/open5gs/smf3.yaml 
sudo /bin/open5gs-smfd -c /etc/open5gs/smf4.yaml 
```
<a id="Run-ran">
<h2 align="Left">6.3 Running UERAN </h2>
<h3 align="Left">6.3.1: NG Setup between gNB1 to AMF </h3>

Once the 5GC is up and running, initialization of the gNB1 & UE1 can be performed by the following
commands in the UERANSIM/build directory respectively.

To run gnb - `sudo build/nr-gnb -c config/open5gs-gnb1.yaml`

To ensure the successful connection between 5GC and gnb, we need to receive `NG connection successful` in the same terminal.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM/NG%20Connection%20setup%20between%20gnb1_amf.png)


The below figure represents the Wireshark traces which is generated after the successful start of UERANSIM gNB, between gnb1 and AMF

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM/gnb1.png)


To run the first ue, UE1 - `sudo ./build/nr-ue -c config/open5gs-ue1.yaml`

The successful initialization of UE can be verified by receiving the `PDU Session Establishment successful` with TUNnel interface[uesimtun0,10.45.0.4] in the same terminal. 

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM/PDU%20session%20successfully%20established%D1%8Ffor%D1%8FUE1.png)


The NGAP traces has the NG set up a request and response to initialize a gNB and PDU association request and response for initializing the UE1

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/U_plane1/PDU-session.png)

<a id="ng-setup">
<h3 align="Left">6.3.2: NG Setup between gNB2 to AMF </h3>

Similarly in UE2 and gnB2 follow the command to run them.
initialization of the gNB2 & UE2 can be performed by the following
commands in the UERANSIM/build directory respectively.

To run gnb - `sudo build/nr-gnb -c config/open5gs-gnb2.yaml`

To ensure the successful connection between 5GC and gnb, we need to receive `NG connection successful` in the same terminal.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM/NG%20Connection%20setup%20between%20gnb2_amf.png)

The below figure represents the Wireshark traces which is generated after the successful start of UERANSIM gNB, between gnb and AMF

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM/gnb1.png)


To run the first ue, UE2 - `sudo ./build/nr-ue -c config/open5gs-ue2.yaml`

The successful initialization of UE can be verified by receiving the `PDU Session Establishment successful` with TUNnel interface[uesimtun0,10.46.0.2] in the same terminal. 

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM/PDU%20session%20successfully%20established%D1%8Ffor%D1%8FUE2.png)

The NGAP traces has the NG set up a request and response to initialize a gNB and PDU association request and response for initializing the UE1

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/U_plane2/PDU-session.png)


Similarly, other UEs (UE3, UE4) can be realized.

<a id="data">
<h2 align="Left">6.4 Accessing Data Networks. </h2>
<h3 align="Left">6.4.1: Testing the network using UE1</h3>
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

<a id="data2">
<h3 align="Left">6.4.2: Testing the network using UE2 via</h3>
To ping google.com
Open a new terminal

`./nr-binder 10.45.0.4 ping google.com`

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE2.png)

Wireshark traces are shown in the image below.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE2-wireshark.png)

MSC diagram is shown below.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/Ping%20Google%20server%20from%20UE2-msc.png)


Confirm by using tcpdump that the packet goes through if=ogstun on U-Plane2.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/U_plane2/UE2_UPLANE2_TCPDUMP.png)

<a id="slice">
<h1 align="Left">7. Network Slicing. </h1>

This section Includes all the network slicing that was performed.

<h2 align="Left">7.1: Next Cloud. </h2>

The NextCloud File Hosting server has been implemented on a Ip subnet 10.8.2.15 in the User Plane 2. The users who are connected to the 5G Core via ‘internet’ DNN will be able to access the NextCloud server by with pinging to the server Ip. 

<a id="slice1">
<h3 align="Left">7.1.1: Creation on Users in Next Cloud (Server)</h3>

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

<h3 align="Left">7.1.2: File Sharing from UE1(SST:1, SD:1) to UE2(SST:1, SD:2) </h3>

The below figure shows the file is selected to transfer to User2. 

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/pic_nextcloud_user1(user1).png)

The below picture show that the file is transfered to User2 via Next Cloud server.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/nextcloud_file_from_user1.png)



The wireshark traces are captured at UE1. This traces show that the UE2 is connected to Next cloud Server.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/WS-FileTransfer-UE1.png)

Similarly the wireshark traces are captured at UE2. This traces show that the UE2 is connected to Next cloud Server.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/WS-FileTransfer-UE2.png)

<a id="slice2">
<h2 align="Left">7.2 Connecting to a Website. </h2>

<a id="conclusion">
<h2 align="Left">8. Conclusion </h2>

In conclusion, the implementation and testing of the 5G core network utilizing UERANSIM have demonstrated the feasibility and efficacy of slicing in catering to diverse user requirements. By assigning different slices to individual UE devices, the network effectively allocated resources and prioritized traffic for file transfer and website access. The project highlights the potential of slicing in enhancing network efficiency, scalability, and flexibility in 5G deployments. Moving forward, further optimization and refinement of slicing strategies can contribute to the seamless integration of diverse services and applications in future 5G networks.

<a id="refer">
<h2 align="Left">9. References </h2>

