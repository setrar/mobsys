## &#x1F4DD; Lab1 Report

<img src=images/lab1-docker-compose.png width='50%' height='50%' > </img>

## Part ${\color{Salmon}1:}$

#### ${\color{Salmon}a/}$ Describe the output of watch docker ps (i.e., the columns of the output)

The `docker container ls` command is used to list running containers on your system. This command has options to customize the output based on your needs. If you run the command without any options, it typically provides a tabular output with the following columns:

- **CONTAINER ID:** A unique identifier for the container.
- **IMAGE:** The image from which the container was created.
- **COMMAND:** The command that was used to start the container.
- **CREATED:** The elapsed time since the container was created.
- **STATUS:** The current status of the container (e.g., "Up" or "Exited").
- **PORTS:** Information about the ports that are being mapped between the container and the host.
- **NAMES:** The name assigned to the container.

Here's an example output:

```plaintext
CONTAINER ID   IMAGE              COMMAND                  CREATED        STATUS        PORTS                    NAMES
abc123456789   nginx:latest       "nginx -g 'daemon of…"   2 hours ago    Up 2 hours    0.0.0.0:80->80/tcp       web_server
def987654321   postgres:12        "docker-entrypoint.s…"   3 days ago     Up 3 days     5432/tcp                 db_server
```

- `CONTAINER ID`: A unique identifier for each running container.
- `IMAGE`: The Docker image used to create the container.
- `COMMAND`: The command that was executed when starting the container.
- `CREATED`: The time duration since the container was created.
- `STATUS`: The current state of the container, such as "Up" or "Exited."
- `PORTS`: The port mapping between the container and the host machine.
- `NAMES`: The name assigned to the container for easy reference.

Keep in mind that if you want to see all containers, including those that are not running, you can use the `docker container ls -a` or `docker ps -a` command. Additionally, you can customize the output further using different options, such as `--format` to specify a Go template for the output.


${\color{Salmon}b/}$ what does the “services” attribute in the docker-compose file mean? describe the main attributes of a service.

The services attibute describes all containers running under the docker container orchestration

${\color{Salmon}c/}$ Which NF started first (refer to the docker-compose command output)? Why? (PS: mysql is not a NF).

`oai-nrf` starts first along with mysql

${\color{Salmon}d/}$ What are the running NFs? explain briefly the role of each NF (PS: the ext-dn is not a NF). 

Here are key Network Functions (NFs) in the 5G Core Network and their roles:

- **AMF (Access and Mobility Management Function):** Manages user access, mobility, and security.
- **SMF (Session Management Function):** Handles PDU session management, including establishment and QoS policies.
- **UPF (User Plane Function):** Processes and routes user data packets.
- **AUSF (Authentication Server Function):** Manages authentication procedures, verifying user identities and generating security keys.
- **UDM (Unified Data Management):** Responsible for user data storage and management, including authentication credentials and subscription information.
- **UDR (Unified Data Repository):** Central database that stores user and session data for access by other NFs.
- **NRF (Network Repository Function):** Manages the discovery and registration of NF instances in the network, facilitating NF communication and service orchestration.

${\color{Salmon}e/}$ What are the ports exposed by each NF? What is the role of each port? (refer to the SBA architecture of the 5G CN and the docker ps output)

| NFs  and ports | Usage |
|------|-----------|
| **UPF (2152/udp, 8805/udp):** | Processes and forwards user data packets. |
| **SMF (80/tcp, 9090/tcp, 38412/sctp):** | Manages PDU session establishment and QoS policies.|
| **AMF (80/tcp, 9090/tcp, 38412/sctp):** | Handles user access, mobility, and security.|
| **AUSF (80/tcp):** | Manages user authentication procedures.|
| **UDM (80/tcp):** | Stores and manages user data and subscription information.|
| **UDR (80/tcp):** | Central repository for user and session data.|
| **NRF (80/tcp, 9090/tcp):** | Facilitates NF discovery and registration.|

The roles for the specified ports are:

- **80/tcp:** HTTP port for web services and management interfaces.
- **2152/udp:** GTP (GPRS Tunnelling Protocol) for user data transport in LTE and 5G networks.
- **8805/udp:** Dynamic/private range, specific role varies by application.
- **9090/tcp:** Alternative HTTP port for web services and management interfaces.
- **38412/sctp:** Used for SCTP (Stream Control Transmission Protocol) features, application-specific.


${\color{Salmon}f/}$ How OAI checks for healthy/unhealthy status of NFs? (check health-check scripts in each NF directory inside components/)

