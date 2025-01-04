# Orchestration 


```
k get all -A
> Returns:
```yaml
NAMESPACE     NAME                                                                  READY   STATUS      RESTARTS        AGE
gaia          pod/pontus-pcw6x                                                      1/1     Running     0               3h29m
gaia          pod/pontus-z4lj2                                                      1/1     Running     0               3h31m
gmp-system    pod/alertmanager-0                                                    2/2     Running     0               3h33m
gmp-system    pod/collector-fnnbc                                                   2/2     Running     0               3h31m
gmp-system    pod/collector-ptsw7                                                   2/2     Running     0               3h29m
gmp-system    pod/gmp-operator-567f9dd6c-2pfdt                                      1/1     Running     0               3h33m
gmp-system    pod/rule-evaluator-8597b57d5f-ng4bb                                   2/2     Running     1 (3h31m ago)   3h31m
kube-system   pod/coredns-db5667c87-gzfhj                                           1/1     Running     0               3h31m
kube-system   pod/gke-metadata-server-7d7b6                                         1/1     Running     0               3h29m
kube-system   pod/gke-metadata-server-s8sx2                                         1/1     Running     0               3h31m
kube-system   pod/konnectivity-agent-75f75b749b-qq9rp                               1/1     Running     0               3h33m
kube-system   pod/konnectivity-agent-75f75b749b-qx9zr                               1/1     Running     0               3h29m
kube-system   pod/konnectivity-agent-autoscaler-5d9dbcc6d8-tphz2                    1/1     Running     0               3h33m
kube-system   pod/kube-proxy-gke-ors-cluster2-ors-pool-f9237ef3-229k                1/1     Running     0               3h29m
kube-system   pod/kube-proxy-gke-ors-cluster2-ors-pool-f9237ef3-57v7                1/1     Running     0               3h30m
kube-system   pod/l7-default-backend-d86c96845-xrpgz                                1/1     Running     0               3h33m
kube-system   pod/metrics-server-v0.5.2-6bf74b5d5f-wfthg                            2/2     Running     0               3h20m
kube-system   pod/netd-jmf6t                                                        1/1     Running     0               3h31m
kube-system   pod/netd-mrblq                                                        1/1     Running     0               3h29m
kube-system   pod/pdcsi-node-9c2hl                                                  2/2     Running     0               3h31m
kube-system   pod/pdcsi-node-d82j5                                                  2/2     Running     0               3h29m
olm           pod/catalog-operator-d9669bc5b-dzzx8                                  1/1     Running     0               3h31m
olm           pod/olm-operator-664f96cb79-2m5jp                                     1/1     Running     0               3h20m
olm           pod/operatorhubio-catalog-jbsqc                                       1/1     Running     0               3h20m
olm           pod/packageserver-5c6b5bf4f7-phl2v                                    1/1     Running     0               3h20m
olm           pod/packageserver-5c6b5bf4f7-z45qp                                    1/1     Running     0               3h31m
trirematics   pod/0fa077fffab8196cbc31bf64c6cc9807fa8e6d5ccaba12d96bcd9886158j94q   0/1     Completed   0               3h28m
trirematics   pod/23207d5853bf355e061e88d7204bdf9c305fe49be6c2d814cf68617bcedt259   0/1     Completed   0               3h30m
trirematics   pod/athena-operator-9fb86f776-2hwkq                                   2/2     Running     0               3h29m
trirematics   pod/athena-operators-plane-bd2mv                                      1/1     Running     0               3h30m
trirematics   pod/odin-controller-manager-5685b7d4dc-rkpzx                          2/2     Running     0               3h28m
trirematics   pod/odin-operators-plane-wr7vh                                        1/1     Running     0               3h29m

