#!/bin/bash
echo "Enter your domain: "
read DOMAIN
echo "Enter hostname of your server:"
read HOSTNAME
hostnamectl set-hostname $HOSTNAME$DOMAIN
echo "Enter youк local ip: "
read IP
echo "$IP    $HOSTNAME.$DOMAIN   $HOSTNAME" | tee -a /etc/hosts
apt-get update && apt-get upgrade -y
apt-get install rng-tools -y
echo "HRNGDEVICE=/dev/urandom" | tee -a /etc/default/rng-tools
systemctl enable rng-tools
systemctl start rng-tools
apt-get install freeipa-server
ipa-server-install