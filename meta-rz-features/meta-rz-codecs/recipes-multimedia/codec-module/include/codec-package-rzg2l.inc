PV="5.1.5.0"
PR="r0"

FULL_VER = "${@'.'.join(d.getVar('PV').split('.')[1:])}"
MAJOR_VER = "${@d.getVar('PV').split('.')[1]}"

COMPATIBLE_MACHINE = "(rzg3l-family)"

OMX_PKG_TAR = "codec_pkg_product_v${PV}.tar.gz"
OMX_PKG = "codec_pkg_product_v${PV}"

SRC_URI = " \
    file://${OMX_PKG_TAR} \
"

# SRC directory name
OMX_COMMON_SRC = '${@oe.utils.conditional("USE_VIDEO_OMX", "1", "omx_common", "", d )}'
OMX_VIDEO_DEC_COMMON_SRC = '${@oe.utils.conditional("USE_VIDEO_DEC", "1", "video_dec_common", "", d )}'
OMX_VIDEO_ENC_COMMON_SRC = '${@oe.utils.conditional("USE_VIDEO_ENC", "1", "video_enc_common", "", d )}'
OMX_H264_DEC_SRC = '${@oe.utils.conditional("USE_H264D_OMX", "1", "h264_decoder", "", d )}'
OMX_H264_ENC_SRC = '${@oe.utils.conditional("USE_H264E_OMX", "1", "h264_encoder", "", d )}'

OMX_VIDEO_SRC_LIST = " \
    ${OMX_COMMON_SRC} \
    ${OMX_VIDEO_DEC_COMMON_SRC} \
    ${OMX_VIDEO_ENC_COMMON_SRC} \
    ${OMX_H264_DEC_SRC} \
    ${OMX_H264_ENC_SRC} \
"

S = "${WORKDIR}/${OMX_PKG}"

do_install_omx_video() {
    cd ${S}
    for omxmc in ${OMX_VIDEO_SRC_LIST}
    do
        install -m 755 ${S}/${omxmc}/lib/lib*.so.* ${D}/${libdir}
        install -m 644 ${S}/${omxmc}/include/*.h ${D}/${includedir}
        install -m 644 ${S}/${omxmc}/config/*.txt ${D}/${sysconfdir}/omxr
    done

    cd ${D}/${libdir}
    if [ "${USE_VIDEO_OMX}" = "1" ] ; then
        ln -s libomxr_core.so.${FULL_VER} libomxr_core.so.${MAJOR_VER}
        ln -s libomxr_core.so.${MAJOR_VER} libomxr_core.so

        ln -s libomxr_mc_cmn.so.${FULL_VER} libomxr_mc_cmn.so.${MAJOR_VER}
        ln -s libomxr_mc_cmn.so.${MAJOR_VER} libomxr_mc_cmn.so

        ln -s libomxr_uvcs_udf.so.${FULL_VER} libomxr_uvcs_udf.so.${MAJOR_VER}
        ln -s libomxr_uvcs_udf.so.${MAJOR_VER} libomxr_uvcs_udf.so

        ln -s libomxr_utility.so.${FULL_VER} libomxr_utility.so.${MAJOR_VER}
        ln -s libomxr_utility.so.${MAJOR_VER} libomxr_utility.so

        ln -s libomxr_mc_vcmn.so.${FULL_VER} libomxr_mc_vcmn.so.${MAJOR_VER}
        ln -s libomxr_mc_vcmn.so.${MAJOR_VER} libomxr_mc_vcmn.so
    fi

    if [ "${USE_VIDEO_DEC}" = "1" ] ; then
        ln -s libomxr_mc_vdcmn.so.${FULL_VER} libomxr_mc_vdcmn.so.${MAJOR_VER}
        ln -s libomxr_mc_vdcmn.so.${MAJOR_VER} libomxr_mc_vdcmn.so

        ln -s libomxr_videoconverter.so.${FULL_VER} libomxr_videoconverter.so.${MAJOR_VER}
        ln -s libomxr_videoconverter.so.${MAJOR_VER} libomxr_videoconverter.so

        ln -s libomxr_cnvpisu.so.${FULL_VER} libomxr_cnvpisu.so.${MAJOR_VER}
        ln -s libomxr_cnvpisu.so.${MAJOR_VER} libomxr_cnvpisu.so

        ln -s libomxr_cnvosdep.so.${FULL_VER} libomxr_cnvosdep.so.${MAJOR_VER}
        ln -s libomxr_cnvosdep.so.${MAJOR_VER} libomxr_cnvosdep.so

        ln -s libuvcs_dec.so.${FULL_VER} libuvcs_dec.so.${MAJOR_VER}
        ln -s libuvcs_dec.so.${MAJOR_VER} libuvcs_dec.so
    fi

    if [ "${USE_VIDEO_ENC}" = "1" ] ; then
        ln -s libomxr_mc_vecmn.so.${FULL_VER} libomxr_mc_vecmn.so.${MAJOR_VER}
        ln -s libomxr_mc_vecmn.so.${MAJOR_VER} libomxr_mc_vecmn.so

        ln -s libuvcs_enc.so.${FULL_VER} libuvcs_enc.so.${MAJOR_VER}
        ln -s libuvcs_enc.so.${MAJOR_VER} libuvcs_enc.so
    fi

    if [ "${USE_H264D_OMX}" = "1" ]; then
        ln -s libomxr_mc_h264d.so.${FULL_VER} libomxr_mc_h264d.so.${MAJOR_VER}
        ln -s libomxr_mc_h264d.so.${MAJOR_VER} libomxr_mc_h264d.so

        ln -s libuvcs_avcd.so.${FULL_VER} libuvcs_avcd.so.${MAJOR_VER}
        ln -s libuvcs_avcd.so.${MAJOR_VER} libuvcs_avcd.so
    fi

    if [ "${USE_H264E_OMX}" = "1" ]; then
        ln -s libomxr_mc_h264e.so.${FULL_VER} libomxr_mc_h264e.so.${MAJOR_VER}
        ln -s libomxr_mc_h264e.so.${MAJOR_VER} libomxr_mc_h264e.so

        ln -s libuvcs_avce.so.${FULL_VER} libuvcs_avce.so.${MAJOR_VER}
        ln -s libuvcs_avce.so.${MAJOR_VER} libuvcs_avce.so
    fi
}

RDEPENDS:${PN} += "mmngr-user-module vspmif-user-module"
RDEPENDS:${PN} += '${@oe.utils.conditional("USE_VIDEO_OMX", "1", "kernel-module-uvcs-drv", "", d )}'
