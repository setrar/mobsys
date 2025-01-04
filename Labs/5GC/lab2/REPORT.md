# Lab2 Report

### Part $\color{Salmon}1$:

#### &#x1F5E3; Questions

Start wireshark on `demo-oai`.

##### $\color{Salmon}a/$ For each UE, explain why it does not attach successfully to the CN? From which message / logs (copy the text) did you figure it out? Hint: NGAP errors are related to AMF.

```
docker logs my5grantester
```
> Returns
```powershell
Now setting these variables '@DNN@ @GNBID@ @GTPU_LOCAL_ADDR@ @KEY@ @MCC@ @MNC@ @MSIN@ @NGAP_LOCAL_ADDR@ @NGAP_REMOTE_ADDR@ @OPC@ @SD@ @SST_GNB@ @SST_UE@ @TAC@'
Done setting the configuration
Running tester
time="2024-01-24T13:04:41Z" level=info msg="my5G-RANTester version 0.1"
time="2024-01-24T13:04:41Z" level=info msg=---------------------------------------
time="2024-01-24T13:04:41Z" level=info msg="[TESTER] Starting test function: Testing registration of multiple UEs"
time="2024-01-24T13:04:41Z" level=info msg="[TESTER][UE] Number of UEs: 1"
time="2024-01-24T13:04:41Z" level=info msg="[TESTER][GNB] gNodeB control interface IP/Port: 192.168.70.149/9487"
time="2024-01-24T13:04:41Z" level=info msg="[TESTER][GNB] gNodeB data interface IP/Port: 192.168.70.149/2152"
time="2024-01-24T13:04:41Z" level=info msg="[TESTER][AMF] AMF IP/Port: 192.168.70.132/38412"
time="2024-01-24T13:04:41Z" level=info msg=---------------------------------------
time="2024-01-24T13:04:41Z" level=info msg="[GNB] SCTP/NGAP service is running"
time="2024-01-24T13:04:42Z" level=info msg="[GNB] UNIX/NAS service is running"
time="2024-01-24T13:04:42Z" level=info msg="[GNB][SCTP] Receive message in 0 stream\n"
time="2024-01-24T13:04:42Z" level=info msg="[GNB][NGAP] Receive Ng Setup Failure"
time="2024-01-24T13:04:42Z" level=info msg="[GNB][NGAP] AMF is inactive"
time="2024-01-24T13:04:42Z" level=info msg="[TESTER] TESTING REGISTRATION USING IMSI 0000000001 UE"
time="2024-01-24T13:04:43Z" level=info msg="[UE] UNIX/NAS service is running"
time="2024-01-24T13:04:43Z" level=info msg="No AMF available for this UE"
```
```
docker logs oai-amf
```
> Returns
```powershell
[2024-01-24T13:04:41.978807] [AMF] [sctp   ] [debug] SCTP Association Change event received
[2024-01-24T13:04:41.978955] [AMF] [sctp   ] [debug] Add new association with id (4)
[2024-01-24T13:04:41.979148] [AMF] [sctp   ] [info ] ----------------------
[2024-01-24T13:04:41.979221] [AMF] [sctp   ] [info ] Local addresses:
[2024-01-24T13:04:41.979230] [AMF] [sctp   ] [info ]     - IPv4 Addr: 192.168.70.132
[2024-01-24T13:04:41.979248] [AMF] [sctp   ] [info ] ----------------------
[2024-01-24T13:04:41.979250] [AMF] [sctp   ] [info ] Peer addresses:
[2024-01-24T13:04:41.979252] [AMF] [sctp   ] [info ]     - IPv4 Addr: 192.168.70.149
[2024-01-24T13:04:41.979254] [AMF] [sctp   ] [info ] ----------------------
[2024-01-24T13:04:41.979257] [AMF] [ngap   ] [debug] Ready to handle new NGAP SCTP association request (id 4)
[2024-01-24T13:04:41.979260] [AMF] [ngap   ] [debug] Create a new gNB context with assoc_id (4)
[2024-01-24T13:04:42.021313] [AMF] [sctp   ] [info ] ****[Assoc_id 4, Socket 23] Received a msg (length 63) from port 9487, on stream 0, PPID 60 ****
[2024-01-24T13:04:42.021405] [AMF] [ngap   ] [debug] Handling SCTP payload from SCTP Server on assoc_id (4), stream_id (0), instreams (2), outstreams (2)
[2024-01-24T13:04:42.036994] [AMF] [ngap   ] [debug] Decoded NGAP message, procedure code 21, present 1
InitiatingMessage ::= {
    procedureCode: 21
    criticality: 0 (reject)
    value: NGSetupRequest ::= {
        protocolIEs: ProtocolIE-Container ::= {
            NGSetupRequestIEs ::= {
                id: 27
                criticality: 0 (reject)
                value: GlobalGNB-ID ::= {
                    pLMNIdentity: 02 F8 89
                    gNB-ID: 00 00 03
                }
            }
            NGSetupRequestIEs ::= {
                id: 82
                criticality: 1 (ignore)
                value: my5gRANTester
            }
            NGSetupRequestIEs ::= {
                id: 102
                criticality: 0 (reject)
                value: SupportedTAList ::= {
                    SupportedTAItem ::= {
                        tAC: 00 AB 00
                        broadcastPLMNList: BroadcastPLMNList ::= {
                            BroadcastPLMNItem ::= {
                                pLMNIdentity: 02 F8 89
                                tAISliceSupportList: SliceSupportList ::= {
                                    SliceSupportItem ::= {
                                        s-NSSAI: S-NSSAI ::= {
                                            sST: DE
                                            sD: 00 00 7B
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            NGSetupRequestIEs ::= {
                id: 21
                criticality: 1 (ignore)
                value: 2 (v128)
            }
        }
    }
}
[2024-01-24T13:04:42.037655] [AMF] [ngap   ] [debug] Sending ITTI NG Setup Request message to TASK_AMF_N2
InitiatingMessage ::= {
    procedureCode: 21
    criticality: 0 (reject)
    value: NGSetupRequest ::= {
        protocolIEs: ProtocolIE-Container ::= {
            NGSetupRequestIEs ::= {
                id: 27
                criticality: 0 (reject)
                value: GlobalGNB-ID ::= {
                    pLMNIdentity: 02 F8 89
                    gNB-ID: 00 00 03
                }
            }
            NGSetupRequestIEs ::= {
                id: 82
                criticality: 1 (ignore)
                value: my5gRANTester
            }
            NGSetupRequestIEs ::= {
                id: 102
                criticality: 0 (reject)
                value: SupportedTAList ::= {
                    SupportedTAItem ::= {
                        tAC: 00 AB 00
                        broadcastPLMNList: BroadcastPLMNList ::= {
                            BroadcastPLMNItem ::= {
                                pLMNIdentity: 02 F8 89
                                tAISliceSupportList: SliceSupportList ::= {
                                    SliceSupportItem ::= {
                                        s-NSSAI: S-NSSAI ::= {
                                            sST: DE
                                            sD: 00 00 7B
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            NGSetupRequestIEs ::= {
                id: 21
                criticality: 1 (ignore)
                value: 2 (v128)
            }
        }
    }
}
```


