# swap disable
sudo swapoff -a
VMware1!

# firewall disable
sudo ufw disable

# lock 걸림 방지
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock

# https로 repository 접근 후 사용 가능하도록 패키지 다운로드
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# 네트워크 설정
sudo cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-ipta
EOFbles = 1

sudo tee /etc/modules-load.d/modules.conf
br netfilter
EOF

# Kubernetes  공식 GPG 키 추가
sudo  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Kubernetes 패키지 저장소 추가
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# 패키지 업데이트
sudo apt-get update

# 다운로드
sudo apt install -y kubelet kubeadm kubectl

# lock 걸림 방지
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock

# 쿠버네티스 버전 고정
sudo apt-mark hold kubelet kubeadm kubectl

# 데몬 재시작
sudo systemctl daemon-reload
sudo systemctl restart kubelet

# docker 관련 파일 설정
sudo mkdir /etc/docker

cat <<EOF | sudo tee /etc/docker/daemon.json
{
"exec-opts": ["native.cgroupdriver=systemd"],
"log-driver": "json-file",
"log-opts": {
"max-size": "100m"
},
"storage-driver": "overlay2"
}
EOF

# docker 및 관련 데몬 재시작
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

# kubelet 실행
sudo systemctl start kubelet
sudo systemctl enable kubelet

# root 계정으로 변경
sudo su -