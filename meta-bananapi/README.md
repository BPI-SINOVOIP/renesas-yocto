
# meta-bananapi

Renesas Yocto/OpenEmbedded layer supporting the Banana Pi RZ/V2H, RZ/V2N and RZ/G3L platforms.

Get the [bpi-build-v2h-yocto](https://github.com/BPI-SINOVOIP/bpi-build/tree/v2h-yocto) docker image for Source code building

    $ docker pull sinovoip/bpi-build-v2h-yocto:ubuntu20.04
    $ docker run \
        --pid=host \
        --security-opt apparmor=rootlesskit \
        -it \
        -v /media:/media \
        -v /etc/localtime:/etc/localtime:ro \
        -v /dev:/dev \
        -v /tmp:/tmp \
        sinovoip/bpi-build-v2h-yocto:ubuntu20.04 \
        /bin/bash

## build

Initialize a yocto build

    $ git clone -b bpi-rz https://github.com/Dangku/renesas-yocto.git
    $ cd renesas-yocto

For the RZ/V2H and RZ/V2N machines, use the RZV template:

    $ TEMPLATECONF=${PWD}/meta-bananapi/meta-renesas-bsp/conf/templates/rzv-conf-bananapi source poky/oe-init-build-env build

For the RZ/G3L machine, use the G3L template

    $ TEMPLATECONF=${PWD}/meta-bananapi/meta-renesas-bsp/conf/templates/rzg-conf-bananapi source poky/oe-init-build-env build

Decompress [OSS package]() to build directory.

    $ 7z x <OSS_PKG_PATH>/oss_pkg_rzv_*.7z -o.

Run the following command to build the Yocto image. The generated files are
located in `build/tmp/deploy/images/<board>`:

    $ MACHINE=<board> bitbake core-image-weston

Run the following command to build the cross-compiler installer. It is
generated under `build/tmp/deploy/sdk/`:

    $ MACHINE=<board> bitbake core-image-weston -c populate_sdk
