#!/bin/bash

cp -R /usr/share/doc/openvpn/examples/easy-rsa/ /etc/openvpn

cd /etc/openvpn/easy-rsa/2.0/

source ./vars
source ./clean-all
source ./build-ca
source ./build-key-server server
source ./build-key client1
source ./build-dh

cd keys

cp ca.crt ca.key dh1024.pem server.crt server.key /etc/openvpn

cd /usr/share/doc/openvpn/examples/sample-config-files

[ -e 'server.conf.gz' ] && gunzip -d server.conf.gz

cp server.conf /etc/openvpn/
cp client.conf ~philip/


/etc/init.d/openvpn stop
/etc/init.d/openvpn start

cd /etc/openvpn/easy-rsa/2.0/keys

[ ! -e '/home/philip/openvpn' ] && mkdir ~philip/openvpn

cp client1.key client1.crt ca.crt client.conf ~philip/openvpn/

chown -Rf philip:philip ~philip/openvpn/