#!/bin/bash

source ./config.sh

cd /etc/openvpn/easy-rsa/2.0/

source ./vars

source ./build-key-server server
