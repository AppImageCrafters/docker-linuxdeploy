#!/usr/bin/env bash

set -ex

source /entrypoint.sh
BUILD_DIR=/tmp/patchelf
git clone https://github.com/NixOS/patchelf.git ${BUILD_DIR}
pushd ${BUILD_DIR}

# cannot use -b since it's not supported in really old versions of git
git checkout 0.8
./bootstrap.sh
./configure --prefix=/usr/local
make -j $(nproc)
make install
popd

rm -rf ${BUILD_DIR}