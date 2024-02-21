
#!bin/bash

sudo sysctl -w net.ipv4.ip_forward=1

sudo ip addr add 10.0.2.25/24 dev enp0s3
sudo ip addr add 10.0.2.35/24 dev enp0s3

sudo systemctl restart apache2.service
sudo ufw allow 80,443/tcp
sudo ufw allow 8080/tcp

sudo ip tuntap add name ogstun mode tun
sudo ip addr add 10.45.0.1/16 dev ogstun
sudo ip link set ogstun up

sudo iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE

sudo ip tuntap add name ogstun2 mode tun
sudo ip addr add 10.55.0.1/16 dev ogstun2
sudo ip link set ogstun2 up

sudo iptables -t nat -A POSTROUTING -s 10.55.0.0/16 ! -o ogstun2 -j MASQUERADE

sudo systemctl stop open5gs-nrfd
sudo systemctl stop open5gs-scpd
sudo systemctl stop open5gs-smfd
sudo systemctl stop open5gs-amfd
sudo systemctl stop open5gs-ausfd
sudo systemctl stop open5gs-udmd
sudo systemctl stop open5gs-udrd
sudo systemctl stop open5gs-pcfd
sudo systemctl stop open5gs-nssfd
sudo systemctl stop open5gs-bsfd
sleep 5
sudo systemctl restart open5gs-upfd
sleep 5
sudo systemctl status open5gs-upfd
