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