NAMESPACE     NAME                                                TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)            AGE
default       service/kubernetes                                  ClusterIP   10.2.192.1     <none>        443/TCP            3h34m
gmp-system    service/alertmanager                                ClusterIP   None           <none>        9093/TCP           3h33m
gmp-system    service/gmp-operator                                ClusterIP   10.2.212.221   <none>        8443/TCP,443/TCP   3h33m
kube-system   service/default-http-backend                        NodePort    10.2.217.15    <none>        80:30463/TCP       3h33m
kube-system   service/kube-dns                                    ClusterIP   10.2.192.10    <none>        53/UDP,53/TCP      3h34m
kube-system   service/metrics-server                              ClusterIP   10.2.245.132   <none>        443/TCP            3h33m
olm           service/operatorhubio-catalog                       ClusterIP   10.2.216.234   <none>        50051/TCP          3h31m
olm           service/packageserver-service                       ClusterIP   10.2.199.37    <none>        5443/TCP           3h31m
trirematics   service/athena-controller-manager-metrics-service   ClusterIP   10.2.215.108   <none>        8443/TCP           3h29m
trirematics   service/athena-dns                                  ClusterIP   10.2.238.62    <none>        53/UDP             3h29m
trirematics   service/athena-operator-service                     ClusterIP   10.2.226.234   <none>        443/TCP            3h29m
trirematics   service/athena-operators-plane                      ClusterIP   10.2.213.43    <none>        50051/TCP          3h30m
trirematics   service/athena-webhook-service                      ClusterIP   10.2.204.193   <none>        443/TCP            3h29m
trirematics   service/flexric-sdl                                 ClusterIP   10.2.225.119   <none>        3306/TCP           3h29m
trirematics   service/odin-controller-manager-metrics-service     ClusterIP   10.2.208.32    <none>        8443/TCP           3h28m
trirematics   service/odin-controller-manager-service             ClusterIP   10.2.200.183   <none>        443/TCP            3h28m
trirematics   service/odin-operators-plane                        ClusterIP   10.2.232.244   <none>        50051/TCP          3h29m
trirematics   service/odin-webhook-service                        ClusterIP   10.2.240.29    <none>        443/TCP            3h28m

NAMESPACE     NAME                                                    DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                                                             AGE
gaia          daemonset.apps/pontus                                   2         2         2       2            2           <none>                                                                    3h31m
gmp-system    daemonset.apps/collector                                2         2         2       2            2           <none>                                                                    3h33m
kube-system   daemonset.apps/gke-metadata-server                      2         2         2       2            2           beta.kubernetes.io/os=linux,iam.gke.io/gke-metadata-server-enabled=true   3h34m
kube-system   daemonset.apps/kube-proxy                               0         0         0       0            0           kubernetes.io/os=linux,node.kubernetes.io/kube-proxy-ds-ready=true        3h33m
kube-system   daemonset.apps/metadata-proxy-v0.1                      0         0         0       0            0           cloud.google.com/metadata-proxy-ready=true,kubernetes.io/os=linux         3h33m
kube-system   daemonset.apps/nccl-fastsocket-installer                0         0         0       0            0           <none>                                                                    3h33m
kube-system   daemonset.apps/netd                                     2         2         2       2            2           cloud.google.com/gke-netd-ready=true,kubernetes.io/os=linux               3h33m
kube-system   daemonset.apps/nvidia-gpu-device-plugin-large-cos       0         0         0       0            0           <none>                                                                    3h34m
kube-system   daemonset.apps/nvidia-gpu-device-plugin-large-ubuntu    0         0         0       0            0           <none>                                                                    3h34m
kube-system   daemonset.apps/nvidia-gpu-device-plugin-medium-cos      0         0         0       0            0           <none>                                                                    3h34m
kube-system   daemonset.apps/nvidia-gpu-device-plugin-medium-ubuntu   0         0         0       0            0           <none>                                                                    3h34m
kube-system   daemonset.apps/nvidia-gpu-device-plugin-small-cos       0         0         0       0            0           <none>                                                                    3h34m
kube-system   daemonset.apps/nvidia-gpu-device-plugin-small-ubuntu    0         0         0       0            0           <none>                                                                    3h34m
kube-system   daemonset.apps/pdcsi-node                               2         2         2       2            2           kubernetes.io/os=linux                                                    3h33m
kube-system   daemonset.apps/pdcsi-node-windows                       0         0         0       0            0           kubernetes.io/os=windows                                                  3h33m
kube-system   daemonset.apps/runsc-metric-server                      0         0         0       0            0           kubernetes.io/os=linux,sandbox.gke.io/runtime=gvisor                      3h34m
kube-system   daemonset.apps/tpu-device-plugin                        0         0         0       0            0           <none>                                                                    3h33m

