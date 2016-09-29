#! /usr/bin/env bash
set -e

# Config
ZNC_VERSION="1.6.3"

# Ensure package list is up to date.
apt-get update

# Install runtime dependencies.
apt-get install -y sudo

# Install build dependencies.
apt-get install -y wget build-essential libssl-dev libperl-dev pkg-config software-properties-common python-software-properties python3-dev libicu-dev

# Install newer compiler to be able to build znc 1.6.0
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y gcc-4.8 g++-4.8
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50



# Prepare building
mkdir -p /src

# Download, compile and install ZNC.
cd /src
wget "http://znc.in/releases/archive/znc-${ZNC_VERSION}.tar.gz"
tar -zxf "znc-${ZNC_VERSION}.tar.gz"
cd "znc-${ZNC_VERSION}"
./configure --enable-python && make && make install

# Clean up
apt-get remove -y wget
apt-get autoremove -y
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
