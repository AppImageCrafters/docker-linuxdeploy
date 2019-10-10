# docker-linuxdeploy
Linuxdeploy build over the `appimagecrafters/docker-base` image to be used while creating AppImages.

Includes gcc-7, glib-2.44.0, autotools-1.16.1, autoconf-2.69 and cmake-3.15.4.

# Usage
Assuming you your current dir contains a cmake configured application this
is how it could be built using this docker image:

```shell script
docker run -v $PWD:/source -w /source appimagecrafters/docker-linuxdeploy \
   /bin/sh -c "cmake . && DESTDIR=AppDir make install && linuxdeploy --appdir=AppDir --output appimage"
```

On `gitlab-ci.yml`:
```yaml
build:AppImage:
  image: appimagecrafters/docker-linuxdeploy
  script:
    - cmake -DCMAKE_INSTALL_PREFIX=/usr
    - DESTDIR=AppDir make install
    - linuxdeploy --appdir=AppDir --output appimage
```