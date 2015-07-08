#!/bin/sh
#
# Script to install Node on Raspberry Pi
#

NODE_TMP="tmp"
NODE_VER="node-v0.12.6"

if [ -d "$NODE_TMP" ]; then
	echo "cd $NODE_TMP..."
	cd $NODE_TMP
else
	echo "Creating temporary directory..."
	mkdir $NODE_TMP 
	cd $NODE_TMP
fi

echo "Downloading Node..."
wget https://nodejs.org/dist/latest/$NODE_VER.tar.gz
echo "Uncompressing $NODE_VER.tar.gz"
tar -xvf $NODE_VER.tar.gz
cd $NODE_VER
echo "Configuring..."
./configure
echo "Compiling..."
make
echo "Installing..."
sudo make install
echo "Checking version"
node -v
