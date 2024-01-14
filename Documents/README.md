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

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Virtual%20box.png)

<h3 align="Left">Creation of two Virtual machines for both 5Gcore and UERANSIM  </h3>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/twoVMs.png)

<h3 align="Left">Go to Network settings in virtual box to enable Adapters 1 and 2 </h3>
<h4 align="Left">Adapter 1:</h4>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Adapter1%20settings.png)

<h4 align="Left">Adapter 2: </h4>

![image](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/Adapter2%20settings.png)

<h2 align="Left">2. Installing MongoDB and Open5GS</h2>

<h3 align="Left">Getting MongoDB: </h3>

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

```
#easy way to install Open5GS in ubuntu
$ sudo add-apt-repository ppa:open5gs/latest
$ sudo apt update
$ sudo apt install open5gs
```

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
