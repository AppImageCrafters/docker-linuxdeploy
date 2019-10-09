#!/usr/bin/env bash

set -ex

source /entrypoint.sh

git clone https://github.com/linuxdeploy/linuxdeploy.git --depth=1 /tmp/linuxdeploy
pushd /tmp/linuxdeploy
cmake . -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release
make -j`nproc`
make install