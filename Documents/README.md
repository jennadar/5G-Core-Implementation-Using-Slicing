<!-- PROJECT LOGO -->
<img src="resources/images/FRA-UAS_Logo_rgb.jpg" width="150"/>

<h1 align="center">Team Gen5 Designers</h1>
<p align="center">
    <strong>Description</strong>
    <br>
    Comment
    <br>
    Nastayeen Abdul Majid(1427970)
    Shiva Kumar Biru(1436929)
    Jenny Nadar(1427226)
    Sriram Karunanithi(1438891)
</p>
<br/>

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
nstalling Open5GS on Ubuntu involves several steps, including installing dependencies, compiling the source code, and configuring the system. Below is a general guide to help installing Open5GS:

```
#easy way to install Open5GS in ubuntu
$ sudo add-apt-repository ppa:open5gs/latest
$ sudo apt update
$ sudo apt install open5gs
```
Ensure that the Open5GS components are running without errors. Check the terminal outputs for any error messages.

<h2 align="Left">3. Installation of WebUI of Open5GS</h2>

<h4 align="Left">Node.js is mandatory for installing WebUI of Open5GS </h4>

```
#Installing Node.js
$ sudo apt update
$ sudo apt install curl
$ curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
$ sudo apt install nodejs
```

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
