<!-- PROJECT LOGO -->
<img src="Figures/FRA-UAS_Logo_rgb.jpg" width="150"/>
![alt text](https://github.com/FRA-UAS/mobcomwise23-24-team_gen5_designers/blob/main/Figures/FRA-UAS_Logo_rgb.jpg)

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

## Contents

*   [Introduction](#what-is-this)
*   [Requirements and Planning](#when-should-i-use-this)
*   [Realization and Analysis](#getting-started)
    *   [Requirements](#requirements)
    *   [Install](#install)
    *   [Usage](#usage)
*   [Don't forget anything](#dont-forget-anything)
    * [Used Technologies](#used-technologies)
    * [Testing](#testing)
    * [Logging](#logging)
*   [Contribute](#contribute)
*   [License](#license)
*   [Sources](#sources)
*   [Conclusion](#conclusion)

## Overview and Changes in configuration files of Open5GS 5GC C-Plane
The Basic Control Plane consists of AMF, NSSF, NRF, UDM, PCF, NEF, AUSF, SMF and each of them perform their respective tasks. Here in our architecture we have small changes where SMF is more than one. We have four SMFs and each with dedicated APN/DNN.
Starting with AMF configuration changes.
Note : Only the changes are mentioned here

- `amf.yaml`
~~~
- amf:
  sbi:
    server:
      - address: 127.0.0.5
        port: 7777
    client:
#      nrf:
#        - uri: http://127.0.0.10:7777
      scp:
        - uri: http://127.0.0.200:7777
  ngap:
    server:
      - address: 10.8.2.8
  metrics:
    server:
      - address: 127.0.0.5
        port: 9090
  guami:
    - plmn_id:
        mcc: 999
        mnc: 70
      amf_id:
        region: 2
        set: 1
  tai:
    - plmn_id:
        mcc: 999
        mnc: 70
      tac: 1
  plmn_support:
    - plmn_id:
        mcc: 999
        mnc: 70
      s_nssai:
        - sst: 1
          sd: 000001
        - sst: 1
          sd: 000002
        - sst: 2
          sd: 000001
        - sst: 2
          sd: 000002
~~~          
- `nssf.yaml`
~~~
  nssf:
  sbi:
    server:
      - address: 127.0.0.14
        port: 7777
    client:
#      nrf:
#        - uri: http://127.0.0.10:7777
      scp:
        - uri: http://127.0.0.200:7777
      nsi:
        - uri: http://127.0.0.10:7777
        - addr: 127.0.0.10
          port: 7777
          s_nssai:
            sst: 1
            sd: 000001
        - addr: 127.0.0.10
          port: 7777
          s_nssai:
            sst: 1
            sd: 000002
        - addr: 127.0.0.10
          port: 7777
          s_nssai:
            sst: 2
            sd: 000001
        - addr: 127.0.0.10
          port: 7777
          s_nssai:
            sst: 2
            sd: 000002
~~~

## Changes in configuration of multiple SMFs
As mentioned we have multiple SMFs, in order to achieve the SMF concept, we have initialized IP subnets for each SMF respectively mentioned as below:
(We need to update the table)
| SMFs  | freeDiameter | IP Address | SST | SD | APN |
| --- | ---| --- | --- | --- | --- |
| SMF1 | smf1.conf | 10.8.2.112 | 1 | 1 | Internet |
| SMF2 | smf2.conf | 10.8.2.113 | 1 | 2 | Internet2 |
| SMF3 |  smf3.conf | 10.8.2.114 | 2 | 1 | voip |
| SMF4 | smf4.conf | 10.8.2.115 | 2 | 2 | 2voip2 |

- `smf1.yaml`
~~~
  smf:
  sbi:
    server:
      - address: 127.0.0.4
        port: 7777
    client:
      scp:
        - uri: http://127.0.0.200:7777
  pfcp:
    server:
      - address: 10.8.2.112
        dnn: internet
    client:
      upf:
        - address: 10.8.2.7
          dnn: internet
  gtpc:
    server:
      - address: 127.0.0.4
  gtpu:
    server:
      - address: 10.8.2.112
  metrics:
    server:
      - address: 127.0.0.4
        port: 9090
  session:
    - subnet: 10.45.0.1/16
    - dnn: internet

  dns:
    - 8.8.8.8
    - 8.8.4.4
    - 2001:4860:4860::8888
    - 2001:4860:4860::8844
  mtu: 1400
  freeDiameter: /etc/freeDiameter/smf1.conf
  info:
    - s_nssai:
        - sst: 1
          sd: 000001
          dnn:
            - internet
      tai:
        - plmn_id:
            mcc: 999
            mnc: 70
          tac: 1
~~~          
- `smf2.yaml`
~~~
  smf:
  sbi:
    server:
      - address: 127.0.0.24
        port: 7777
    client:
      scp:
        - uri: http://127.0.0.200:7777
  pfcp:
    server:
      - address: 10.8.2.113
        dnn: internet2
    client:
      upf:
        - address: 10.8.2.15
  gtpc:
    server:
      - address: 127.0.0.24
  gtpu:
    server:
      - address: 10.8.2.113
  metrics:
    server:
      - address: 127.0.0.24
        port: 9090
  session:
    - subnet: 10.46.0.1/16
    - dnn: internet
      dev: ogstun

  dns:
    - 8.8.8.8
    - 8.8.4.4
    - 2001:4860:4860::8888
    - 2001:4860:4860::8844
  mtu: 1400
  freeDiameter: /etc/freeDiameter/smf2.conf
  info:
    - s_nssai:
        - sst: 1
          sd: 000002
          dnn: internet
      tai:
        - plmn_id:
            mcc: 999
            mnc: 70
          tac: 1
~~~          
- `smf3.yaml`
~~~  
  smf:
  sbi:
    server:
      - address: 127.0.0.25
        port: 7777
    client:
      scp:
        - uri: http://127.0.0.200:7777
  pfcp:
    server:
      - address: 10.8.2.114
        dnn: voip
    client:
      upf:
        - address: 10.8.2.7
          dnn: voip
  gtpc:
    server:
      - address: 127.0.0.25
  gtpu:
    server:
      - address: 10.8.2.114
  metrics:
    server:
      - address: 127.0.0.25
        port: 9090
  session:
    - subnet: 10.55.0.1/16
    - dnn: voip

  dns:
    - 8.8.8.8
    - 8.8.4.4
    - 2001:4860:4860::8888
    - 2001:4860:4860::8844
  mtu: 1400
  freeDiameter: /etc/freeDiameter/smf3.conf
  info:
    - s_nssai:
        - sst: 2
          sd: 000001
          dnn:
            - voip
      tai:
        - plmn_id:
            mcc: 999
            mnc: 70
          tac: 1
~~~          
- `smf4.yaml`
  ~~~
  smf:
  sbi:
    server:
      - address: 127.0.0.26
        port: 7777
    client:
      scp:
        - uri: http://127.0.0.200:7777
  pfcp:
    server:
      - address: 10.8.2.115
        dnn: voip2
    client:
      upf:
        - address: 10.8.2.15
  gtpc:
    server:
      - address: 127.0.0.26
  gtpu:
    server:
      - address: 10.8.2.115
  metrics:
    server:
      - address: 127.0.0.26
        port: 9090
  session:
    - subnet: 10.56.0.1/16
    - dnn: voip2
      dev: ogstun2

  dns:
    - 8.8.8.8
    - 8.8.4.4
    - 2001:4860:4860::8888
    - 2001:4860:4860::8844
  mtu: 1400
  freeDiameter: /etc/freeDiameter/smf4.conf
  info:
    - s_nssai:
        - sst: 2
          sd: 000002
          dnn: voip
      tai:
        - plmn_id:
            mcc: 999
            mnc: 70
          tac: 1
~~~
## Overview and Changes in configuration files of Open5GS 5GC U-Plane1
- `upf1.yaml`

~~~
    upf:
      pfcp:
        server:
          - address: 10.8.2.7
      gtpu:
        server:
          - address: 10.8.2.7
    
      session:
        - subnet: 10.45.0.1/16
          dnn: internet
          dev: ogstun
        - subnet: 10.55.0.1/16
          dnn: voip
          dev: ogstun2
      metrics:
        server:
          - address: 127.0.0.7
            port: 9090
~~~

## Overview and Changes in configuration files of Open5GS 5GC U-Plane2
- `upf2.yaml`
~~~
    upf:
      pfcp:
        server:
          - address: 10.8.2.15
      gtpu:
        server:
          - address: 10.8.2.15
      session:
        - subnet: 10.46.0.1/16
          dnn: internet
          dev: ogstun
        - subnet: 10.56.0.1/16
          dnn: voip
          dev: ogstun2
      metrics:
        server:
          - address: 127.0.0.7
            port: 9090
~~~

## Overview and Changes in configuration files of UERANSIM UE/RAN

- `Changes in configuration files of RAN (gNB-1)`

~~~
    mcc: '999'          # Mobile Country Code value
    mnc: '70'           # Mobile Network Code value (2 or 3 digits)

    nci: '0x000000010'  # NR Cell Identity (36-bit)
    idLength: 32        # NR gNB ID length in bits [22...32]
    tac: 1              # Tracking Area Code

    linkIp: 10.8.2.2   # gNB's local IP address for Radio Link Simulation (Usually same with local IP)
    ngapIp: 10.8.2.2   # gNB's local IP address for N2 Interface (Usually same with local IP)
    gtpIp: 10.8.2.2    # gNB's local IP address for N3 Interface (Usually same with local IP)

    List of AMF address information
    amfConfigs:
      - address: 10.8.2.8
        port: 38412

    List of supported S-NSSAIs by this gNB
    slices:
      - sst: 1
        sd: 0x000001
      - sst: 2
        sd: 0x000001

        Indicates whether or not SCTP stream number errors should be ignored.
        ignoreStreamIds: true
~~~

- `Changes in configuration files of RAN (gNB-2)´

~~~
    mcc: '999'          # Mobile Country Code value
    mnc: '70'           # Mobile Network Code value (2 or 3 digits)

    nci: '0x000000010'  # NR Cell Identity (36-bit)
    idLength: 32        # NR gNB ID length in bits [22...32]
    tac: 1              # Tracking Area Code

    linkIp: 10.8.2.14   # gNB's local IP address for Radio Link Simulation (Usually same with local IP)
    ngapIp: 10.8.2.14   # gNB's local IP address for N2 Interface (Usually same with local IP)
    gtpIp: 10.8.2.14   # gNB's local IP address for N3 Interface (Usually same with local IP)

     List of AMF address information
    amfConfigs:
      - address: 10.8.2.8
        port: 38412

     List of supported S-NSSAIs by this gNB
    slices:

      - sst: 1
        sd: 0x000002
      - sst: 2
        sd: 0x000002

    Indicates whether or not SCTP stream number errors should be ignored.
    ignoreStreamIds: true
~~~

## Changes in configuration files of UE1 (IMSI-999700000000001)
~~~
    # IMSI number of the UE. IMSI = [MCC|MNC|MSISDN] (In total 15 digits)
    supi: 'imsi-999700000000001'
    # Mobile Country Code value of HPLMN
    mcc: '999'
    # Mobile Network Code value of HPLMN (2 or 3 digits)
    mnc: '70'
    # SUCI Protection Scheme : 0 for Null-scheme, 1 for Profile A and 2 for Profile B
    protectionScheme: 0
    # Home Network Public Key for protecting with SUCI Profile A
    homeNetworkPublicKey: '5a8d38864820197c3394b92613b20b91633cbd897119273bf8e4a6f4eec0a650'
    # Home Network Public Key ID for protecting with SUCI Profile A
    homeNetworkPublicKeyId: 1
    # Routing Indicator
    routingIndicator: '0000'

    # Permanent subscription key
    key: '465B5CE8B199B49FAA5F0A2EE238A6BC'
    # Operator code (OP or OPC) of the UE
    op: 'E8ED289DEBA952E4283B54E88E6183CA'
    # This value specifies the OP type and it can be either 'OP' or 'OPC'
    opType: 'OPC'
    # Authentication Management Field (AMF) value
    amf: '8000'
    # IMEI number of the device. It is used if no SUPI is provided
    imei: '356938035643803'
    # IMEISV number of the device. It is used if no SUPI and IMEI is provided
    imeiSv: '4370816125816151'

    # List of gNB IP addresses for Radio Link Simulation
    gnbSearchList:
      - 10.8.2.2

    # UAC Access Identities Configuration
    uacAic:
      mps: false
      mcs: false

    # UAC Access Control Class
    uacAcc:
      normalClass: 0
      class11: false
      class12: false
      class13: false
      class14: false
      class15: false

    # Initial PDU sessions to be established
    sessions:
      - type: 'IPv4'
        apn: 'internet'
        slice:
          sst: 1
          sd: 0x000001

    # Configured NSSAI for this UE by HPLMN
    configured-nssai:
      - sst: 1
        sd: 0x000001

    # Default Configured NSSAI for this UE
    default-nssai:
      - sst: 1
        sd: 0x000001
    
    # Supported integrity algorithms by this UE
    integrity:
      IA1: true
      IA2: true
      IA3: true
    
    # Supported encryption algorithms by this UE
    ciphering:
      EA1: true
      EA2: true
      EA3: true
    
    # Integrity protection maximum data rate for user plane
    integrityMaxRate:
      uplink: 'full'
      downlink: 'full'
~~~
## Changes in configuration files of UE2 (IMSI-999700000000003)
~~~
    # IMSI number of the UE. IMSI = [MCC|MNC|MSISDN] (In total 15 digits)
    supi: 'imsi-999700000000003'
    # Mobile Country Code value of HPLMN
    mcc: '999'
    # Mobile Network Code value of HPLMN (2 or 3 digits)
    mnc: '70'
    # SUCI Protection Scheme : 0 for Null-scheme, 1 for Profile A and 2 for Profile B
    protectionScheme: 0
    # Home Network Public Key for protecting with SUCI Profile A
    homeNetworkPublicKey: '5a8d38864820197c3394b92613b20b91633cbd897119273bf8e4a6f4eec0a650'
    # Home Network Public Key ID for protecting with SUCI Profile A
    homeNetworkPublicKeyId: 1
    # Routing Indicator
    routingIndicator: '0000'
    
    # Permanent subscription key
    key: '465B5CE8B199B49FAA5F0A2EE238A6BC'
    # Operator code (OP or OPC) of the UE
    op: 'E8ED289DEBA952E4283B54E88E6183CA'
    # This value specifies the OP type and it can be either 'OP' or 'OPC'
    opType: 'OPC'
    # Authentication Management Field (AMF) value
    amf: '8000'
    # IMEI number of the device. It is used if no SUPI is provided
    imei: '356938035643803'
    # IMEISV number of the device. It is used if no SUPI and IMEI is provided
    imeiSv: '4370816125816151'
    
    # List of gNB IP addresses for Radio Link Simulation
    gnbSearchList:
      - 10.8.2.14
    
    # UAC Access Identities Configuration
    uacAic:
      mps: false
      mcs: false
    
    # UAC Access Control Class
    uacAcc:
      normalClass: 0
      class11: false
      class12: false
      class13: false
      class14: false
      class15: false
    
    # Initial PDU sessions to be established
    sessions:
      - type: 'IPv4'
        apn: 'internet'
        slice:
          sst: 1
          sd: 0x000002
    
    # Configured NSSAI for this UE by HPLMN
    configured-nssai:
      - sst: 1
        sd: 0x000002
    
    # Default Configured NSSAI for this UE
    default-nssai:
      - sst: 1
        sd: 0x000002
    
    # Supported integrity algorithms by this UE
    integrity:
      IA1: true
      IA2: true
      IA3: true
    
    # Supported encryption algorithms by this UE
    ciphering:
      EA1: true
      EA2: true
      EA3: true
    
    # Integrity protection maximum data rate for user plane
    integrityMaxRate:
      uplink: 'full'
      downlink: 'full'
~~~

## Changes in configuration files of UE3 (IMSI-999700000000006)
~~~
    # IMSI number of the UE. IMSI = [MCC|MNC|MSISDN] (In total 15 digits)
    supi: 'imsi-999700000000006'
    # Mobile Country Code value of HPLMN
    mcc: '999'
    # Mobile Network Code value of HPLMN (2 or 3 digits)
    mnc: '70'
    # SUCI Protection Scheme : 0 for Null-scheme, 1 for Profile A and 2 for Profile B
    protectionScheme: 0
    # Home Network Public Key for protecting with SUCI Profile A
    homeNetworkPublicKey: '5a8d38864820197c3394b92613b20b91633cbd897119273bf8e4a6f4eec0a650'
    # Home Network Public Key ID for protecting with SUCI Profile A
    homeNetworkPublicKeyId: 1
    # Routing Indicator
    routingIndicator: '0000'
    
    # Permanent subscription key
    key: '465B5CE8B199B49FAA5F0A2EE238A6BC'
    # Operator code (OP or OPC) of the UE
    op: 'E8ED289DEBA952E4283B54E88E6183CA'
    # This value specifies the OP type and it can be either 'OP' or 'OPC'
    opType: 'OPC'
    # Authentication Management Field (AMF) value
    amf: '8000'
    # IMEI number of the device. It is used if no SUPI is provided
    imei: '356938035643803'
    # IMEISV number of the device. It is used if no SUPI and IMEI is provided
    imeiSv: '4370816125816151'
    
    # List of gNB IP addresses for Radio Link Simulation
    gnbSearchList:
      - 10.8.2.2
    
    # UAC Access Identities Configuration
    uacAic:
      mps: false
      mcs: false
    
    # UAC Access Control Class
    uacAcc:
      normalClass: 0
      class11: false
      class12: false
      class13: false
      class14: false
      class15: false
    
    # Initial PDU sessions to be established
    sessions:
      - type: 'IPv4'
        apn: 'voip'
        slice:
          sst: 2
          sd: 0x000001
    
    # Configured NSSAI for this UE by HPLMN
    configured-nssai:
      - sst: 2
        sd: 0x000001
    
    # Default Configured NSSAI for this UE
    default-nssai:
      - sst: 2
        sd: 0x000001
    
    # Supported integrity algorithms by this UE
    integrity:
      IA1: true
      IA2: true
      IA3: true
    
    # Supported encryption algorithms by this UE
    ciphering:
      EA1: true
      EA2: true
      EA3: true
    
    # Integrity protection maximum data rate for user plane
    integrityMaxRate:
      uplink: 'full'
      downlink: 'full'
~~~

## Changes in configuration files of UE4 (IMSI-999700000000004)
~~~
    # IMSI number of the UE. IMSI = [MCC|MNC|MSISDN] (In total 15 digits)
    supi: 'imsi-999700000000004'
    # Mobile Country Code value of HPLMN
    mcc: '999'
    # Mobile Network Code value of HPLMN (2 or 3 digits)
    mnc: '70'
    # SUCI Protection Scheme : 0 for Null-scheme, 1 for Profile A and 2 for Profile B
    protectionScheme: 0
    # Home Network Public Key for protecting with SUCI Profile A
    homeNetworkPublicKey: '5a8d38864820197c3394b92613b20b91633cbd897119273bf8e4a6f4eec0a650'
    # Home Network Public Key ID for protecting with SUCI Profile A
    homeNetworkPublicKeyId: 1
    # Routing Indicator
    routingIndicator: '0000'
    
    # Permanent subscription key
    key: '465B5CE8B199B49FAA5F0A2EE238A6BC'
    # Operator code (OP or OPC) of the UE
    op: 'E8ED289DEBA952E4283B54E88E6183CA'
    # This value specifies the OP type and it can be either 'OP' or 'OPC'
    opType: 'OPC'
    # Authentication Management Field (AMF) value
    amf: '8000'
    # IMEI number of the device. It is used if no SUPI is provided
    imei: '356938035643803'
    # IMEISV number of the device. It is used if no SUPI and IMEI is provided
    imeiSv: '4370816125816151'
    
    # List of gNB IP addresses for Radio Link Simulation
    gnbSearchList:
      - 10.8.2.14
    
    # UAC Access Identities Configuration
    uacAic:
      mps: false
      mcs: false
    
    # UAC Access Control Class
    uacAcc:
      normalClass: 0
      class11: false
      class12: false
      class13: false
      class14: false
      class15: false
    
    # Initial PDU sessions to be established
    sessions:
      - type: 'IPv4'
        apn: 'voip'
        slice:
          sst: 2
          sd: 0x000002
    
    # Configured NSSAI for this UE by HPLMN
    configured-nssai:
      - sst: 2
        sd: 0x000002
    
    # Default Configured NSSAI for this UE
    default-nssai:
      - sst: 2
        sd: 0x000002
    
    # Supported integrity algorithms by this UE
    integrity:
      IA1: true
      IA2: true
      IA3: true
    
    # Supported encryption algorithms by this UE
    ciphering:
      EA1: true
      EA2: true
      EA3: true
    
    # Integrity protection maximum data rate for user plane
    integrityMaxRate:
      uplink: 'full'
      downlink: 'full'
~~~