NAMESPACE     NAME                                            READY   UP-TO-DATE   AVAILABLE   AGE
gmp-system    deployment.apps/gmp-operator                    1/1     1            1           3h33m
gmp-system    deployment.apps/rule-evaluator                  1/1     1            1           3h33m
kube-system   deployment.apps/coredns                         1/1     1            1           3h31m
kube-system   deployment.apps/konnectivity-agent              2/2     2            2           3h34m
kube-system   deployment.apps/konnectivity-agent-autoscaler   1/1     1            1           3h33m
kube-system   deployment.apps/kube-dns                        0/0     0            0           3h34m
kube-system   deployment.apps/kube-dns-autoscaler             0/0     0            0           3h34m
kube-system   deployment.apps/l7-default-backend              1/1     1            1           3h33m
kube-system   deployment.apps/metrics-server-v0.5.2           1/1     1            1           3h33m
olm           deployment.apps/catalog-operator                1/1     1            1           3h31m
olm           deployment.apps/olm-operator                    1/1     1            1           3h31m
olm           deployment.apps/packageserver                   2/2     2            2           3h31m
trirematics   deployment.apps/athena-operator                 1/1     1            1           3h29m
trirematics   deployment.apps/odin-controller-manager         1/1     1            1           3h28m

NAMESPACE     NAME                                                       DESIRED   CURRENT   READY   AGE
gmp-system    replicaset.apps/gmp-operator-567f9dd6c                     1         1         1       3h33m
gmp-system    replicaset.apps/rule-evaluator-84b694f679                  0         0         0       3h33m
gmp-system    replicaset.apps/rule-evaluator-8597b57d5f                  1         1         1       3h31m
kube-system   replicaset.apps/coredns-db5667c87                          1         1         1       3h31m
kube-system   replicaset.apps/konnectivity-agent-75f75b749b              2         2         2       3h33m
kube-system   replicaset.apps/konnectivity-agent-autoscaler-5d9dbcc6d8   1         1         1       3h33m
kube-system   replicaset.apps/kube-dns-7f58849488                        0         0         0       3h33m
kube-system   replicaset.apps/kube-dns-autoscaler-84b8db4dc7             0         0         0       3h33m
kube-system   replicaset.apps/l7-default-backend-d86c96845               1         1         1       3h33m
kube-system   replicaset.apps/metrics-server-v0.5.2-6bf74b5d5f           1         1         1       3h31m
kube-system   replicaset.apps/metrics-server-v0.5.2-8569bc4cf9           0         0         0       3h33m
olm           replicaset.apps/catalog-operator-d9669bc5b                 1         1         1       3h31m
olm           replicaset.apps/olm-operator-664f96cb79                    1         1         1       3h31m
olm           replicaset.apps/packageserver-5c6b5bf4f7                   2         2         2       3h31m
trirematics   replicaset.apps/athena-operator-9fb86f776                  1         1         1       3h29m
trirematics   replicaset.apps/odin-controller-manager-5685b7d4dc         1         1         1       3h28m

NAMESPACE    NAME                            READY   AGE
gmp-system   statefulset.apps/alertmanager   1/1     3h33m

NAMESPACE     NAME                                                                        COMPLETIONS   DURATION   AGE
trirematics   job.batch/0fa077fffab8196cbc31bf64c6cc9807fa8e6d5ccaba12d96bcd9886158147f   1/1           7s         3h28m
trirematics   job.batch/23207d5853bf355e061e88d7204bdf9c305fe49be6c2d814cf68617bce2e71f   1/1           9s         3h30m

NAMESPACE     NAME                                              PROVIDER    VERSION   LICENSE       AGE
trirematics   compositionmodel.athena.trirematics.io/mosaic5g   BubbleRAN   v4.1.0    Proprietary   3h29m
trirematics   compositionmodel.athena.trirematics.io/oai-cn     BubbleRAN   v4.1.0    Proprietary   3h28m
trirematics   compositionmodel.athena.trirematics.io/oai-ran    BubbleRAN   v4.1.0    Proprietary   3h28m
trirematics   compositionmodel.athena.trirematics.io/srs        BubbleRAN   v4.1.0    Proprietary   3h28m
trirematics   compositionmodel.athena.trirematics.io/terminal   BubbleRAN   v4.1.0    Proprietary   3h29m
```
