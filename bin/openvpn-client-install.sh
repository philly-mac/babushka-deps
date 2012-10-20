#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install openvpn -y
scp -P 2899 -r philip@ivercore.com:/home/philip/openvpn ~/
cd ~/openvpn
mkdir /etc/openvpn
sudo cp client1.key client1.crt ca.crt client.conf /etc/openvpn
cd /etc/openvpn
vim client.conf
