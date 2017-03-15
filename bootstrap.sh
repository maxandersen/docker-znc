#! /usr/bin/env bash
set -e

# Config
ZNC_VERSION="1.6.3"

# Prepare building
mkdir -p /src

# Download, compile and install ZNC.
cd /src
wget "http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz"
tar -zxf "znc-${ZNC_VERSION}.tar.gz"
cd "znc-${ZNC_VERSION}"
./configure --enable-python && make && make install

cd ..
git clone https://github.com/jreese/znc-push.git
cd znc-push
make curl=yes
make install
cd ~
cp /root/.znc/modules/push.so /usr/local/lib/znc

# Clean up
apt-get remove -y wget
apt-get autoremove -y
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
