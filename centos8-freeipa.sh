#!/bin/bash
echo "Enter your domain: "
read DOMAIN
echo "Enter hostname of your server:"
read HOSTNAME
hostnamectl set-hostname $HOSTNAME$DOMAIN
echo "Enter youк local ip: "
read IP
dnf update -y
timedatectl set-timezone Europe/Moscow
dnf install chorny
systemctl enable chronyd --now
echo "$IP    $HOSTNAME.$DOMAIN   $HOSTNAME" | tee -a /etc/hosts
firewall-cmd --permanent --add-port=53/{tcp,udp} --add-port={80,443}/tcp --add-port={88,464}/{tcp,udp} --add-port=123/udp --add-port={389,636}/tcp
firewall-cmd --reload
setenforce 0
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
dnf install @idm:DL1 -y 
dnf install ipa-server -y 
ipa-server-install