> Edit docker file and put wireshark data

```yaml
    oai-amf:
        container_name: "oai-amf"
        image: oai-amf:develop
        environment:
            - ...
            - PLMN_SUPPORT_MCC=208
            - PLMN_SUPPORT_MNC=98
            - PLMN_SUPPORT_TAC=0xab00
            - SST_0=222
            - SD_0=123
```


```wireshark
261	35.684532328	192.168.70.132	192.168.70.149	NGAP/NAS-5GS	302	SACK (Ack=1, Arwnd=106496) , DownlinkNASTransport, Registration reject (Illegal UE)
```

> The imsi is a concatenation of MCC, MNC, MSIN which should make 15 digits
>
```yaml
  my5grantester:
    environment:
      ...
      MCC: 208
      MNC: 98
      ...
      MSIN: "0000000001"
```

> Authentication failure

```wireshark
649	73.564820803	192.168.70.143	192.168.70.132	NGAP/NAS-5GS	126	SACK (Ack=1, Arwnd=106496) , UplinkNASTransport, Authentication failure (MAC failure)
```


> Check that the mysql db file match the docker-compose file
```yaml
  my5grantester:
    environment:
      ...
      OPC: C42449363BBAD02B66D16BC975D77CC1
      KEY: fec86ba6eb707ed08905757b1bb44b8f
```

