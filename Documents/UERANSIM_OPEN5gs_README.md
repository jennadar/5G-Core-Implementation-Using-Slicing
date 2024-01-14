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


bash
$ sudo ./build/nr-ue -c config/open5gs-ue.yaml

The output is :

![Diagram](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/PDU.png)




