#!/bin/bash

source ./config.sh

cd /etc/openvpn/easy-rsa/2.0/

source ./vars
source ./clean-all

source ./build-key-server server