```mysql
INSERT INTO `AuthenticationSubscription` (`ueid`, `authenticationMethod`, `encPermanentKey`, `protectionParameterId`, `sequenceNumber`, `authenticationManagementField`, `algorithmId`, `encOpcKey`, `encTopcKey`, `vectorGenerationInHss`, `n5gcAuthMethod`, `rgAuthenticationInd`, `supi`) VALUES
    ('208980000000001', '5G_AKA', 'fec86ba6eb707ed08905757b1bb44b8f', 'fec86ba6eb707ed08905757b1bb44b8f', '{\"sqn\": \"000000000000\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'C42449363BBAD02B66D16BC975D77CC1', NULL, NULL, NULL, NULL, '208980000000001');
```


##### $\color{Salmon}b/$ For each UE, what do you propose to fix the issue ? A few hints are proposed to you in the table below. Apply the fixes to the CN configuration file and connect the UEs one after one.

#### For the fourth UE, 
```yaml
  my5grantester:
    environment:
      ...
       SST_GNB: a1
       SST_UE: 161
       SD: "00009c"
```
configutation needs to be adjusted to `docker-compose-basic-nrf.yaml`

```wireshark
201	2.050365203	192.168.70.132	192.168.70.150	NGAP/NAS-5GS	438	SACK (Ack=6, Arwnd=106496) , DownlinkNASTransport, DL NAS transport, PDU session establishment reject (Requested service option not subscribed)
```

```
docker-compose --file docker-compose-basic-nrf.yaml up --detach --force-recreate
```

##### $\color{Salmon}c/$ Repeat the test by disconnecting all the UEs, reconnecting the UEs without restarting the CN. Capture the traffic using wireshark and send it with your report.

### Part $\color{Salmon}2$:

#### &#x1F5E3; Questions

##### $\color{Salmon}a/$ Compare the two files `docker-compose-slicing-nrf.yaml` and `docker-compose-basic-nrf.yaml`?

| |
|-|
| oai-nssf |
| oai_spgwu_slice[1:3] |
| oai_smf_slice[1:3] |
| oai_nrf_slice[12:3] |

Where:

oai-nssf: The "oai-nssf" likely refers to the Network Slice Selection Function (NSSF) component within the OAI project. NSSF is a critical component in 5G networks responsible for selecting the appropriate network slice for a user or service based on specific criteria, such as quality of service (QoS) requirements.

oai_spgwu_slice[1:3]: This likely refers to a part or slice of the OAI's Service and Packet Gateway (SP-GW-U) component. SP-GW-U is responsible for user plane packet forwarding. The "[1:3]" notation might indicate a subset of instances or configurations within SP-GW-U.

oai_smf_slice[1:3]: Similarly, this appears to refer to a part or slice of the Service Management Function (SMF) component within OAI. SMF is responsible for managing session and mobility for user equipment (UE) devices. "[1:3]" might denote a specific subset or configuration of SMF instances.

oai_nrf_slice[12:3]: This term likely refers to a slice of the Network Repository Function (NRF) component within OAI. NRF is responsible for storing information about network slice availability and capabilities. "[12:3]" could be specifying a range or subset of NRF instances.

##### $\color{Salmon}b/$  Complete the diagram above by adding: NF ip addresses, DNNs, Slices information. 

<img src=images/5GCore-subnetwork.png width='' height='' > </img>

Architecture: 

The above diagram has been constructed with the following information:

- docker container list: gives the name of each containers 
- docker network instpection: gives the subnetwork of the system (note: IPv6 addresses are ignored in the diagram)
- element component list 

- [ ] Docker Container list