- Checks if the configuration file is present
- checks if IP ports are listening

For example:

```bash
if [ $NB_UNREPLACED_AT -ne 0 ]; then
	STATUS=1
	echo "Healthcheck error: configuration file is not configured properly"
fi

if [[ -z $N2_PORT_STATUS ]]; then
	STATUS=1
	echo "Healthcheck error: N2 SCTP port $AMF_PORT_FOR_NGAP is not listening"
fi

if [[ -z $N11_PORT_STATUS ]]; then
	STATUS=1
	echo "Healthcheck error: N11/SBI TCP/HTTP port $AMF_PORT_FOR_N11_HTTP is not listening"
fi
```


${\color{Salmon}g/}$ Open Wireshark in privilege mode (sudo wireshark) and start capturing traffic for 30 seconds on the interface demo-oai. What are the two types of heartbeats that you see? precise between which entities are exchanged. 

- PFCP Heartbeat Request
- PFCP Heartbeat Response

Hearbeats are exchanged between `SMF` (IP .133) and `UPF` (IP .134)

${\color{Salmon}*}$ What is the role of each heartbeat?

- **PFCP Heartbeat Request:** Verifies the availability and reachability of the peer (SMF to UPF or vice versa).
- **PFCP Heartbeat Response:** Confirms the peer is active and the control path is operational.

## Part ${\color{Salmon}2:}$

Questions:

${\color{Salmon}a/}$ What are the 5G protocols involved in this capture? specify for each protocol, its endpoints and the protocol's role?

- **NGAP/NAS-5GS:** NGAP facilitates communication between gNB and AMF in the 5G core, while NAS-5GS handles signaling between UE and AMF for session management and mobility.
- **HTTP/JSON/NAS-5GS:** Indicates the use of HTTP and JSON for transporting NAS-5GS messages, typically in non-3GPP interfaces or for specific services that adapt 5G signaling for web-based applications.
- **HTTP/JSON/NAS-5GS/NGAP:** Suggests a hybrid communication scenario where NAS-5GS and NGAP messages are encapsulated in HTTP/JSON formats, potentially for interfacing with web services or integrating 5G core functions with internet technologies.

${\color{Salmon}b/}$ Explain the messages related to security? Explain the content of each message? What is the relation between AUTN and RES? What is the value of SUCI? Which message includes this information? Can we deduce the IMSI value?

<img src=images/NGAP-Security.png width='' height='' > </img>


- **SMC/SMR:** Security procedure where the network (via SMC) sets security algorithms and the UE (via SMR) confirms their application.
- **AUTN/RES:** Part of UE authentication, where AUTN verifies network authenticity, and RES is the UE's calculated response.
- **SUCI:** Subscriber Concealed Identifier, a privacy-preserving ID used by the UE to safely identify itself to the network.



In the 5G network, security is paramount, and several messages are specifically designed to ensure secure communication between the User Equipment (UE) and the network. The security mechanism involves authentication, confidentiality, and integrity protection. Here's an overview of the security-related messages and their contents, along with an explanation of AUTN, RES, SUCI, and IMSI.

- **SMC/SMR:** Security procedure where the network (via SMC) sets security algorithms and the UE (via SMR) confirms their application.
- **AUTN/RES:** Part of UE authentication, where AUTN verifies network authenticity, and RES is the UE's calculated response.
- **SUCI:** Subscriber Concealed Identifier, a privacy-preserving ID used by the UE to safely identify itself to the network.


### SUCI (Subscription Concealed Identifier):

- **Value**: SUCI is a privacy-preserving identifier that the UE uses to identify itself to the network without revealing its permanent identity (IMSI) directly. SUCI is derived from the IMSI using a public key of the Home Network and an encryption scheme, ensuring that only the Home Network can decrypt it to reveal the IMSI.
  
- **Message**: SUCI is included in the initial registration request sent by the UE to the network when it first attempts to connect.

### IMSI Deduction:

- Direct deduction of the IMSI from SUCI by anyone other than the Home Network is not possible due to the encryption and concealment process. The purpose of SUCI is to protect the UE's privacy and prevent tracking or identity theft. Only the Home Network, possessing the corresponding private key, can decrypt the SUCI to retrieve the IMSI for authentication and other procedures.

Security procedure in 5G involves a series of messages for setting up secure communication, using mechanisms like AUTN and RES for authentication, and employing identifiers like SUCI to protect user privacy. 

Directly deducing the IMSI from SUCI is intentionally designed to be unfeasible to protect the user's privacy and security.

