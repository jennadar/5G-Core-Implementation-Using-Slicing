#!bin/bash

sudo sysctl -w net.ipv4.ip_forward=1

sudo ip addr add 10.8.2.112/24 dev enp0s8
sudo ip addr add 10.8.2.113/24 dev enp0s8
sudo ip addr add 10.8.2.114/24 dev enp0s8
sudo ip addr add 10.8.2.115/24 dev enp0s8

sudo systemctl stop open5gs-upfd
sudo systemctl stop open5gs-smfd

sudo systemctl restart open5gs-nrfd
sudo systemctl restart open5gs-scpd
sudo systemctl restart open5gs-amfd
sudo systemctl restart open5gs-ausfd
sudo systemctl restart open5gs-udmd
sudo systemctl restart open5gs-udrd
sudo systemctl restart open5gs-pcfd
sudo systemctl restart open5gs-nssfd

