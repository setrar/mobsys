# section 1

gcloud auth login

gcloud container clusters get-credentials ors-cluster{group-id} --region europe-west6 --project comsyslab

cli extract infra

# section 3

udp_ports="2123 or 2152 or 5687 or 5847"
sctp_ports="38412 or 38472 or 36421 or 36412"
filter="(sctp port $sctp_ports) or (udp port $udp_ports)"

cli install network open-ran.yaml

cli observe

cli extract pcap {element} --filter "$filter" | wireshark -k -i -

# run for both cu and du separately, first cu then du
cli cic {element} run -- t-dumper

cli test rtt ue1 -- -s 2000 12.1.1.1
cli test rtt ue1 -- -s 1200 12.1.1.1

# Wireshark filter for RLC: rlc-nr.am.si != 0x0

# Wireshark filter for Service Models: e2ap.RANfunctionID == {service-model-id}

cli remove network open-ran.yaml
