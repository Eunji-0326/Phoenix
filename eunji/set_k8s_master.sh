# k8s init
kubeadm init --pod-network-cidr=192.168.0.0/16
export KUBECONFIG=/etc/kubernetes/admin.conf

# docker 로그인
echo "ahneunji" | docker login --username ahneunji --password "P@ssw0rd^^"

# 쿠버네티스에서 사용할 인증정보(secret) 생성
kubectl create secret generic phoenix-secret --from-file=.dockerconfigjson=/root/.docker/config.json --type=kubernetes.io/dockerconfigjson

# calico CNI install
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/tigera-operator.yaml

# 커스텀 리소스를 클러스터에 생성
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/custom-resources.yaml

# weavenet CNI 설치
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml