#!/usr/bin/env bash
set -ex

git clone https://github.com/NixOS/patchelf.git
pushd patchelf

# cannot use -b since it's not supported in really old versions of git
git checkout 0.8
./bootstrap.sh
./configure --prefix=/usr/local
make -j $(nproc)
make install
popd