```
docker-compose -f docker-compose-slicing-nrf.yaml ps
```
> Returns:
```powershell
NAME                COMMAND                  SERVICE             STATUS               PORTS
mysql               "docker-entrypoint.s…"   mysql               running (starting)   3306/tcp, 33060/tcp
oai-amf             "/bin/bash /openair-…"   oai_amf             running (healthy)    80/tcp, 9090/tcp, 38412/sctp
oai-ausf            "/bin/bash /openair-…"   oai_ausf            running (healthy)    80/tcp
oai-ext-dn          "/bin/bash -c ' ipta…"   oai_ext_dn          running (healthy)    
oai-nrf-slice12     "/bin/bash /openair-…"   oai_nrf_slice12     running (healthy)    80/tcp, 9090/tcp
oai-nrf-slice3      "/bin/bash /openair-…"   oai_nrf_slice3      running (healthy)    80/tcp, 9090/tcp
oai-nssf            "/bin/bash /openair-…"   oai-nssf            running              80/tcp, 8080/tcp
oai-smf-slice1      "/bin/bash /openair-…"   oai_smf_slice1      running (starting)   80/tcp, 9090/tcp, 8805/udp
oai-smf-slice2      "/bin/bash /openair-…"   oai_smf_slice2      running (starting)   80/tcp, 9090/tcp, 8805/udp
oai-smf-slice3      "/bin/bash /openair-…"   oai_smf_slice3      running (starting)   80/tcp, 9090/tcp, 8805/udp
oai-spgwu-slice1    "/bin/bash /openair-…"   oai_spgwu_slice1    running (starting)   2152/udp, 8805/udp
oai-spgwu-slice2    "/bin/bash /openair-…"   oai_spgwu_slice2    running (healthy)    2152/udp, 8805/udp
oai-spgwu-slice3    "/bin/bash /openair-…"   oai_spgwu_slice3    running (healthy)    2152/udp, 8805/udp
oai-udm             "/bin/bash /openair-…"   oai_udm             running (healthy)    80/tcp
oai-udr             "/bin/bash /openair-…"   oai_udr             running (starting)   80/tcp
```

- [ ] Docker Network Inspectiom

```
docker network inspect demo-oai-public-net
```
> Returns:
[docker-network-inspect.yaml](yaml/slice/docker-network-inspect.yaml)


- [ ] 5GC components

In the 5G Core Network (5GC), each component serves specialized functions within a service-based architecture (SBA):

1. **NSSF (Network Slice Selection Function)**: Manages network slice selection for users.
2. **AUSF (Authentication Server Function)**: Handles user authentication.
3. **UDR (Unified Data Repository)**: Central database for user and service data.
4. **UDM (Unified Data Management)**: Manages user data and authentication credentials.
5. **AMF (Access and Mobility Management Function)**: Oversees user access and mobility.
6. **NRF (Network Repository Function)**: Central registry for network functions' discovery.
7. **SMF (Session Management Function)**: Manages user data sessions.
8. **UPF (User Plane Function)**: Processes and forwards user data packets.
9. **DN (Data Network)**: External networks accessed by users through the 5GC.

These components interact to support network slicing, mobility, session management, and access to external networks, ensuring flexible and efficient service delivery in 5G networks.

- [ ] DNN (Data Network Names) 

DNN identifies a specific data network that a user's equipment (UE) can connect to via the 5G core network. Only `test` DNN was used by the UEs. See the UEs yaml environment variables

##### $\color{Salmon}c/$ What is the role of NSSF function?

The NSSF stands for Network Slice Selection Function in the context of 5G networks. It plays a pivotal role in the network slicing mechanism, which is a key feature of 5G technology. Network slicing enables the creation of multiple virtual networks (slices) on a shared physical infrastructure, where each slice is tailored to meet different service requirements.

Here are the primary functions of the NSSF:

1. **Slice Selection**:
   - Determines the appropriate network slice(s) for incoming user equipment (UE) based on the UE's subscription profile, requested service, or other context information.
   - Assists in steering the UE to the right slice based on policy rules, operator configurations, or dynamic network conditions.

