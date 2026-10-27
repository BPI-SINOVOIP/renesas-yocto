DESCRIPTION = "OMX Media Components"
LICENSE = "CLOSED"

require include/rz-plugins.inc
require include/codec-package-${COMMON_PLATFORM}.inc

inherit autotools

includedir = "${RENESAS_DATADIR}/include"
CFLAGS += " -I${STAGING_DIR_HOST}${RENESAS_DATADIR}/include"
PACKAGE_ARCH = "${MACHINE_ARCH}"

do_fetch[file-checksums] = ""
do_compile[noexec] = "1"
do_package_qa[noexec] = "1"

# Create ${S} directory
do_unpack:prepend() {
    os.system("install -d ${S}")
}

B = "${S}"

EXTRA_OECONF = "OMXR_DEFAULT_CONFIG_FILE_NAME=${sysconfdir}/omxr/omxr_config_base.txt"

do_install() {
    # Create destination directory
    install -d ${D}/${libdir}
    install -d ${D}/${includedir}
    install -d ${D}/${sysconfdir}/omxr

    if [ "X${USE_VIDEO_OMX}" = "X1" ]; then
        # Copy omx video library
        do_install_omx_video
    fi

    if [ "${USE_AUDIO_OMX}" = "1" ]; then
        # Copy audio middleware library
        do_install_audio_middleware
        # Copy omx audio library
        do_install_omx_audio
    fi
}

INSANE_SKIP:${PN} = "dev-so"

FILES:${PN} += " \
    ${libdir} \
    ${libdir}/*.so \
"

FILES:${PN}-dev = " \
    ${includedir} \
    ${libdir}/*.la \
"

#To avoid already-stripped errors and not stripped libs from packages
INSANE_SKIP:${PN} += "already-stripped"

# Skip debug split and strip of do_package()
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
