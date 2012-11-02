#!/bin/bash

source ./config.sh

cd /etc/openvpn/easy-rsa/2.0/

source ./vars

source ./build-key client
source ./build-dh

cd keys

cp ca.crt ca.key dh1024.pem server.crt server.key /etc/openvpn

cd /usr/share/doc/openvpn/examples/sample-config-files

[ -e 'server.conf.gz' ] && gunzip -d server.conf.gz

[ -e '/etc/openvpn/server.conf' ] && mv /etc/openvpn/server.conf /etc/openvpn/server.conf.bck

cp server.conf /etc/openvpn/

/etc/init.d/openvpn stop
/etc/init.d/openvpn start

OPENVPN_CLIENT_HOME=/home/${USER}/openvpn/

cd /etc/openvpn/easy-rsa/2.0/keys

[ ! -e ${OPENVPN_CLIENT_HOME} ] && mkdir ${OPENVPN_CLIENT_HOME}

cp client.key client.crt ca.crt client.conf ${OPENVPN_CLIENT_HOME}

chown -Rf ${USER}:${USER} ${OPENVPN_CLIENT_HOME}