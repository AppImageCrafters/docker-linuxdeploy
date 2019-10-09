#! /bin/bash

set -xe

wget https://ftp.fau.de/debian/pool/main/z/zsync/zsync_"$ZSYNC_VERSION".orig.tar.bz2 -O- | tar xj

cd zsync-"$ZSYNC_VERSION"


aclocal
autoconf
automake --add-missing

./configure --prefix=/usr/local

# build and install into prefix
make all -j$(nproc)
make install

cd ..

rm -rf zsync-"$ZSYNC_VERSION"/
