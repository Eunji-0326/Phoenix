#!/usr/bin/bash

su - << EOF
VMware1!
cat /home/phoenix/set_net.yml > /etc/netplan/01-network-manager-all.yaml
netplan apply
EOF