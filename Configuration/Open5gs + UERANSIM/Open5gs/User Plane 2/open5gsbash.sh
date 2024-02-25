
#!bin/bash

sudo sysctl -w net.ipv4.ip_forward=1


sudo ip tuntap add name ogstun mode tun
sudo ip addr add 10.46.0.1/16 dev ogstun
sudo ip link set ogstun up

sudo iptables -t nat -A POSTROUTING -s 10.46.0.0/16 ! -o ogstun -j MASQUERADE

sudo ip tuntap add name ogstun2 mode tun
sudo ip addr add 10.56.0.1/16 dev ogstun2
sudo ip link set ogstun2 up

sudo iptables -t nat -A POSTROUTING -s 10.56.0.0/16 ! -o ogstun2 -j MASQUERADE

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
sudo /bin/open5gs-upfd -c /etc/open5gs/upf2.yaml
