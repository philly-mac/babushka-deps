#!/bin/bash

USER=$1
KEY_USER=$2
OPENVPN_CLIENT_HOME="/home/${USER}/openvpn.${KEY_USER}/"

cd /etc/openvpn/easy-rsa/2.0/

source ./vars
source ./build-key $KEY_USER

cd /etc/openvpn/easy-rsa/2.0/keys

[ ! -e ${OPENVPN_CLIENT_HOME} ] && mkdir ${OPENVPN_CLIENT_HOME}

cp client.key client.crt ca.crt "${KEY_USER}.conf" ${OPENVPN_CLIENT_HOME}

chown -Rf ${USER}:${USER} ${OPENVPN_CLIENT_HOME}