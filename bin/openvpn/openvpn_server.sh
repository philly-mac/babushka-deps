#!/bin/bash

cp -R /usr/share/doc/openvpn/examples/easy-rsa/ /etc/openvpn
cat ./whichopensslcnf > /etc/openvpn/easy-rsa/2.0/whichopensslcnf

cd /etc/openvpn/easy-rsa/2.0/

# Make the variables
source ./vars
source ./clean-all

# Create the Certificate Authority
source ./build-ca

# Create a certificate/key for your server
source ./build-key-server server

cd keys

# Copy the required keys to the /etc/openvpn directory
cp ca.crt ca.key dh1024.pem server.crt server.key /etc/openvpn

cd /usr/share/doc/openvpn/examples/sample-config-files

[ -e 'server.conf.gz' ] && gunzip -d server.conf.gz

# Backup the previous server.conf
[ -e '/etc/openvpn/server.conf' ] && \
  echo "Backing up server.conf to server.conf.bck"
  mv /etc/openvpn/server.conf /etc/openvpn/server.conf.bck

# Copy the sample server configuration to /etc/openvpn
cp server.conf /etc/openvpn/

/etc/init.d/openvpn stop
/etc/init.d/openvpn start
