# join to master
token=$(sed -n '1p' /home/test01/token.txt)
sha256=$(sed -n '2p' /home/test01/token.txt)

kubeadm join 172.16.0.201:6443 --token $token --discovery-token-ca-cert-hash sha256:$sha256