2. **Slice Information Management**:
   - Maintains information about the available network slices and their properties.
   - Provides other network functions with information about network slice instances, such as their capacity, coverage, and Quality of Service (QoS) attributes.

3. **Access and Mobility Management**:
   - Works in conjunction with the Access and Mobility Management Function (AMF) to ensure that UEs are connected to the most suitable slice based on their mobility patterns and service requirements.

4. **Policy Enforcement**:
   - Applies operator-defined policies for network slice assignment, ensuring that the network resources are used according to the business objectives of the service provider.
   - Enforces any restrictions or preferences that might be associated with the UE's subscription or the service level agreement (SLA).

5. **Support for Slice-Specific Services**:
   - Facilitates the creation and management of slices that are designed for specific services, such as enhanced mobile broadband (eMBB), ultra-reliable and low latency communications (URLLC), or massive machine type communications (mMTC).

6. **Interworking with Other Networks**:
   - Enables the selection of network slices that are best suited for services that may span across different types of networks, including non-3GPP networks.

The NSSF ensures that network resources are efficiently allocated, and service levels are met by directing UEs to the appropriate slice according to their needs. This allows for a more dynamic and flexible use of the network infrastructure, which can adapt to the diverse requirements of various applications and services envisioned for 5G networks.

---

The goal is to update the three files `docker-compose-slicing-ueX.yaml` in order to connect each UE to a particular slice.
- UE 1 -> slice 1 (sst: 128, sd: 128)
- UE 2 -> slice 2 (sst: 1, sd: 1)
- UE 3 -> slice 3 (sst: 130 sd: 130)

---


*** Start Wireshark and capture traffic on the interface “demo-oai”.

##### $\color{Salmon}d/$  Update the three files docker-compose-slicing-ueX.yaml to connect all the UEs to their corresponding slices. You are not allowed to update the CN configuration. Make sure that UE SST is an integer value in decimal while gNB SST and UE SD are strings in hexadecimal.

| Name | &#x1F4F3; UE1 | &#x1F4F3; UE2 | &#x1F4F3; UE3 |
|-|-:|-:|-:|
| SST_GNB:   | "80"     |     "01" |  "82" |
| SST_UE:    | 128      |       1  |     130  |
| SD:        | "000080" | "000001" | "000082" |
| yaml file: | [docker-compose-slicing-ue1.yaml](yaml/slice/docker-compose-slicing-ue1.yaml) | [docker-compose-slicing-ue2.yaml](yaml/slice/docker-compose-slicing-ue2.yaml) | [docker-compose-slicing-ue3.yaml](yaml/slice/docker-compose-slicing-ue3.yaml) |

- [ ] Restart the UEs

```
for i in {1..3}; do docker-compose -f docker-compose-slicing-ue${i}.yaml up --detach --force-recreate ; done
```


Once you established a successful PDU session:
##### $\color{Salmon}e/$ Deduce the IP addresses of all the 5G CN elements.

Subnetwork is `192.168.70.0/24`

| Names | Host IP|
|-|-|
| oai-nssf         | .132 |
| oai-udr          | .133 |
| oai-udm          | .134 |
| oai-ausf         | .135 |
| oai-nrf-slice12  | .136 |
| oai-nrf-slice3   | .137 |
| oai-amf          | .138 |
| oai-smf-slice1   | .139 |
| oai-smf-slice2   | .140 |
| oai-smf-slice3   | .141 |
| oai-spgwu-slice1 | .142 |
| oai-spgwu-slice2 | .143 |
| oai-spgwu-slice3 | .144 |
| oai-ext-dn       | .145 |
| gNB1             | .163 |
| gNB2             | .164 |
| gNB3             | .165 |

##### $\color{Salmon}f/$ Which element of the 5G CN contacts the NSSF? Why?

<img src=images/NSSF-WS.png width='' height='' > </img>

In the 5G Core Network (5GC), the Access and Mobility Management Function (AMF) is the primary network function that contacts the Network Slice Selection Function (NSSF). The AMF plays a crucial role in managing the UE's access and mobility aspects within the network, and it interacts with the NSSF to determine the appropriate network slice or slices for a given user equipment (UE).

