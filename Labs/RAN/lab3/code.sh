# section 1

gcloud auth login

gcloud container clusters get-credentials ors-cluster{group-id} --region europe-west6 --project comsyslab

cli extract infra

# section 3

cli install network open-ran.yaml

cli observe

cli test throughput ue1 dl -- gateway --time 45

cli cic {element} run --follow -- sql

SELECT tstamp, ngran_node, e2node_nb_id, frame, slot, dl_aggr_tbs, dl_aggr_prb, rnti, dl_mcs1 from MAC_UE ORDER BY \
       tstamp DESC LIMIT 12000 INTO OUTFILE '/etc/t9s/athena/wmi/mysql/private/test1.csv' FIELDS TERMINATED BY ',' \
       LINES TERMINATED BY '\n';

cli cic {element} cat -- /etc/t9s/athena/wmi/mysql/private/test1.csv > test1.csv

cli remove network open-ran.yaml

# section 4

cli install network mcs.yaml

cli remove network mcs.yaml

# wait for a few seconds after removing the network
