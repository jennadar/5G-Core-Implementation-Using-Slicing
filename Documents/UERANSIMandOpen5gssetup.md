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


