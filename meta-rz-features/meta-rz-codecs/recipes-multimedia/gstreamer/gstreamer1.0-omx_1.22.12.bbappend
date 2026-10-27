FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"

require include/rz-plugins.inc

SRC_URI:remove = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"

SRC_URI:append = " \
    git://github.com/renesas-rz/gst-omx.git;branch=RZ/1.22.12;protocol=https \
"

DEPENDS += "codec-user-module mmngrbuf-user-module"

SRCREV = "2b6edcebe9bbd7bcfc09825fdd9b37a51896f3a2"

LIC_FILES_CHKSUM = " \
    file://COPYING;md5=4fbd65380cdd255951079008b364516c \
    file://omx/gstomx.h;beginline=1;endline=22;md5=4b2e62aace379166f9181a8571a14882 \
"

S = "${WORKDIR}/git"

GSTREAMER_1_0_OMX_TARGET = "rz"
GSTREAMER_1_0_OMX_CORE_NAME = "${libdir}/libomxr_core.so"
EXTRA_OEMESON:append = " \
    -Dheader_path=${STAGING_DIR_TARGET}/usr/local/include \
    -Dwith_lossy_compress=false \
    -Dtarget_board=${COMMON_PLATFORM} \
"

RDEPENDS:${PN}:append = " codec-user-module mmngrbuf-user-module"
RDEPENDS:${PN}:remove = "libomxil"
