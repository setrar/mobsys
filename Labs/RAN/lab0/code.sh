# section 1

if [ ":$PATH:" != *":/packages/mobsys:"* ]; then
    export PATH="$PATH:/packages/mobsys"
fi
if which cli > /dev/null; then
    source <(cli completion bash)
fi

source ~/.bashrc

gcloud auth login

gcloud container clusters get-credentials ors-cluster{group-id} --region europe-west6 --project comsyslab

cli extract infra

# section 3

cli install network sample-sa.yaml

cli observe

udp_ports="2123 or 2152 or 9999"
sctp_ports="38412 or 38472 or 36421"
filter="(sctp port $sctp_ports) or (udp port $udp_ports)"
cli extract pcap {element} -- "$filter" | wireshark -k -i -

cli cic {element} run -- t-dumper

cli extract logs {element}

cli test rtt {terminal} -- -c 100 -s 64 12.1.1.1

cli test throughput {terminal} ul -- gateway --time 10
cli test throughput {terminal} dl -- gateway --time 10
cli test throughput {terminal} dl -- gateway --udp --bandwidth 40M

cli extract config {element} /tmp

cli remove network sample-sa.yaml
