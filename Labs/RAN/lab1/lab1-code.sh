# section 1

gcloud auth login

gcloud container clusters get-credentials ors-cluster{group-id} --region europe-west6 --project comsyslab

cli extract infra

# section 3

udp_ports="2123 or 2152 or 5687 or 5847"
sctp_ports="38412 or 38472 or 36421 or 36412"
filter="(sctp port $sctp_ports) or (udp port $udp_ports)"

cli install network simple-lte.yaml

cli observe

cli extract pcap srs-enb.srs-lte.eurecom -- "$filter" | wireshark -k -i -

cli extract logs {element}

cli test throughput {terminal} dl --plot -- gateway --time 60

cli remove network simple-lte.yaml

# section 4

cli install network sa-data-plane.yaml

cli test throughput ue1 dl -- gateway --time 60

cli install network stage-1.yaml

cli test throughput ue1 dl --plot -- gateway --time 180

cli install network stage-2.yaml

cli test throughput ue2 dl --plot -- gateway --time 30
