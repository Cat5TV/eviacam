#!/bin/bash

#
# eViacam installer script for modern Linux
# By Robbie Ferguson // The Bald Nerd
# https://baldnerd.com/
#
# Tested successfully on Linux Mint 19
#

# Force running as root / sudo
if [[ $EUID -ne 0 ]]; then
  echo "ERROR: This script must be run as root. Try: sudo $0" 2>&1
  exit 1
fi

# Update repository data
  apt update

# Install dependencies
  depends=(build-essential libxext-dev libxtst-dev libgtk-3-dev libopencv-dev python3-opencv libv4l-dev debhelper po-debconf autotools-dev libwxgtk3.0-dev libgtk2.0-dev libpng-dev)
  for package in "${depends[@]}"; do yes | apt install "$package"; done

# Remove wxWidgets version which uses GTK 2
  apt remove libwxgtk3.0-dev

# Create a temporary folder to work in
  tmpdir=`mktemp -d -p /tmp/`

# Download wxWidgets version which uses GTK 3
  mkdir $tmpdir/wxw
  cd $tmpdir/wxw
  wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.3/wxWidgets-3.0.3.zip

# Compile and install it with GTK 3 extensions
  unzip wxWidgets-3.0.3.zip
  ./configure --with-gtk=3
  make
  make install
  ldconfig

# Obtain and install eViacam
  mkdir $tmpdir/eviacam
  cd $tmpdir/eviacam
  wget https://github.com/cmauri/eviacam/archive/v2.1.3.zip
  unzip v2.1.3.zip
  cd eviacam-2.1.3
  touch $tmpdir/eviacam/config.rpath
  ./autogen.sh
  ./configure --prefix=/usr/local
  make
  make install

# Break out of the temporary directory we'd created
  cd /tmp

echo "Done. Command to run: eviacam"

exit 0
