FROM appimagecrafters/docker-appimagekit
RUN yum install -y curl vim-common fuse libfuse2 libtool zlib-devel libjpeg-devel libpng-devel

ADD install-patchelf.sh /
RUN /install-patchelf.sh

ADD install-linuxdeploy.sh /
RUN /install-linuxdeploy.sh

ADD install-linuxdeploy-plugin-appimage.sh /
RUN /install-linuxdeploy-plugin-appimage.sh

ARG ZSYNC_VERSION=0.6.2
ADD install-zsync.sh /
RUN /install-zsync.sh

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]