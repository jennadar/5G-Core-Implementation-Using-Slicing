<h1 align="Center"> Installation Process Guide</h1>

<h2 align="Left">1 Installation of Virtual Box</h2>

Download VirtualBox: Visit the official VirtualBox website (https://www.virtualbox.org/) and download the latest version of VirtualBox for your operating system (Windows, macOS, Linux).
Install VirtualBox: Run the installer and follow the on-screen instructions to install VirtualBox on your computer.

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/Virtual%20box.png)

<h3 align="Left">Step 1: Creation of Virtual machines for both 5Gcore and UERANSIM  </h3>

- Open VirtualBox: Launch the VirtualBox application on your computer.
- Click "New": In the VirtualBox main window, click on the "New" button to create a new virtual machine.
- Set Name and Type: Provide a name for your virtual machine (e.g., mobile computing), select the type (Linux), and choose the version that matches your operating system.
- Allocate Memory: Specify the amount of RAM for the virtual machine. For 5G core and UERANSIM, allocate sufficient memory based on your system requirements.
- Create a Virtual Hard Disk: Create a virtual hard disk and choose the size.Allocate enough space for the operating system and applications.
- Click "Create" and "Create" again to confirm.
- Repeat the process to create another virtual machine for UERANSIM.

<h3 align="Left">Step 2: Install Operating Systems</h3>

- Start the Virtual Machines: Select the virtual machines you created and click "Start" to power them on.
- Install Operating System: Follow the on-screen instructions to install the operating system on each virtual machine. This could involve mounting an ISO file with the installation media and going through the installation process.


<h3 align="Left">Step 3: Go to Network settings in virtual box to enable Adapters 1 and 2 </h3>

- Select a Virtual Machine: Choose one of the virtual machines (e.g., 5Gcore_VM) and go to the "Settings."
- Navigate to "Network": In the VM settings, go to the "Network" tab.
- Enable Adapter 1: Check the "Enable Network Adapter" box. Choose "Nat Network" from the drop-down menu. This will allow the VM to connect to the physical network.
- Enable Adapter 2: Click on "Adapter 2" and check the "Enable Network Adapter" box. Choose "Host-Only Adapter" from the drop-down menu. This creates a private network between the two virtual machines.
- Apply and Save: Click "OK" to apply the changes and save the settings.
- Repeat the process for the UERANSIM virtual machine.

<h4 align="Left">Adapter 1:</h4>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/Adapter1%20settings.png)

<h4 align="Left">Adapter 2: </h4>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/Adapter2%20settings.png)

<h3 align="Left">Step 4: Changes for creating a static IP for each VM </h3>
Navigate to `\etc\netplan` directory in Ubuntu. Now you have to make changes to both the files.

Changes to make in `01-netcfg.yaml` 

```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: yes

```

Changes to make in `01-network-manager-all.yaml`

```
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      addresses:
        -  10.8.2.2/24
      nameservers:
        addresses: [10.8.2.2,1.1.1.1]
      routes:
        - to: default
          via: 10.8.2.1
```

<h2 align="Left">2 Installation of Wireshark</h2>

- To download Wireshark, visit the [Wireshark official website](https://www.wireshark.org) and navigate to the download section. 
- Choose the version compatible with your operating system and initiate the download. 
- Once the download is complete, run the installer and follow the on-screen instructions to install Wireshark. 
- Customize the installation settings as needed. 
- After installation, launch Wireshark from the desktop shortcut or applications menu. Optionally, explore additional tools like TShark or Wireshark Portable for advanced functionality.

- Open Terminal Add the Wireshark stable official PPA:

  ```
  sudo add-apt-repository ppa:wireshark-dev/stable
  ```

- Update the repository:

  ```
  sudo apt update
  ```

- Install Wireshark:-

  ```
  sudo apt install wireshark
  ```
- After Installation, Execute the command below so that non-root users can also capture the live packets.
  ```
  sudo chmod +x /usr/bin/dumpcap
  ```

---

<h2 align="Left">3 Installing MongoDB and Open5GS</h2>

<h3 align="Left">Step 1: Getting MongoDB: </h3>
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

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/mongodb.png)

<h3 align="Left">Step 2: Installation of Open5GS in our Ubuntu on VM.</h3>
Installing Open5GS on Ubuntu involves several steps, including installing dependencies, compiling the source code, and configuring the system. Below is a general guide to help installing Open5GS:

```
#easy way to install Open5GS in ubuntu
$ sudo add-apt-repository ppa:open5gs/latest
$ sudo apt update
$ sudo apt install open5gs
```
Ensure that the Open5GS components are running without errors. Check the terminal outputs for any error messages.

<h2 align="Left">4. Installation of WebUI of Open5GS</h2>

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

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/webUI.png)


<h2 align="Left">5. Installation of UERANSIM</h2>

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
![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Installations/UERANSIM_build.png)
And that's it. After successfully compiling the project, output binaries will be copied to ~/UERANSIM/build folder. And you should see the following files:

nr-gnb       | Main executable for 5G gNB (RAN)

nr-ue        | Main executable for 5G UE

nr-cli       | CLI tool for 5G gNB and UE

nr-binder    | A tool for utilizing UE's internet connectivity.

libdevbnd.so | A dynamic library for nr-binder

Run `nr-gnb` and `nr-ue` to start using UE and gNB. 

---

<h2 align="Left">6. Installation of Next Cloud</h2>


Nextcloud has been set up on the Virtual Machine 5 to enable seamless file sharing among users. Moreover, the Firefox browser has been configured within the Virtual Machine 5 to manage both admin and user profiles on the Nextcloud server. Access to the admin interface of the Nextcloud server is available through the following URL: https://10.8.2.15/nextcloud/, where the IP address 10.8.2.15 corresponds to VM 5 hosting the Nextcloud server installation. Upon admin registration in Nextcloud, two user profiles are created to facilitate file sharing services. These profiles are designated for usage by two distinct User Equipments and are linked with slice identifiers SST1, SD1, and SST1, SD2.

Linux command to install NextCloud: 

```
git clone https://github.com/RedxLus/Nextcloud-Script.git 

cd Nextcloud-Script 

sudo bash Nextcloud-Script/Nextcloud-Script.sh
``` 

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/DataNetwork/nextcloud/nextcloud.png)