${\color{Salmon}c/}$ What is the purpose of : 

The procedures mentioned are integral to managing `Packet Data Unit` (PDU) sessions in 5G networks, which are essential for establishing and maintaining data connectivity between the User Equipment (UE) and the data network. Here's a detailed look at each of these procedures:

### (i) PDU Session Establishment Request
A message from the User Equipment (UE) to the 5G Core Network to start a new PDU session, specifying desired session parameters and QoS requirements.

### (ii) PDU Session Establishment Accept
A confirmation message from the network to the UE, indicating that the PDU session request has been accepted and the necessary resources have been allocated according to the requested parameters.

### (iii) PDUSessionResourceSetupRequest
A message sent by the 5G Core Network to the gNB (next-generation NodeB) during the initial UE setup process, requesting the setup of radio resources for the PDU session.

### (iv) PDUSessionResourceSetupResponse
A response from the gNB to the 5G Core Network, indicating that the requested radio resources for the PDU session have been successfully allocated and configured.

${\color{Salmon}*}$ Why step (i) and (ii) are not enough and we need step (iii) and (iv)? 

Steps (i) and (ii) establish a PDU session's parameters and QoS at the core network level. Steps (iii) and (iv) are essential because they ensure the allocation and configuration of radio resources in the Radio Access Network (RAN) to support these parameters, integrating the core and radio networks for seamless data transmission and optimizing network performance.

${\color{Salmon}*}$ What is/are the most important parameter(s) in each message (the parameter and its value)? Why? 

### (i) PDU Session Establishment Request
- **Important Parameter:** SNSSAI (identifies the network slice).

### (ii) PDU Session Establishment Accept
- **Important Parameter:** Session AMBR (defines maximum data rates).

### (iii) PDUSessionResourceSetupRequest
- **Important Parameter:** QoS Flow Descriptions (specifies QoS rules for the session).

### (iv) PDUSessionResourceSetupResponse
- **Important Parameter:** Setup Status (indicates success or failure of resource allocation).

${\color{Salmon}*}$ Can a UE have multiple PDU sessions? Why?

Yes, a UE can have multiple PDU sessions in 5G networks, allowing it to access different network services with distinct QoS requirements simultaneously.

Multiple PDU sessions enable a UE to meet diverse application demands with specific QoS needs simultaneously, enhancing user experience and network efficiency.

${\color{Salmon}d/}$ What is the IP address of the UE? 

<img src=images/UE-IP_Address.png width='50%' height='50%' > </img>

In this example, the UE's IP address is `12.1.1.2` which is part of the `12.1.1.0/24` subnetwork mostly defined by the OAI.

${\color{Salmon}*}$ Which entity assigned this IP address?

The OAI-UPF or the Gateway assigns these addresses since it belongs to their own subnetwork.

${\color{Salmon}e/}$ What are the differences between PDU session establishment \{Request/Accept\} and Registration \{Request, Accept\} procedures?

The PDU Session Establishment and Registration procedures in a 5G network are both fundamental but serve different purposes within the network's architecture and user equipment (UE) connectivity lifecycle. Understanding their differences is key to grasping how 5G networks manage connections and data flows. Here’s a breakdown of the two processes:

### Registration {Request, Accept} Procedure:

1. **Purpose**: The Registration procedure is about establishing the UE's presence in the network. It involves the UE identifying itself to the network, performing initial authentication and security setup, and establishing a context in the Core Network (CN) for the UE. This procedure is necessary for the UE to gain access to the network's services.

2. **Process**:
   - **Registration Request**: Initiated by the UE, this request includes the UE's identity (SUCI for privacy protection or IMSI if privacy protection is not required), requested NSSAI (Network Slice Selection Assistance Information) for network slicing, and other information necessary for initial access.
   - **Registration Accept**: Sent by the network (specifically, the AMF) in response, confirming the UE's registration and providing it with necessary information such as the assigned GUTI (Globally Unique Temporary Identifier) and allowed NSSAI. It may also include information about the TAI (Tracking Area Identity) list for mobility management.

### PDU Session Establishment {Request/Accept} Procedure:

1. **Purpose**: This procedure is focused on establishing a data plane connection between the UE and the Data Network (DN), such as the internet or an enterprise network. It sets up the resources and QoS parameters for the PDU session, which is essentially a data tunnel through the network.