Here's how the interaction typically works:

1. **Slice Selection During Initial Registration**: When a UE initially registers with the 5G network, the AMF contacts the NSSF to select the suitable network slice or slices based on the UE's subscription data and requested services. The NSSF decides on the slice(s) considering the UE's subscription profile, operator policies, and the available network slices.

2. **Slice Selection During Session Establishment**: For session management, particularly when setting up a new session for the UE, the AMF may again consult the NSSF to ensure that the UE is connected to the correct slice(s) as per its current needs and service requirements.

3. **Mobility Management**: As the UE moves within the network or when there are changes in network conditions or service requirements, the AMF may interact with the NSSF to reassess and adjust the slice assignment as necessary to maintain optimal service delivery and adherence to the UE's subscription profile.

The NSSF's decisions and the information it provides enable the AMF to ensure that UEs are connected to the most appropriate slices, fulfilling the diverse service requirements characteristic of 5G networks, such as enhanced Mobile Broadband (eMBB), Ultra-Reliable and Low-Latency Communications (URLLC), and massive Machine Type Communications (mMTC).

This interaction between the AMF and NSSF is a key component of the 5G Service-Based Architecture (SBA), allowing for dynamic and flexible network resource management and enabling the delivery of tailored services to meet specific user or application needs.

##### $\color{Salmon}e/$ What is the answer of the NSSF? On which basis the answer is created?

<img src=images/NSSF-WS-details.png width='' height='' > </img>

##### $\color{Salmon}g/$  Why the NSSF is contacted after the AUSF/UDM?

In the 5G core network (5GC) Service-Based Architecture (SBA), the sequence in which the Network Functions (NFs) are contacted, including the Access and Mobility Management Function (AMF), Authentication Server Function (AUSF), Unified Data Management (UDM), and the Network Slice Selection Function (NSSF), is critical for establishing a secure, authenticated, and appropriately managed session for the User Equipment (UE). The NSSF is contacted after the AUSF/UDM for several key reasons related to the flow of authentication, session management, and network slice selection:

1. **Authentication First**: The primary step for a UE connecting to the network is to authenticate itself. The AMF initiates this by contacting the AUSF for authentication procedures. The AUSF, in turn, interacts with the UDM to retrieve the necessary authentication information (such as authentication vectors) for the UE. This process ensures that only authorized UEs can access the network services, maintaining the security and integrity of the network.

2. **Subscriber Data and Services Authorization**: After successful authentication, the UDM provides the AMF with subscription information about the UE. This includes the UE's profile, which contains details about the services the UE is authorized to access, including the network slices it can use. This step is crucial for determining the services and network resources that the UE is entitled to, based on its subscription.

3. **Network Slice Selection**: Only after the authentication and authorization processes are complete (handled by AUSF/UDM) does it make sense to select the appropriate network slice for the UE. This is where the NSSF comes into play. The AMF contacts the NSSF to determine the most suitable network slice or slices for the UE, based on its subscription profile, requested services, and other policy rules. The NSSF's role is to ensure that the UE is connected to the slice(s) that best match its service requirements and subscription entitlements.

4. **Efficient Resource Allocation and Management**: Contacting the NSSF after the AUSF/UDM ensures that network resources are allocated and managed efficiently. By ensuring that the UE is authenticated and its subscription details are known, the network can make informed decisions about resource allocation, aligning network slice selection with the UE's specific needs and the network's policy rules.

5. **Dynamic Network Configuration**: This sequence also supports dynamic network configuration and optimization. As UEs are authenticated and their service needs are identified, the network can adapt by selecting or modifying network slices to meet changing demands, optimizing resource use and service quality.

This ordered process—authentication (AMF-AUSF), subscriber data retrieval and authorization (AUSF/UDM), followed by network slice selection (AMF-NSSF)—ensures a coherent and secure method for UE access and service provisioning in 5G networks, aligning with the goals of flexibility, efficiency, and security inherent in the 5G SBA.

