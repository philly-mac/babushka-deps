#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -R /usr/share/doc/openvpn/examples/easy-rsa/ /etc/openvpn
cat $DIR/whichopensslcnf > /etc/openvpn/easy-rsa/2.0/whichopensslcnf

cd /etc/openvpn/easy-rsa/2.0/

# Make the variables
source ./vars

source $DIR/openvpn_vars.sh

source ./clean-all

# Create the Certificate Authority
source ./build-ca

# Create a certificate/key for your server
source ./build-key-server server

# Diffie Hellman parameters must be generated for the OpenVPN server
source ./build-dh

cd keys

# Copy the required keys to the /etc/openvpn directory
cp ca.crt ca.key dh1024.pem server.crt server.key /etc/openvpn

cd /usr/share/doc/openvpn/examples/sample-config-files

[ -e 'server.conf.gz' ] && gunzip -d server.conf.gz

# Copy the sample server configuration to /etc/openvpn
if [[ -e '/etc/openvpn/server.conf' ]]; then
  echo "server.conf exists. Not overwritting"
else
  cp server.conf /etc/openvpn/
fi

/etc/init.d/openvpn stop
/etc/init.d/openvpn start