2. **Process**:
   - **PDU Session Establishment Request**: After successful registration, the UE sends this request to establish a PDU session for specific data services. The request includes the PDU session ID, requested QoS parameters, and the DNN (Data Network Name) identifying the target data network.
   - **PDU Session Establishment Accept**: The network (via the SMF) responds to the UE, accepting the PDU session establishment. This message includes the assigned QoS parameters, the PDU session ID, and may also include the IP address allocated to the UE for this session.

### Key Differences:

- **Scope**: The Registration procedure is about access and mobility in the network, allowing the UE to be recognized and authenticated by the network. In contrast, the PDU Session Establishment procedure is about setting up specific data paths within the network for the UE to access external data services.
- **Initiation Conditions**: Registration is typically initiated when the UE first powers on, moves to a new network area, or when its registration expires. PDU Session Establishment can be initiated anytime after the UE is registered and seeks to access data services.
- **Network Functions Involved**: Registration involves interactions primarily with the AMF for access and mobility management. PDU Session Establishment involves the SMF for session management and may also involve communication with the UPF for user plane data routing.
- **Result**: Successful Registration allows the UE to be reachable and to roam within the network. Successful PDU Session Establishment enables the UE to send and receive data through the established session with specific QoS parameters.

Understanding these differences is crucial for comprehending the 5G network's operational dynamics, from initial access and authentication to specific data service delivery.

${\color{Salmon}f/}$ What is the main content and the purpose of : 
- (i) PFCP Establishment Request/Response and 
- (ii) PFCP Modification Request/Response. 
- What is the Modification needed for?

The Packet Forwarding Control Protocol (PFCP) is used within the 5G architecture, specifically between the Session Management Function (SMF) and the User Plane Function (UPF) for the establishment, modification, and deletion of user plane sessions. It plays a critical role in managing the user plane paths for the data traffic. Here's an overview of PFCP Establishment and Modification procedures:

### (i) PFCP Session Establishment Request/Response

- **Purpose**: The PFCP Session Establishment procedure is used to create a new session in the User Plane Function (UPF). This session corresponds to a PDU session in the 5G context and is necessary for routing and forwarding user data packets according to the rules defined by the SMF.
  
- **Process**:
  - **PFCP Session Establishment Request**: Sent by the SMF to the UPF, this request contains the necessary information to set up the user plane path, including PDRs (Packet Detection Rules), FARs (Forwarding Action Rules), QERs (QoS Enforcement Rules), and any other information required to handle the user data for the session.
  - **PFCP Session Establishment Response**: Sent by the UPF back to the SMF, this response indicates whether the session has been successfully established. It includes the result of the establishment request and may contain any UPF-generated information necessary for managing the session.

### (ii) PFCP Session Modification Request/Response

- **Purpose**: The PFCP Session Modification procedure is used to update an existing session in the UPF. This could be necessary for several reasons, including changes in the session's QoS parameters, updating routing rules due to mobility, or adding/removing filters. Essentially, it allows the network to dynamically adjust the user plane behavior as needed without tearing down and re-establishing the session.

- **Process**:
  - **PFCP Session Modification Request**: The SMF sends this request to make changes to an existing session in the UPF. The modifications could involve updating PDRs, FARs, QERs, or any other session-related information to reflect new policies or to adjust to changes in the network or UE state.
  - **PFCP Session Modification Response**: The UPF responds to the modification request, indicating the result of the attempted modifications. This response confirms whether the requested changes have been successfully applied to the session.

### Why Modifications Are Needed:

1. **QoS Adjustments**: To update the session with new QoS parameters as the network conditions change or as the UE moves, ensuring that the quality of service requirements are consistently met.

2. **Mobility Management**: To handle the UE's mobility, such as when it moves to a new area and the data path needs to be updated to reflect the new routing requirements.

3. **Session Rules Update**: To add, modify, or delete packet detection or forwarding rules as the services used by the UE change or to enforce new policy decisions.

4. **Traffic Steering**: To steer traffic for load balancing, service requirements, or to implement specific network policies related to security, charging, or application-specific routing.

5. **Error Handling**: To correct or adjust session parameters in response to detected errors or anomalies in the user plane.

PFCP Modification requests ensure that the 5G network remains flexible and adaptive, capable of managing the dynamic nature of user traffic, mobility, and service requirements efficiently.

${\color{Salmon}g/}$ What is the relation between the procedure in question f) and the procedure in question c)?

`PFCP` messages manage the **setup and modification of user plane paths** at the `UPF`, while `PDU` session messages coordinate the **establishment and resource allocation for user data sessions** across the 5G core network and access networks.


${\color{Salmon}h/}$ In which message(s) are the information related to slices present? What are these parameters? Explain the purpose of having this information in multiple messages and not only in one message.

