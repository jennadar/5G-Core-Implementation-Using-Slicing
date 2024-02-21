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
