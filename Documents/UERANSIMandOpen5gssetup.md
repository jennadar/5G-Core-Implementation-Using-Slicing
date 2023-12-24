## Configuring gNB (UERANSIM gNB Configuration - `open5gs-gnb.yaml`)

### Objective:
Configure the UERANSIM gNB by updating the `open5gs-gnb.yaml` file with specific IP addresses.

#### Steps:

1. **Locate Configuration File:**
   - The UERANSIM gNB configuration file (`open5gs-gnb.yaml`) is found at `UERANSIM/config/open5gs-gnb.yaml`.

2. **Open the Configuration File:**
   - Use a text editor or command-line tool to open `open5gs-gnb.yaml` for editing.

3. **Update IP Addresses for gNB Configuration:**
   - Locate and modify the following fields:
     - `linkIp`: 192.168.64.65` where UERANSIM is running . The IP address
     - `ngapIp`: 192.168.64.65.
     - `gtpIp`: 192.168.64.65.
     - `amfConfigs: address`: Set to the IP address of 192.168.64.4  where Open5GC is running.

4. **Save Changes:**
   - After updating the IP addresses, save the changes made to the `open5gs-gnb.yaml` file.

5. **Start UERANSIM gNB:**
 Command: `UERANSIM/build/nr-gnb -c UERANSIM/config/open5gs-gnb.yaml`


### Objective:
Configure the UERANSIM UE by updating the `open5gs-ue.yaml` file with the gNB server's IP address.

#### Steps:

1. **Locate Configuration File:**
   - The UERANSIM UE configuration file (`open5gs-ue.yaml`) is found at `UERANSIM/config/open5gs-ue.yaml`.

2. **Open the Configuration File:**
   - Use a text editor or command-line tool to open `open5gs-ue.yaml` for editing.

3. **Update `gnbSearchList` with gNB IP Address:**
   - Find the `gnbSearchList` section within the configuration file.
   - Add the IP address of 192.168.64.65 where the gNB is running to the list.

4. **Save Changes:**
   - After adding the gNB's IP address, save the changes made to the `open5gs-ue.yaml` file.

5. **Start UERANSIM UE:**
 
   - Command: `UERANSIM/build/nr-ue -c UERANSIM/config/open5gs-ue.yaml`