##### $\color{Salmon}h/$   Which entity of the 5G CN contacts the NRF? Why?

In the 5G Core Network (5GC), based on the Service-Based Architecture (SBA), essentially any network function (NF) can contact the Network Repository Function (NRF). The NRF acts as a central registry for services offered by various NFs within the network. This design allows for a dynamic and flexible architecture, where NFs can discover and communicate with each other as needed, without requiring static configurations.

### Why an Entity Contacts the NRF:

1. **Discovery of Network Functions**: NFs contact the NRF to discover other NFs within the network. For example, when a new session needs to be established, the Session Management Function (SMF) might need to discover and select an appropriate User Plane Function (UPF). The SMF queries the NRF to find available UPFs and their capabilities or service characteristics.

2. **Registration and Availability Updates**: NFs also contact the NRF to register themselves when they become active in the network or update their status and capabilities. This registration process enables the NRF to maintain an up-to-date directory of available NFs and their services, which can then be queried by other NFs.

3. **Load Balancing and Optimization**: By querying the NRF, NFs can also obtain information about the load and availability of other NFs, allowing for decisions that optimize network resource utilization and balance the load among different instances of the same NF type.

4. **Supporting Network Slicing**: In the context of network slicing, NFs might contact the NRF to discover NF instances that are specific to certain network slices. This ensures that each network slice can have a tailored set of NFs to meet its specific service requirements.

5. **Facilitating Service-Based Communications**: The SBA of 5G CN promotes loose coupling between NFs, where direct static links are avoided in favor of dynamic discovery and communication. The NRF enables this by allowing NFs to find each other based on required services rather than predefined interfaces.

### Examples:

- **AMF (Access and Mobility Management Function)** might query the NRF to find an SMF for a new UE session.
- **SMF** might contact the NRF to discover UPFs for handling user plane traffic.
- **Any NF** could contact the NRF to find other specific NFs needed for particular tasks or services, such as the AUSF for authentication services.

In summary, the NRF is a critical component of the 5G SBA, enabling NFs to dynamically discover and communicate with each other, thereby enhancing the flexibility, scalability, and efficiency of the network.

##### $\color{Salmon}i/$ What is the answer of the NRF? Why

<img src=images/NRF-WS.png width='' height='' > </img>

When using Wireshark to analyze the communication between a Network Function (NF) and the Network Repository Function (NRF) in a 5G core network, the answer from the NRF typically involves responses to NF discovery, registration, or service update requests. The specific content of the NRF's response depends on the nature of the request made by the NF. Here are some common scenarios and the corresponding responses you might see:

:warning: Note: 

- The SBA in our case uses HTTP/1.1 and the NRF anwer is `204` instead of regular `200` OK Answer. 
- Since the subnetwork is using local subnetwork rfc1918 `192.168.70.0/24` the HTTP messages are not encrypted


### 1. **NF Registration Response**
- **Scenario**: An NF sends a registration request to the NRF to make itself known to the network and to advertise its services.
- **NRF's Answer**: The NRF responds with a success message indicating that the registration has been accepted, often including details about the registration, such as the NF's profile and any assigned identifiers. This might be seen in Wireshark as an HTTP 200 OK response (assuming the SBA uses HTTP/2 or HTTP/3 as the base protocol) with a JSON payload detailing the registration acceptance.

### 2. **NF Discovery Response**
- **Scenario**: An NF queries the NRF to discover other NFs available in the network, possibly looking for specific services or NF instances.
- **NRF's Answer**: The NRF responds with a list of available NF instances that match the query criteria. This could include details such as the NF type, instance IDs, IP addresses, and supported services. In Wireshark, this might appear as an HTTP 200 OK response with a JSON payload listing the discovered NF instances.

### 3. **NF Deregistration/Update Response**
- **Scenario**: An NF sends a deregistration request when it's going offline or an update request to change its profile or advertised services.
- **NRF's Answer**: For deregistration, the NRF would confirm the removal of the NF's information from its registry, typically with a success message. For updates, the NRF would confirm the acceptance of the new information, again likely with an HTTP 200 OK response and a JSON payload reflecting the updated registration details.

