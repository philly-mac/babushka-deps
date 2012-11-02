#!/bin/bash

source ./config.sh

cp -R /usr/share/doc/openvpn/examples/easy-rsa/ /etc/openvpn

cd /etc/openvpn/easy-rsa/2.0/

source ./vars
source ./clean-all

source ./build-ca