# renesas-yocto

# bananapi-ai2h/bananapi-ai2n

[Build instructions](meta-bananapi/README.md)

# rzv2h/rzv2n

$ TEMPLATECONF=$PWD/meta-renesas/meta-rz-distro/conf/templates/vlp-v4-conf/ source poky/oe-init-build-env build

$ patch -p1 < ../patch/0000-AI_SDK-settings.patch

$ patch -p1 < ../patch/0001-tesseract.patch

$ patch -p1 < ../patch/0002-openmp.patch

$ cp ${WORK}/src_setup/oss_pkg_rzv_*.7z ${YOCTO_WORK}

$ 7z x ${YOCTO_WORK}/oss_pkg_rzv_*.7z -o${YOCTO_WORK}/build

$ MACHINE=rzv2n-evk bitbake core-image-weston

$ MACHINE=rzv2n-evk bitbake core-image-weston -c populate_sdk

# rzg3l

$ TEMPLATECONF=$PWD/meta-renesas/meta-rz-distro/conf/templates/vlp-v5-conf/ source poky/oe-init-build-env build

$ MACHINE=smarc-rzg3l bitbake core-image-weston
