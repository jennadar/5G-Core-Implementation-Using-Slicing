<!-- PROJECT LOGO -->
<img src="Figures/FRA-UAS_Logo_rgb.jpg" width="150"/>

<h1 align="center">Team Gen5 Designers</h1>
<p align="center">
    <strong>Master of Engineering</strong>
    <br>
    Information Technology
    <br>
    Nastayeen Abdul Majid(1427970)
    Shiva Kumar Biru(1436929)
    Jenny Nadar(1427226)
    Sriram Karunanithi(1438891)
</p>
<br/>

<h2 align="Left">5G Network Architecture </h2>
This Guide includes all steps required to put the configured emulation into operation.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UERANSIM&5G-core.png)
<h3 align="Left">Contents/Steps: </h3>
<h4 align="Left">1. VirtualBox Installation </h4>
<h4 align="Left">2. Network Settings to SSH </h4>
<h4 align="Left">3. How to install and SSH into the server </h4>
<h4 align="Left">4. Install Open5GS Core and Configuration </h4>
<h4 align="Left">5. Install WebUI </h4>
<h4 align="Left">6. Setting up UERANSIM </h4>
<h4 align="Left">7. Adding the Subscriber </h4>
<h4 align="Left">8. Running the UE Simulator </h4>
<h4 align="Left">9. Test 5G Network </h4>
<h4 align="Left">10. Wireshark Installation </h4>
<h4 align="Left">11. Troubleshooting </h4>
<h4 align="Left">12. Public Website Source </h4>

<h2 align="Left">1. Installation of Virtual Box</h2>

Download VirtualBox: Visit the official VirtualBox website (https://www.virtualbox.org/) and download the latest version of VirtualBox for your operating system (Windows, macOS, Linux).
Install VirtualBox: Run the installer and follow the on-screen instructions to install VirtualBox on your computer.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Virtual%20box.png)

<h3 align="Left">Creation of two Virtual machines for both 5Gcore and UERANSIM  </h3>

Open VirtualBox: Launch the VirtualBox application on your computer.
Click "New": In the VirtualBox main window, click on the "New" button to create a new virtual machine.
Set Name and Type: Provide a name for your virtual machine (e.g., 5Gcore_VM), select the type (Linux), and choose the version that matches your operating system.
Allocate Memory: Specify the amount of RAM for the virtual machine. For 5G core and UERANSIM, allocate sufficient memory based on your system requirements.
Create a Virtual Hard Disk: Create a virtual hard disk and choose the size. Allocate enough space for the operating system and applications.
Click "Create" and "Create" again to confirm.
Repeat the process to create another virtual machine for UERANSIM.

<h3 align="Left"> Install Operating Systems</h3>

Start the Virtual Machines: Select the virtual machines you created and click "Start" to power them on.
Install Operating System: Follow the on-screen instructions to install the operating system on each virtual machine. This could involve mounting an ISO file with the installation media and going through the installation process.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/twoVMs.png)

<h3 align="Left">Go to Network settings in virtual box to enable Adapters 1 and 2 </h3>

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

<h2 align="Left">2. Installing MongoDB and Open5GS</h2>

<h3 align="Left">Getting MongoDB: </h3>
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

<h3 align="Left">Next, we installed Open5GS in our Ubuntu.</h3>
Installing Open5GS on Ubuntu involves several steps, including installing dependencies, compiling the source code, and configuring the system. Below is a general guide to help installing Open5GS:

```
#easy way to install Open5GS in ubuntu
$ sudo add-apt-repository ppa:open5gs/latest
$ sudo apt update
$ sudo apt install open5gs
```
Ensure that the Open5GS components are running without errors. Check the terminal outputs for any error messages.

<h2 align="Left">3. Installation of WebUI of Open5GS</h2>

<h4 align="Left">Node.js is mandatory for installing WebUI of Open5GS </h4>

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


<h2 align="Left">4. Installation of UERANSIM</h2>

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

### UERANSIM

### Configuring & Starting the gNodeB


Although we won't be putting anything "on air" in the RF context, we still need to set up and initiate our gNodeB. The configuration for our gNodeB is contained in the "config/open5gs-gnb.yaml" file.

Within this file, we must specify the parameters for our simulated gNodeB. For our case, assuming no alterations to the PLMN (Public Land Mobile Network), the primary adjustments involve configuring the Link IPs to which the gNodeB binds and specifying the IP address of the AMFs. In my situation, the AMF's IP is set to 10.0.2.5.

![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/gnb_yamlfile.png)


Also, Edit the open5gs-ue.yaml file and modify gnbsearchList ip ( for me it is: 10.0.2.5 )


![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/ue_yaml_file.png)

We’ll start the gNodeB service from the UERANSIM directory by running the nr-gnb service with the config file in config/open5gs-gnb.yaml

```bash
$ build/nr-gnb -c config/open5gs-gnb.yaml
```

we will get the output as 

![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/ngsetup.png)

### Adding the Subscriber in WebUI

 we’ll browse to the web interface for Open5GS HSS/UDR and add a subscribe

 Open the browser and enter the URL 127.0.0.1:9999

 We’ll enter the IMSI, K key and OP key (make sure you’ve selected OPc and not OP), and save. You may notice the values match the defaults in the Open5GS Web UI, just without the spaces.

 ### Running the UE Simulator

open up a new terminal to start the UE with:


```bash
$ sudo ./build/nr-ue -c config/open5gs-ue.yaml
```
The output is :

![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/PDU.png)




<h2 align="Left">5. Configuration and Initiation of gNodeB </h2>
<h3 align="Left">Wireshark traces for NGAP Request</h3>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/WS_ngap_request.png)

<h3 align="Left">Wireshark traces for NGAP Response</h3>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/WS_ngap_response.png)

<h3 align="Left">Flow diagram for NGAP request and response in Wireshark </h3>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/WS%20FLOW.png)


## Configuring Multiple UE's with one gNB
<h3 align="Left"> Configuring multiple UE </h3>

Create the copy of open5gs-ue.yaml as `open5gs-ue1.yaml` and open5gs-ue2.yaml. 

![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UE1.png)

To create an UE1, you need to change the `supi number` to a unique number as shown in the figure above. 
Each EU should have a different supi number. Simalarly create the copy of open5gs-ue.yaml as `open5gs-ue2.yaml` and change the supi number for UE2. 

![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/UE2.png)

After changing the supi number for each EU. We’ll start the gNodeB service from the UERANSIM directory by running the nr-gnb service with the config file in config/open5gs-gnb.yaml

```bash
$ build/nr-gnb -c config/open5gs-gnb.yaml
```

Build this for UE1 and UE2 respectively.

<h3 align="Left"> Multiple subscribers added to WebUI </h3>

In order to add subscribers to the WebUI. Open the application on the webpage and add the `imsi number` of each EU. 

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/webui_3_subscribers.png)

<h3 align="Left"> Subscriber 1 details </h3>

The details of the Subscriber 1 are shown below:

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Subscriber%201%20details.png)

<h3 align="Left"> Subscriber 2 details </h3>

The details of the Subscriber 2 are shown below:

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Subscriber%202%20details.png)

<h3 align="Left"> Subscriber 3 details </h3>

The details of the Subscriber 3 are shown below:

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Subscriber%203%20details.png)

The session between multiple UEs (UE1,UE2 and UE3) and gNB is established successfully here.
 
![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/3UE's.png)