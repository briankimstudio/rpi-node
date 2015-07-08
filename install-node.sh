#!/bin/sh
#
# Script to install Node on Raspberry Pi
#

NODE_TMP="tmp"
NODE_VER="node-v0.12.6"

downloading() {
  echo "Downloading Node..."
  wget https://nodejs.org/dist/latest/$NODE_VER.tar.gz
}

uncompressing() {
  echo "Uncompressing $NODE_VER.tar.gz"
  tar -xvf $NODE_VER.tar.gz
}

if [ -d "$NODE_TMP" ]; then
	echo "cd $NODE_TMP..."
	cd $NODE_TMP
else
	echo "Creating temporary directory..."
	mkdir $NODE_TMP
	cd $NODE_TMP
fi

if [ ! -f $NODE_VER.tar.gz ]; then
  downloading
fi

uncompressing

if [ $? -ne 0 ]; then
  echo "$NODE_VER.tar.gz is corrupted..."
  rm $NODE_VER.tar.gz
  downloading
  uncompressing
fi

cd $NODE_VER
echo "Configuring...";./configure
echo "Compiling...";make
echo "Installing...";sudo make install
echo "Checking version";node -v