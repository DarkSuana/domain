#!/bin/bash
apt-get update && apt-get upgrade -y
echo "Enter your domain (default=test.local): "
read $DOMAIN
echo "Enter hostname of your server (default=ipa):"
read $HOSTNAME
hostnamectl set-hostname $HOSTNAME+$DOMAIN
echo "Enter youк local ip: "
read $IP
echo -e "$IP $HOSTNAME+$DOMAIN  $HOSTNAME" | tee -a /etc/hosts
apt-get install rng-tools -y