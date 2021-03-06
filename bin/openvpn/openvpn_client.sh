#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

USER=$1
KEY_USER=$2
OPENVPN_CLIENT_HOME="/home/${USER}/openvpn.${KEY_USER}/"

cd /etc/openvpn/easy-rsa/2.0/

source ./vars

source $DIR/openvpn_vars.sh

source ./build-key $KEY_USER

cd /etc/openvpn/easy-rsa/2.0/keys

[ ! -e ${OPENVPN_CLIENT_HOME} ] && mkdir ${OPENVPN_CLIENT_HOME}

cp ${KEY_USER}.* ca.crt ${OPENVPN_CLIENT_HOME}

cd /usr/share/doc/openvpn/examples/sample-config-files

cp client.conf ${OPENVPN_CLIENT_HOME}

chown -Rf ${USER}:${USER} ${OPENVPN_CLIENT_HOME}