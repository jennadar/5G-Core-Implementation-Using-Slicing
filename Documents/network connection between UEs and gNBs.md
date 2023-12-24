The network establishment between a User Equipment (UE) and a gNB (gNodeB) in a 5G network involves several procedures and signaling steps. Below is an overview of the key steps involved in this process:

1. **Initial Access:**
   - The UE initiates the network attachment process by performing initial access. This involves transmitting a Random Access Preamble to the gNB.

2. **Random Access Response:**
   - The gNB responds to the UE's Random Access Preamble with a Random Access Response. This message contains information such as the timing advance for the UE.

3. **Initial Connection Setup:**
   - The UE and gNB establish the initial connection. The UE sends an Initial Connection Setup Request, and the gNB responds with an Initial Connection Setup Complete message.

4. **Registration:**
   - The UE sends an attach request to the gNB, indicating its desire to connect to the 5G network.

5. **gNB Validation:**
   - The gNB validates the UE's identity and checks if the UE is allowed to access the network. This involves authentication and authorization procedures.

6. **Security Setup:**
   - Security procedures are initiated to establish a secure connection between the UE and the gNB. This involves key generation, encryption, and integrity protection.

7. **Radio Resource Control (RRC) Connection Establishment:**
   - The gNB allocates necessary radio resources for the UE. The RRC connection is established to manage the signaling between the UE and the gNB.

8. **Quality of Service (QoS) Setup:**
   - QoS parameters are negotiated and configured to ensure the required level of service for the UE's data sessions.

9. **Mobility Handling:**
   - The network handles mobility-related procedures to manage the UE's movement within the coverage area.

10. **Bearer Setup:**
    - The establishment of bearers for data communication is initiated. This involves the setup of default bearers and dedicated bearers based on the service requirements.

These steps collectively contribute to the establishment of a connection between the UE and the gNB in a 5G network.