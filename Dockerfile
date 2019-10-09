FROM appimagecrafters/docker-appimagekit
RUN yum install -y curl vim-common fuse libfuse2 libtool zlib-devel libjpeg-devel libpng-devel

ADD install-patchelf.sh /
RUN /install-patchelf.sh

ADD install-linuxdeploy.sh /
RUN /install-linuxdeploy.sh