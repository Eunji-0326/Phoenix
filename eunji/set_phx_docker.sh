#!/usr/bin/bash

su - << EOF
VMware1!
hostnamectl set-hostname k8s-worker-01
cat /home/phoenix/set_net.yml > /etc/netplan/01-network-manager-all.yaml
netplan apply
echo "127.0.0.1 phx-docker" > /etc/hosts
echo "10.10.13.2 k8s-master" >> /etc/hosts
echo "10.10.13.3 k8s-worker-01" >> /etc/hosts
echo "10.10.13.4 k8s-worker-02" >> /etc/hosts
echo "10.10.13.5 k8s-worker-03" >> /etc/hosts
EOF