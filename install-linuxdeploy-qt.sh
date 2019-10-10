#!/usr/bin/env bash

set -ex

source /entrypoint.sh

BUILD_DIR=/tmp/linuxdeploy-pluggin-qt

git clone https://github.com/linuxdeploy/linuxdeploy-plugin-qt --depth=1 ${BUILD_DIR}
pushd ${BUILD_DIR}

git submodule update --init --recursive
cmake . -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release  -DUSE_SYSTEM_CIMG=Off -DUSE_CCACHE=Off
make -j`nproc`
make install
popd

rm -rf ${BUILD_DIR}