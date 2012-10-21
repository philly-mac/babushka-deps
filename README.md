babushka-deps
=============

setup on ubuntu 12.04

apt-get update; apt-get install curl; bash -c "`curl https://raw.github.com/philly-mac/babushka-deps/master/bin/setup.sh`"


# Servers
      # Database servers in the 10.0.0.1x range
      10.0.0.10              db-server-01

      # Application servers in the 10.0.0.2x range
      10.0.0.20              app-server-01

      # Monitor servers in the 10.0.0.3x range
      10.0.0.30              monitor-server-01

      # Search servers in the 10.0.0.4x range
      10.0.0.40              search-server-01

      # Database servers in the 10.0.0.5x range
      10.0.0.50              mail-server-01


# Local, for when using the vpn
# Web apps

      10.0.0.20              edge
      10.0.0.20              staging
      10.0.0.20              internal
      10.0.0.20
      10.0.0.20              graylog2