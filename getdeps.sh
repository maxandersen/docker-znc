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

apt-get install -y ca-certificates
apt-get install -y libcurl4-openssl-dev
apt-get install -y git
