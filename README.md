babushka-deps
=============

setup on ubuntu 12.04

apt-get update; apt-get install -y curl; bash -c "`curl https://raw.github.com/philly-mac/babushka-deps/master/bin/setup.sh`"


# Servers

````
# Database servers in the 10.0.0.1x range
10.0.3.10              db-server-01 db-server-01.suitepad.de
10.0.3.11              db-server-02 db-server-02.suitepad.de

# Application servers in the 10.0.0.2x range
10.0.3.20              app-server-01 app-server-01.suitepad.de
10.0.3.21              app-server-02 app-server-02.suitepad.de

# Monitor servers in the 10.0.0.3x range
10.0.3.30              monitor-server-01 monitor-server-01.suitepad.de

# Search servers in the 10.0.0.4x range
10.0.3.40              search-server-01 search-server-01.suitepad.de

# Mail servers in the 10.0.0.5x range
10.0.3.50              mail-server-01 mail-server-01.suitepad.de
````

# Web apps

````
10.0.0.21              internal internal.suitepad.de
````