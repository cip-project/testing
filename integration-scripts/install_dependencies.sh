#! /bin/sh
# Copyright (C) 2016, Siemens AG, Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
# SPDX-License-Identifier:	Apache-2.0
echo "START: install_dependencies.sh"

#Add repositories

# Update & upgrade the system
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# Install the dependencies
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install git python-pip python-dev python-concurrent.futures python-tornado libffi-dev libyaml-dev libssl-dev rng-tools

# Install ARM and ARMHF Toolchain
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install gcc-arm-linux-gnueabi gcc-arm-linux-gnueabihf

# Install ARM64 Toolchain
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install gcc-aarch64-linux-gnu

# Install dependencies using pip
sudo pip install ansible markupsafe simplejson

# Start rngd service
sudo DEBIAN_FRONTEND=noninteractive rngd -r /dev/urandom &
echo "END: install_dependencies.sh"
