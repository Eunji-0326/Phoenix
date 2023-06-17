# join to master
token=$(sed -n '1p' /home/phoenix/token/token.txt)
sha256=$(sed -n '2p' /home/phoenix/token/token.txt)

kubeadm join 10.10.13.2:6443 --token $token --discovery-token-ca-cert-hash sha256:$sha256