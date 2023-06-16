#!/usr/bin/bash

# set root password
sudo passwd root <<EOF
VMware1!
VMware1!
EOF
echo "Root password changed successfully."

su - << EOF
VMware1!
# set IP address
network_config=$(cat <<EOL
network:
 version: 2
 renderer: NetworkManager
 ethernets:
  ens192:
   dhcp4: no
   addresses:
    - 10.10.13.2/24
   gateway4: 10.10.13.1
   nameservers:
    addresses: [203.248.252.2, 10.10.10.2]
EOL
)
echo "$network_config" | sudo tee /etc/netplan/01-network-manager-all.yaml > /dev/null
netplan apply

# repository update
# sudo systemctl stop unattended-upgrades.service
apt update -y

# ssh server install
apt install -y openssh-server

# ifconfig command install
apt install net-tools

# package install
apt install -y ca-certificates curl gnupg lsb-release

# vim package install
apt install -y vim

# iptables install
echo 'iptables-persistent iptables-persistent/autosave_v4 boolean true' | sudo debconf-set-selections
echo 'iptables-persistent iptables-persistent/autosave_v6 boolean false' | sudo debconf-set-selections
apt install -y iptables-persistent

# add hosts file 
echo "10.10.13.2 k8s-master" >> /etc/hosts
echo "10.10.13.3 k8s-worker-01" >> /etc/hosts
echo "10.10.13.4 k8s-worker-02" >> /etc/hosts
echo "10.10.13.5 k8s-worker-03" >> /etc/hosts
echo "10.10.13.6 k8s-worker-04" >> /etc/hosts
EOF