### Why the NRF Responds This Way
The NRF's responses are designed to facilitate the dynamic and flexible management of network functions within the 5G core network. By providing detailed and clear responses to registration, discovery, and update requests, the NRF enables:

- **Dynamic Service Discovery**: Allows NFs to find and utilize services offered by other NFs in real-time, adapting to network changes and demands.
- **Scalability**: Supports the addition, removal, and updating of NF instances without requiring manual reconfiguration of the network, allowing the network to scale up or down as needed.
- **Efficiency**: Enables efficient use of network resources by ensuring that NFs can find the most appropriate service instances for their needs.

When analyzing this communication in Wireshark, you would look for HTTP/2 or HTTP/3 packets (depending on the network setup) that contain JSON payloads. The specifics of these payloads can be viewed within Wireshark's packet details pane, where you can see the structured response data sent by the NRF.

In case of the NRF is shared between two slices
##### $\color{Salmon}j/$ What is the answer of the NRF?

When the Network Repository Function (NRF) is shared between two or more network slices in a 5G core network, its responses continue to facilitate the management and discovery of network functions (NFs) across those slices. The NRF's role as a central registry for NFs and their services is designed to support multi-slicing environments, where different slices may require access to a common set of NFs or need to discover slice-specific NF instances.

### Scenario: NF Discovery in a Multi-Slice Environment
- **Request**: An NF (e.g., an AMF or SMF from a specific network slice) queries the NRF to discover NFs for its operations, specifying slice-specific criteria.
- **NRF's Answer**: The NRF responds with information about NF instances that match the query criteria, taking into account the slice-specific requirements. The response would include details of NFs that are either shared across slices or specific to the querying slice, based on the discovery request's parameters.

### How the NRF Handles Shared and Slice-Specific NFs
- **Shared NFs**: For NFs that are shared between slices, the NRF includes these NFs in its responses to discovery queries from NFs in any of the slices, as long as the shared NFs meet the query criteria.
- **Slice-Specific NFs**: For NFs that are specific to certain slices, the NRF filters its responses based on the slice identifiers or characteristics provided in the discovery queries. Only NFs that are relevant to the querying slice are included in the response.

### Response
The exact format of the NRF's response depends on the SBA's implementation details, such as the use of HTTP/1.1 and JSON for RESTful API communication. However, a generalized response in a multi-slice environment could look something like this (as viewed in Wireshark):

- **HTTP Status**: 204 OK
- **Content**: A JSON payload listing the discovered NF instances, which may include:
  - NF instance IDs.
  - NF types (e.g., UPF, AMF).
  - IP addresses and service endpoints.
  - Slice-specific information, such as the network slice identifiers (S-NSSAIs) that each NF instance is associated with.


<img src=images/NRF-WS.png width='75%' height='75%' > </img> 
<img src=images/NRF-slice12-WS-142-to-136.png width='75%' height='75%' > </img> 


<img src=images/NRF-slice12-WS-139-to-136.png width='75%' height='75%' > </img> 
<img src=images/NRF-slice12-WS-136-to-139.png width='75%' height='75%' > </img> 


### Why the NRF Responds This Way
The design allows for efficient and flexible network function management across multiple network slices, ensuring that:
- **Slice Isolation**: Each slice can operate independently, with NF discovery tailored to the slice's specific needs and policies.
- **Resource Optimization**: Shared NFs can be utilized across slices to optimize resource usage and management.
- **Dynamic Adaptation**: The network can dynamically adapt to changing demands and configurations across slices, with the NRF facilitating the necessary NF discovery and registration processes.

In summary, when an NRF is shared between two slices, its response to discovery queries is carefully tailored to include NF instances that are relevant to the querying slice, whether they are shared or slice-specific, thereby supporting efficient and flexible operations across the multi-slice environment.


http Query

<img src=images/NRF-slice12-WS-136-to-139http.png width='50%' height='50%' > </img> 
<img src=images/NRF-slice12-WS-136-to-140http.png width='50%' height='50%' > </img> 
