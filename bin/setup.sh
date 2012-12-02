#!/bin/bash

if [[ `id -u` != 0 ]]; then
  echo "Please run this script as root"
  exit 1
fi

apt-get -y wget install expect libcurl4-openssl-dev curl git build-essential \
  openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev \
  libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev \
  autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

cd /tmp && \
  wget -c http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p327.tar.bz2 && \
  tar -xjf ruby-1.9.3-p327.tar.bz2 && \
  cd ruby-1.9.3-p327

./configure --prefix=/usr/local; make; make install

if [[ -e /usr/local/bin/ruby ]]; then
  bash -c "`curl https://babushka.me/up/hard`"
  babushka sources -a philly-mac git://github.com/philly-mac/babushka-deps.git
else
  echo "Ruby not installed"
fi
