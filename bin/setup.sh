#!/bin/bash

if [[ `id -u` != 0 ]]; then
  echo "Please run this script as root"
  exit 1
fi

apt-get -y install wget expect libcurl4-openssl-dev curl git build-essential \
  openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev \
  libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev \
  autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config \
  ruby1.9.3

bash -c "`curl https://babushka.me/up/hard`"
babushka sources -a philly-mac git://github.com/philly-mac/babushka-deps.git