<img src=images/S-NSSAI.png width='50%' height='50%' > </img>

Information related to network slicing in 5G is crucial for supporting the multiple service requirements that 5G aims to fulfill, such as enhanced Mobile Broadband (eMBB), Ultra-Reliable and Low-Latency Communications (URLLC), and massive Machine Type Communications (mMTC). Network slices are essentially separate networks configured on the same physical infrastructure to cater to different types of services with distinct performance, latency, and reliability requirements.

### Messages Containing Slice Information:

1. **Registration Request**:
   - **Parameters**: The most relevant parameter related to slicing in this message is the S-NSSAI (Single Network Slice Selection Assistance Information), which indicates the slice/s the UE wishes to access or is authorized to access.
   - **Purpose**: Allows the UE to indicate to the network which slice services it intends to use. This is crucial during the initial access to ensure the UE is connected to the appropriate slice according to its service requirements.

2. **PDU Session Establishment Request**:
   - **Parameters**: S-NSSAI is also included in this request to specify the slice to which the PDU session should be associated.
   - **Purpose**: Since a UE might have access to multiple slices, specifying the slice for each PDU session allows the network to allocate resources and apply policies according to the specific slice's requirements.

3. **Initial Context Setup Request** (in the case of NR RAN):
   - **Parameters**: Contains the S-NSSAI for the UE, among other parameters.
   - **Purpose**: Used by the AMF to inform the gNB about the slice that the UE is connected to, enabling the gNB to manage its radio resources in line with the slice's requirements.

4. **PDU Session Resource Setup Request**:
   - **Parameters**: Includes S-NSSAI to ensure that the radio access network can allocate the necessary resources for the session according to the slice's characteristics.
   - **Purpose**: Facilitates the setup of user plane resources in alignment with the slice-specific service levels, especially for procedures like handover or session modification.

### Purpose of Including Slice Information in Multiple Messages:

- **Dynamic Network Configuration**: Network slicing is a dynamic process. Including slice information in multiple messages allows the network to adjust resources, policies, and configurations in real-time as the UE moves, initiates new sessions, or when network conditions change.
  
- **Session-Specific Handling**: Since a UE can simultaneously have sessions in multiple slices, each with different service requirements, including slice information in session-specific messages (like PDU Session Establishment Requests) ensures that each session is treated according to its associated slice's policy.

- **Mobility Management**: As the UE moves across different parts of the network, including between different gNBs, including slice information in mobility management messages ensures seamless service continuity within the designated slice.

- **Resource Allocation and Optimization**: By specifying the slice in messages that initiate or modify sessions and contexts, the network can optimize resource allocation and ensure that the QoS and other requirements of each slice are met.

- **Flexibility and Scalability**: This approach provides the flexibility to introduce new slices or modify existing ones without impacting the overall operation of the network. It allows for scalability as the network grows or as service demands evolve.

In summary, including slice-related information in various messages instead of just one enables the 5G network to maintain the integrity of network slicing across different phases of network access, mobility, and session management. It ensures that each service or session is accurately mapped to the correct slice, meeting the diverse and dynamic service requirements characteristic of 5G networks.


##### Bonus

&#x1F4B0; `Bonus Question`: Update the SMF health-check script to report healthy only when heartbeats are successfully exchanged between SMF and UPF (you can test it by removing the UPF, the healthcheck should report unhealthy in this case).

Hint: Docker containers emit logs to the stdout and stderr output streams. Because containers are stateless, the logs are stored on the Docker host in JSON files by default. Create a healthcheck.sh to read the logs and to check for heartbeats. You will have to add a volume attribute in SMF service inside the docker-compose file to override the file `/openair-smf/scripts/healthcheck.sh`


```yaml
    oai-smf:
        container_name: "oai-smf"
        image: oai-smf:develop
        volumes:
            - ./healthscripts/smf-healthcheck.sh:/tmp/healthcheck.sh
        healthcheck:
            test: /bin/bash -c "/tmp/healthcheck.sh"
            interval: 10s
            timeout: 5s
            retries: 5
```


