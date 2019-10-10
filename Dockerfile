FROM appimagecrafters/docker-appimagekit
RUN yum install -y curl vim-common fuse libfuse2 libtool zlib-devel libjpeg-devel libpng-devel
ADD entrypoint.sh /

ADD install-patchelf.sh /
RUN /install-patchelf.sh

ARG ZSYNC_VERSION=0.6.2
ADD install-zsync.sh /
RUN /install-zsync.sh

ADD install-linuxdeploy.sh /
RUN /install-linuxdeploy.sh

ADD install-linuxdeploy-plugin-appimage.sh /
RUN /install-linuxdeploy-plugin-appimage.sh

ADD install-linuxdeploy-qt.sh /
RUN /install-linuxdeploy-qt.sh

ADD https://raw.githubusercontent.com/linuxdeploy/linuxdeploy-plugin-conda/master/linuxdeploy-plugin-conda.sh /usr/local/bin/linuxdeploy-plugin-conda.sh
RUN chmod +x /usr/local/bin/linuxdeploy-plugin-conda.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]