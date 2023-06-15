#/bin/bash!

# set root password
sudo passwd root <<EOF
VMware1!
VMware1!
EOF
echo "Root password changed successfully."

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
    addresses: [10.10.10.2, 203.248.252.2]
EOL
)
echo "$network_config" | sudo tee /etc/netplan/01-network-manager-all.yaml > /dev/null
sudo netplan apply

# repository update
sudo systemctl stop unattended-upgrades.service
sudo apt-get update -y || true

# ssh server install
sudo apt install -y openssh-server

# ifconfig command install
sudo apt install net-tools

# package install
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# vim package install
sudo apt-get install vim

# iptables install
echo 'iptables-persistent iptables-persistent/autosave_v4 boolean true' | sudo debconf-set-selections
echo 'iptables-persistent iptables-persistent/autosave_v6 boolean false' | sudo debconf-set-selections
sudo apt-get install -y iptables-persistent

# k8s host name change
hostnamectl set-hostname k8s-master

# add hosts file 
sudo echo "10.10.13.2 k8s-master" >> /etc/hosts
sudo echo "10.10.13.3 k8s-worker-01" >> /etc/hosts
sudo echo "10.10.13.4 k8s-worker-02" >> /etc/hosts
sudo echo "10.10.13.5 k8s-worker-04" >> /etc/hosts