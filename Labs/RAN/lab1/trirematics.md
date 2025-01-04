
```
k get all -A | grep -v kube-system 
```
> Returns
```yaml
NAMESPACE     NAME                                                                  READY   STATUS      RESTARTS        AGE
gaia          pod/pontus-pcw6x                                                      1/1     Running     0               4h23m
gaia          pod/pontus-z4lj2                                                      1/1     Running     0               4h25m
gmp-system    pod/alertmanager-0                                                    2/2     Running     0               4h27m
gmp-system    pod/collector-fnnbc                                                   2/2     Running     0               4h25m
gmp-system    pod/collector-ptsw7                                                   2/2     Running     0               4h23m
gmp-system    pod/gmp-operator-567f9dd6c-2pfdt                                      1/1     Running     0               4h27m
gmp-system    pod/rule-evaluator-8597b57d5f-ng4bb                                   2/2     Running     1 (4h25m ago)   4h25m
olm           pod/catalog-operator-d9669bc5b-dzzx8                                  1/1     Running     0               4h25m
olm           pod/olm-operator-664f96cb79-2m5jp                                     1/1     Running     0               4h14m
olm           pod/operatorhubio-catalog-jbsqc                                       1/1     Running     0               4h14m
olm           pod/packageserver-5c6b5bf4f7-phl2v                                    1/1     Running     0               4h14m
olm           pod/packageserver-5c6b5bf4f7-z45qp                                    1/1     Running     0               4h25m
trirematics   pod/0fa077fffab8196cbc31bf64c6cc9807fa8e6d5ccaba12d96bcd9886158j94q   0/1     Completed   0               4h22m
trirematics   pod/23207d5853bf355e061e88d7204bdf9c305fe49be6c2d814cf68617bcedt259   0/1     Completed   0               4h24m
trirematics   pod/athena-operator-9fb86f776-2hwkq                                   2/2     Running     0               4h23m
trirematics   pod/athena-operators-plane-bd2mv                                      1/1     Running     0               4h24m
trirematics   pod/flexric.ric.o-ran-5f57b648d4-shlhc                                3/3     Running     0               38m
trirematics   pod/monitoring-c.monitoring.o-ran-5c5859c97d-lnm8h                    3/3     Running     0               26m
trirematics   pod/mysql-db.sdl.o-ran-5b4b79b599-txg6p                               3/3     Running     0               37m
trirematics   pod/nr-rfsim.ue1.ue1-6f6cf94c8c-4lgcr                                 2/3     Running     0               31m
trirematics   pod/nr-rfsim.ue2.ue2-7997769d74-5fzds                                 2/3     Running     0               33m
trirematics   pod/oai-amf.core.o-ran-7cbccbdcc4-svfl8                               3/3     Running     0               38m
trirematics   pod/oai-db.core.o-ran-6fbbf9fcf7-bgv4z                                3/3     Running     0               38m
trirematics   pod/oai-gnb-cu.oai-cu-du.o-ran-7866f5d48d-2jt4v                       3/3     Running     0               38m
trirematics   pod/oai-gnb-du.oai-cu-du.o-ran-86c4cd4cc7-5jjlz                       3/3     Running     0               38m
trirematics   pod/oai-smf.core.o-ran-58655d974c-zlmsc                               3/3     Running     0               38m
trirematics   pod/oai-upf.core.o-ran-649f6688b-2v5x2                                3/3     Running     0               38m
trirematics   pod/odin-controller-manager-5685b7d4dc-rkpzx                          2/2     Running     0               4h22m
trirematics   pod/odin-operators-plane-wr7vh                                        1/1     Running     0               4h23m

NAMESPACE     NAME                                                                      TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                                    AGE
default       service/kubernetes                                                        ClusterIP   10.2.192.1     <none>        443/TCP                                    4h28m
gmp-system    service/alertmanager                                                      ClusterIP   None           <none>        9093/TCP                                   4h27m
gmp-system    service/gmp-operator                                                      ClusterIP   10.2.212.221   <none>        8443/TCP,443/TCP                           4h27m
olm           service/operatorhubio-catalog                                             ClusterIP   10.2.216.234   <none>        50051/TCP                                  4h25m
olm           service/packageserver-service                                             ClusterIP   10.2.199.37    <none>        5443/TCP                                   4h25m
trirematics   service/athena-controller-manager-metrics-service                         ClusterIP   10.2.215.108   <none>        8443/TCP                                   4h23m
trirematics   service/athena-dns                                                        ClusterIP   10.2.238.62    <none>        53/UDP                                     4h23m
trirematics   service/athena-operator-service                                           ClusterIP   10.2.226.234   <none>        443/TCP                                    4h23m
trirematics   service/athena-operators-plane                                            ClusterIP   10.2.213.43    <none>        50051/TCP                                  4h24m
trirematics   service/athena-webhook-service                                            ClusterIP   10.2.204.193   <none>        443/TCP                                    4h23m
trirematics   service/flexric-sdl                                                       ClusterIP   10.2.225.119   <none>        3306/TCP                                   4h23m
trirematics   service/odin-controller-manager-metrics-service                           ClusterIP   10.2.208.32    <none>        8443/TCP                                   4h22m
trirematics   service/odin-controller-manager-service                                   ClusterIP   10.2.200.183   <none>        443/TCP                                    4h22m
trirematics   service/odin-operators-plane                                              ClusterIP   10.2.232.244   <none>        50051/TCP                                  4h23m
trirematics   service/odin-webhook-service                                              ClusterIP   10.2.240.29    <none>        443/TCP                                    4h22m
trirematics   service/tss04b2c941-4f0f-05ff-4381-2911fe5a4f19cd3f1724e307500fd991b2a7   ClusterIP   10.2.212.69    <none>        60001/TCP,36421/SCTP,36422/SCTP            38m
trirematics   service/tss162f99aa-ee55-c368-bfce-c24ceb0d54b30dbca16c60564e446f43954f   ClusterIP   10.2.255.175   <none>        60001/TCP,80/TCP,8805/UDP,2152/UDP         38m
trirematics   service/tss4a220919-b902-8eb7-d4d2-08e8e44990a2b899fa0cc203fbebfadea7e5   ClusterIP   10.2.205.31    <none>        60001/TCP,3306/TCP                         38m
trirematics   service/tss7c69bcc6-6cef-9de5-f217-5f19b9024b6eb6d89d266559da9aa69aa2b4   ClusterIP   10.2.202.162   <none>        60001/TCP,5201/TCP                         31m
trirematics   service/tss81534344-b275-1e86-421c-8be5b5f1b0e52217073c6f30fd7e777d4cea   ClusterIP   10.2.208.93    <none>        60001/TCP,5201/TCP                         33m
trirematics   service/tss9c8a657e-3d1e-8b82-287a-31cb9960deb81291779400ad975f39490bd0   ClusterIP   10.2.206.48    <none>        60001/TCP,38412/SCTP,80/TCP,8080/TCP       38m
trirematics   service/tssaa931721-bfba-b9f9-eadf-f8ee761712afd7f4bb41f7fc87689af373a9   ClusterIP   10.2.228.186   <none>        60001/TCP,2152/UDP,500/SCTP                38m
trirematics   service/tssad108cc9-b414-0c53-8d25-f4c5a34f911a89dcb0edf0d052d1e551850a   ClusterIP   10.2.213.198   <none>        60001/TCP,36422/SCTP                       37m
trirematics   service/tssbaf7a540-b953-1a7f-6e3c-bb3402542a79cc0dde524d9f0645b5d537e6   ClusterIP   10.2.198.36    <none>        60001/TCP,3306/TCP,9042/TCP                37m
trirematics   service/tssf948661b-27d5-3273-4511-8215230a21494a112e760ddcb0a987c9fad2   ClusterIP   10.2.231.124   <none>        60001/TCP,80/TCP,9090/TCP,8805/UDP         38m
trirematics   service/tssff9f1ed9-62fa-8621-27f4-a9cc16c716ac0449d6c9c06ae035a6981e2c   ClusterIP   10.2.194.82    <none>        60001/TCP,2152/UDP,38412/SCTP,38472/SCTP   38m

NAMESPACE     NAME                                                    DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                                                             AGE
gaia          daemonset.apps/pontus                                   2         2         2       2            2           <none>                                                                    4h25m
gmp-system    daemonset.apps/collector                                2         2         2       2            2           <none>                                                                    4h27m

NAMESPACE     NAME                                            READY   UP-TO-DATE   AVAILABLE   AGE
gmp-system    deployment.apps/gmp-operator                    1/1     1            1           4h27m
gmp-system    deployment.apps/rule-evaluator                  1/1     1            1           4h27m
olm           deployment.apps/catalog-operator                1/1     1            1           4h25m
olm           deployment.apps/olm-operator                    1/1     1            1           4h25m
olm           deployment.apps/packageserver                   2/2     2            2           4h25m
trirematics   deployment.apps/athena-operator                 1/1     1            1           4h23m
trirematics   deployment.apps/flexric.ric.o-ran               1/1     1            1           38m
trirematics   deployment.apps/monitoring-c.monitoring.o-ran   1/1     1            1           37m
trirematics   deployment.apps/mysql-db.sdl.o-ran              1/1     1            1           37m
trirematics   deployment.apps/nr-rfsim.ue1.ue1                0/1     1            0           31m
trirematics   deployment.apps/nr-rfsim.ue2.ue2                0/1     1            0           33m
trirematics   deployment.apps/oai-amf.core.o-ran              1/1     1            1           38m
trirematics   deployment.apps/oai-db.core.o-ran               1/1     1            1           38m
trirematics   deployment.apps/oai-gnb-cu.oai-cu-du.o-ran      1/1     1            1           38m
trirematics   deployment.apps/oai-gnb-du.oai-cu-du.o-ran      1/1     1            1           38m
trirematics   deployment.apps/oai-smf.core.o-ran              1/1     1            1           38m
trirematics   deployment.apps/oai-upf.core.o-ran              1/1     1            1           38m
trirematics   deployment.apps/odin-controller-manager         1/1     1            1           4h22m

NAMESPACE     NAME                                                       DESIRED   CURRENT   READY   AGE
gmp-system    replicaset.apps/gmp-operator-567f9dd6c                     1         1         1       4h27m
gmp-system    replicaset.apps/rule-evaluator-84b694f679                  0         0         0       4h27m
gmp-system    replicaset.apps/rule-evaluator-8597b57d5f                  1         1         1       4h25m
olm           replicaset.apps/catalog-operator-d9669bc5b                 1         1         1       4h25m
olm           replicaset.apps/olm-operator-664f96cb79                    1         1         1       4h25m
olm           replicaset.apps/packageserver-5c6b5bf4f7                   2         2         2       4h25m
trirematics   replicaset.apps/athena-operator-9fb86f776                  1         1         1       4h23m
trirematics   replicaset.apps/flexric.ric.o-ran-5f57b648d4               1         1         1       38m
trirematics   replicaset.apps/monitoring-c.monitoring.o-ran-5c5859c97d   1         1         1       37m
trirematics   replicaset.apps/mysql-db.sdl.o-ran-5b4b79b599              1         1         1       37m
trirematics   replicaset.apps/nr-rfsim.ue1.ue1-6f6cf94c8c                1         1         0       31m
trirematics   replicaset.apps/nr-rfsim.ue2.ue2-7997769d74                1         1         0       33m
trirematics   replicaset.apps/oai-amf.core.o-ran-7cbccbdcc4              1         1         1       38m
trirematics   replicaset.apps/oai-db.core.o-ran-6fbbf9fcf7               1         1         1       38m
trirematics   replicaset.apps/oai-gnb-cu.oai-cu-du.o-ran-7866f5d48d      1         1         1       38m
trirematics   replicaset.apps/oai-gnb-du.oai-cu-du.o-ran-86c4cd4cc7      1         1         1       38m
trirematics   replicaset.apps/oai-smf.core.o-ran-58655d974c              1         1         1       38m
trirematics   replicaset.apps/oai-upf.core.o-ran-649f6688b               1         1         1       38m
trirematics   replicaset.apps/odin-controller-manager-5685b7d4dc         1         1         1       4h22m

NAMESPACE    NAME                            READY   AGE
gmp-system   statefulset.apps/alertmanager   1/1     4h27m

NAMESPACE     NAME                                                                        COMPLETIONS   DURATION   AGE
trirematics   job.batch/0fa077fffab8196cbc31bf64c6cc9807fa8e6d5ccaba12d96bcd9886158147f   1/1           7s         4h22m
trirematics   job.batch/23207d5853bf355e061e88d7204bdf9c305fe49be6c2d814cf68617bce2e71f   1/1           9s         4h24m

NAMESPACE     NAME                                              PROVIDER    VERSION   LICENSE       AGE
trirematics   compositionmodel.athena.trirematics.io/mosaic5g   BubbleRAN   v4.1.0    Proprietary   4h23m
trirematics   compositionmodel.athena.trirematics.io/oai-cn     BubbleRAN   v4.1.0    Proprietary   4h22m
trirematics   compositionmodel.athena.trirematics.io/oai-ran    BubbleRAN   v4.1.0    Proprietary   4h22m
trirematics   compositionmodel.athena.trirematics.io/srs        BubbleRAN   v4.1.0    Proprietary   4h23m
trirematics   compositionmodel.athena.trirematics.io/terminal   BubbleRAN   v4.1.0    Proprietary   4h23m

NAMESPACE     NAME                                                          MODEL          READY
trirematics   element.athena.trirematics.io/flexric.ric.o-ran               flexric        true
trirematics   element.athena.trirematics.io/monitoring-c.monitoring.o-ran   monitoring-c   true
trirematics   element.athena.trirematics.io/mysql-db.sdl.o-ran              mysql-db       true
trirematics   element.athena.trirematics.io/nr-rfsim.ue1.ue1                nr-rfsim       false
trirematics   element.athena.trirematics.io/nr-rfsim.ue2.ue2                nr-rfsim       false
trirematics   element.athena.trirematics.io/oai-amf.core.o-ran              oai-amf        true
trirematics   element.athena.trirematics.io/oai-db.core.o-ran               oai-db         true
trirematics   element.athena.trirematics.io/oai-gnb-cu.oai-cu-du.o-ran      oai-gnb-cu     true
trirematics   element.athena.trirematics.io/oai-gnb-du.oai-cu-du.o-ran      oai-gnb-du     true
trirematics   element.athena.trirematics.io/oai-smf.core.o-ran              oai-smf        true
trirematics   element.athena.trirematics.io/oai-upf.core.o-ran              oai-upf        true

NAMESPACE     NAME                                  ACCESS-READY   CORE-READY   EDGE-READY
trirematics   network.athena.trirematics.io/o-ran   true           true         true

NAMESPACE     NAME                                 IMSI              MODE   TEL   ELEMENT-READY
trirematics   terminal.athena.trirematics.io/ue1   001010000000001                false
trirematics   terminal.athena.trirematics.io/ue2   001010000000002                false
```