```bash
#!/bin/bash
set -eo pipefail

STATUS=0
SMF_IP_SBI_INTERFACE=$(ifconfig $SMF_INTERFACE_NAME_FOR_SBI | grep inet | awk {'print $2'})
#Check if entrypoint properly configured the conf file and no parameter is unset(optional)
SMF_SBI_PORT_STATUS=$(netstat -tnpl | grep -o "$SMF_IP_SBI_INTERFACE:$SMF_INTERFACE_PORT_FOR_SBI")
NB_UNREPLACED_AT=`cat /openair-smf/etc/*.conf | grep -v contact@openairinterface.org | grep -c @ || true`

if [ $NB_UNREPLACED_AT -ne 0 ]; then
	STATUS=-1
	echo "Healthcheck error: UNHEALTHY configuration file is not configured properly"
fi

if [[ -z $SMF_SBI_PORT_STATUS ]]; then
	STATUS=-1
	echo "Healthcheck error: UNHEALTHY SBI TCP/HTTP port $SMF_INTERFACE_PORT_FOR_SBI is not listening."
fi

exit $STATUS
```

```
docker container logs oai-smf
```
> Returns
```powershell
[2024-02-10T16:51:33.759187] [smf] [smf_n4 ] [info ] TIME-OUT event timer id 9
[2024-02-10T16:51:33.759240] [smf] [smf_n4 ] [info ] PFCP HEARTBEAT PROCEDURE hash 3123723076 starting
[2024-02-10T16:51:33.759498] [smf] [smf_n4 ] [info ] handle_receive(16 bytes)
[2024-02-10T16:51:33.759517] [smf] [smf_n4 ] [debug] handle_receive_pfcp_msg msg type 2 length 12
[2024-02-10T16:51:38.759415] [smf] [smf_n4 ] [info ] TIME-OUT event timer id 13
[2024-02-10T16:51:43.045270] [smf] [smf_app] [info ] TIME-OUT event timer id 10
[2024-02-10T16:51:43.045661] [smf] [smf_app] [debug] Send ITTI msg to N11 task to trigger NRF Heartbeat
[2024-02-10T16:51:43.045697] [smf] [smf_app] [debug] Set a timer to the next Heart-beat (10)
[2024-02-10T16:51:43.045733] [smf] [smf_sbi] [debug] Send NF Update to NRF (HTTP version 1)
[2024-02-10T16:51:43.045814] [smf] [smf_sbi] [debug] Send NF Update to NRF, Msg body [{"op":"replace","path":"/nfStatus","value":"REGISTERED"}]
[2024-02-10T16:51:43.045870] [smf] [smf_sbi] [debug] Send NF Update to NRF, NRF URL 192.168.70.130:80/nnrf-nfm/v1/nf-instances/a4d2d7a6-93eb-4d67-9299-7c7d8d88d586
[2024-02-10T16:51:43.045882] [smf] [smf_sbi] [debug] Promise ID generated 8
[2024-02-10T16:51:43.047044] [smf] [smf_app] [debug] Got response with HTTP code  204!
[2024-02-10T16:51:43.047081] [smf] [smf_app] [debug] Prepare to make promise id 8 ready!
[2024-02-10T16:51:43.047086] [smf] [smf_app] [debug] Trigger process response: Set promise with ID 8 to ready
[2024-02-10T16:51:43.047134] [smf] [smf_sbi] [debug] Got result for promise ID 8
[2024-02-10T16:51:43.047137] [smf] [smf_sbi] [debug] Response data 
[2024-02-10T16:51:43.047139] [smf] [smf_sbi] [debug] NF Instance Registration, response from NRF, HTTP Code: 204
[2024-02-10T16:51:43.047141] [smf] [smf_sbi] [debug] NF Update, got successful response from NRF
[2024-02-10T16:51:43.047172] [smf] [smf_app] [debug] NF Update NF response
[2024-02-10T16:51:43.047175] [smf] [smf_app] [debug] Set NRF Heartbeat timer (10)
[2024-02-10T16:51:43.759744] [smf] [smf_n4 ] [info ] TIME-OUT event timer id 14
[2024-02-10T16:51:43.759765] [smf] [smf_n4 ] [info ] PFCP HEARTBEAT PROCEDURE hash 3123723076 starting
[2024-02-10T16:51:43.760136] [smf] [smf_n4 ] [info ] handle_receive(16 bytes)
[2024-02-10T16:51:43.760157] [smf] [smf_n4 ] [debug] handle_receive_pfcp_msg msg type 2 length 12
```

```
docker-compose -f docker-compose-basic-nrf.yaml exec oai-smf bash -c "cat /tmp/healthcheck.sh"
```
> Returns
```bash
#!/bin/bash
set -eo pipefail

STATUS=0
SMF_IP_SBI_INTERFACE=$(ifconfig $SMF_INTERFACE_NAME_FOR_SBI | grep inet | awk {'print $2'})
#Check if entrypoint properly configured the conf file and no parameter is unset(optional)
SMF_SBI_PORT_STATUS=$(netstat -tnpl | grep -o "$SMF_IP_SBI_INTERFACE:$SMF_INTERFACE_PORT_FOR_SBI")
NB_UNREPLACED_AT=`cat /openair-smf/etc/*.conf | grep -v contact@openairinterface.org | grep -c @ || true`

if [ $NB_UNREPLACED_AT -ne 0 ]; then
	STATUS=-1
	echo "Healthcheck error: UNHEALTHY configuration file is not configured properly"
fi

if [[ -z $SMF_SBI_PORT_STATUS ]]; then
	STATUS=-1
	echo "Healthcheck error: UNHEALTHY SBI TCP/HTTP port $SMF_INTERFACE_PORT_FOR_SBI is not listening."
fi

exit $STATUS
```

```
docker network inspect demo-oai-public-net | grep -A 4 smf | grep 192 | awk '{print $2}'
```
> "192.168.70.133/26",

```
docker network inspect demo-oai-public-net | grep -A 4 upf | grep 192 | awk '{print $2}'
```
> "192.168.70.134/26",

```
docker-compose -f docker-compose-basic-nrf.yaml logs oai-smf -f
```

Analyse logs

- [ ] Healthy

```
oai-smf  | [2024-02-12T10:03:21.140689] [smf] [smf_n4 ] [info ] PFCP HEARTBEAT PROCEDURE hash 3123723076 starting
oai-smf  | [2024-02-12T10:03:21.141237] [smf] [smf_n4 ] [info ] handle_receive(16 bytes)
oai-smf  | [2024-02-12T10:03:21.141313] [smf] [smf_n4 ] [debug] handle_receive_pfcp_msg msg type 2 length 12
oai-smf  | [2024-02-12T10:03:26.141443] [smf] [smf_n4 ] [info ] TIME-OUT event timer id 783
oai-smf  | [2024-02-12T10:04:21.147641] [smf] [smf_n4 ] [info ] PFCP HEARTBEAT PROCEDURE hash 3123723076 starting
oai-smf  | [2024-02-12T10:04:21.147955] [smf] [smf_n4 ] [info ] handle_receive(16 bytes)
oai-smf  | [2024-02-12T10:04:21.148086] [smf] [smf_n4 ] [debug] handle_receive_pfcp_msg msg type 2 length 12
oai-smf  | [2024-02-12T10:04:26.148270] [smf] [smf_n4 ] [info ] TIME-OUT event timer id 813
oai-smf  | [2024-02-12T10:04:30.607572] [smf] [smf_app] [info ] TIME-OUT event timer id 810
```

- [ ] Unhealthy

```
oai-smf  | [2024-02-12T10:06:36.160218] [smf] [smf_n4 ] [warn ] PFCP HEARTBEAT PROCEDURE FAILED after 2 retries, remove the association with this UPF
oai-smf  | [2024-02-12T10:06:36.160279] [smf] [smf_n4 ] [info ] TIME-OUT event timer id 880
oai-smf  | [2024-02-12T10:06:40.615307] [smf] [smf_app] [info ] TIME-OUT event timer id 877
```

<img src=images/SMF-unhealthy.png width='' height='' ></img>

- [ ] Looking for those log files in the container

* Inspect the image since not having `Dockerfile`

```
docker image inspect `docker image ls oai-smf --quiet`
```
> Returns:
```json
[
    {
        "Id": "sha256:c07363a84a7c3f5c4ac1e134f827b6629d886074fc32f8b93e7bd37e86275fa6",
        "RepoTags": [
            "oai-smf:develop",
            "oaisoftwarealliance/oai-smf:develop"
        ],
        "RepoDigests": [
            "oaisoftwarealliance/oai-smf@sha256:431131e30ad8c49de7b2bd9f9bce92022955efca91fb9434a8d8401e236a8dcb"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2022-11-17T14:10:34.001742525Z",
        "Container": "719b877d9b80fef8971b6e77bb0d2df9a27051aea949624041b3015984409a54",
        "ContainerConfig": {
            "Hostname": "719b877d9b80",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {},
                "8805/udp": {},
                "9090/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "DEBIAN_FRONTEND=noninteractive",
                "TZ=Europe/Paris"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/openair-smf/bin/oai_smf\" \"-c\" \"/openair-smf/etc/smf.conf\" \"-o\"]"
            ],
            "Healthcheck": {
                "Test": [
                    "CMD-SHELL",
                    "/openair-smf/bin/healthcheck.sh"
                ],
                "Interval": 10000000000,
                "Timeout": 15000000000,
                "Retries": 6
            },
            "Image": "sha256:e8e3e060f1f0cb81bc68d818c86646e270bb12e6513fdab2fbb03b33e225f2fa",
            "Volumes": null,
            "WorkingDir": "/openair-smf",
            "Entrypoint": [
                "/bin/bash",
                "/openair-smf/bin/entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.17",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {},
                "8805/udp": {},
                "9090/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "DEBIAN_FRONTEND=noninteractive",
                "TZ=Europe/Paris"
            ],
            "Cmd": [
                "/openair-smf/bin/oai_smf",
                "-c",
                "/openair-smf/etc/smf.conf",
                "-o"
            ],
            "Healthcheck": {
                "Test": [
                    "CMD-SHELL",
                    "/openair-smf/bin/healthcheck.sh"
                ],
                "Interval": 10000000000,
                "Timeout": 15000000000,
                "Retries": 6
            },
            "Image": "sha256:e8e3e060f1f0cb81bc68d818c86646e270bb12e6513fdab2fbb03b33e225f2fa",
            "Volumes": null,
            "WorkingDir": "/openair-smf",
            "Entrypoint": [
                "/bin/bash",
                "/openair-smf/bin/entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 119124393,
        "VirtualSize": 119124393,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/f891e1f9eb7d4a0b152a41bee8e49ea899169189343e625779d4001929f555f8/diff:/var/lib/docker/overlay2/36e664748a97bf7420c9a4cb2a75ffe11b46a27b8f32745a3156e59c946dbe9f/diff:/var/lib/docker/overlay2/a15407afb6a8e37285d55c36e08964844bbf5e484d892b1379868c02bc2b94a5/diff:/var/lib/docker/overlay2/720b4f5ab7409c0381a92c4da210b5bd0f289d71a80447a07be23edc8a1c9a8e/diff:/var/lib/docker/overlay2/24bbc4dd9932fc67b269630c97953e26514cecb428e5672777a68a82373c5e31/diff:/var/lib/docker/overlay2/42f5d3bde355491f516273af6b0768baa494f7e54e9c9ed95ea872f87310adca/diff:/var/lib/docker/overlay2/32bb641671f68d0034723e91990e07df4f9e28a0ea2f1cd612d65a4347b0bcca/diff",
                "MergedDir": "/var/lib/docker/overlay2/a96c93c8e1ed2e3b3578f6001f920614f9fc04205487800158c6c87cd6df2889/merged",
                "UpperDir": "/var/lib/docker/overlay2/a96c93c8e1ed2e3b3578f6001f920614f9fc04205487800158c6c87cd6df2889/diff",
                "WorkDir": "/var/lib/docker/overlay2/a96c93c8e1ed2e3b3578f6001f920614f9fc04205487800158c6c87cd6df2889/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:4a641e21953d4161b38a01933802b61ad314880fc6a93e8667dd210846fe7071",
                "sha256:0aab2ae5b1d605d5e964b3d03304b9f3ae97fe8c408e4a653ced67eef8d2e160",
                "sha256:852ca3555149d2a56f628946ce47becf39705fab690334136a225452a1bf2f0a",
                "sha256:4b896e58dfe98707310d51c3ca00dc098a8e19b30d7c2c98a25db7c034af440a",
                "sha256:408b18f89150e254c60629c00ad8c5d8c89a66357d539a3907c3bf0da1908b12",
                "sha256:2b5d5b9ad0309c10a973e29b6ed9f3ef28b5b28b12b08dc4d17d9688d14db246",
                "sha256:87c7be1be6023a5886214ea2f08df369c521290561c133b663de463a7a9d8471",
                "sha256:c9cb87523a77608074a56adfcad8533fe770a3c6a1d9768114d7867f759f07a8"
            ]
        },
        "Metadata": {
            "LastTagTime": "2022-11-24T13:57:36.389721128+01:00"
        }
    }
]
```

```
docker-compose -f docker-compose-basic-nrf.yaml exec oai-smf bash -c "find / -name \"*.json\""
```

> No such files

- [ ] [Redirecting command output in docker](https://stackoverflow.com/questions/34632959/redirecting-command-output-in-docker)

Based on this post I looked into the `entrypoint.sh` or the `cmd`

```json
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/openair-smf/bin/oai_smf\" \"-c\" \"/openair-smf/etc/smf.conf\" \"-o\"]"
            ],
```

No `stdout` or `stderr` redirection mentionned 
