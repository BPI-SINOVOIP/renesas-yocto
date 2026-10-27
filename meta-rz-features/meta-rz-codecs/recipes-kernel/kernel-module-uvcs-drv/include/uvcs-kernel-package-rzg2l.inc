PV = "5.1.5.0"
PR = "r0"

COMPATIBLE_MACHINE = "(rzg3l-family)"

SRC_URI = "${@oe.utils.conditional('USE_VIDEO_OMX', '1', 'file://uvcs_kernel_package_v${PV}.tar.bz2', '', d)}"

S = "${WORKDIR}/uvcs_kernel_package"

do_install:append() {
    # Install shared header file
    install -m 644 ${S}/include/uvcs_ioctl.h ${D}/${includedir}/
    install -m 644 ${S}/include/uvcs_cmn.h ${D}/${includedir}/
    install -m 644 ${S}/include/uvcs_types.h ${D}/${includedir}/
    install -m 644 ${S}/include/mcvx_api.h ${D}/${includedir}/
    install -m 644 ${S}/include/mcvx_types.h ${D}/${includedir}/
    install -m 644 ${S}/src/cmn/uvcs_cmn_internal.h ${D}/${includedir}/
    install -m 644 ${S}/src/core/mcvx_arch_belz.h ${D}/${includedir}/
    install -m 644 ${S}/src/core/mcvx_arch_fcpc.h ${D}/${includedir}/
    install -m 644 ${S}/src/core/mcvx_inner.h ${D}/${includedir}/
    install -m 644 ${S}/src/core/mcvx_register.h ${D}/${includedir}/
    install -m 644 ${S}/src/core/mcvx_arch_vcp3.h ${D}/${includedir}/
}

FILES:${PN}-dev = " \
    ${includedir}/uvcs_ioctl.h \
    ${includedir}/uvcs_cmn.h \
    ${includedir}/uvcs_cmn_internal.h \
    ${includedir}/uvcs_types.h \
    ${includedir}/mcvx_api.h \
    ${includedir}/mcvx_types.h \
    ${includedir}/mcvx_arch_belz.h \
    ${includedir}/mcvx_arch_fcpc.h \
    ${includedir}/mcvx_inner.h \
    ${includedir}/mcvx_register.h \
    ${includedir}/mcvx_arch_vcp3.h \
"
