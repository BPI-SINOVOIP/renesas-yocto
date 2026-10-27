RDEPENDS:packagegroup-multimedia-libs:append = " \
    ${@bb.utils.contains("USE_VIDEO_OMX", "1", "codec-user-module", "", d )} \
    ${@bb.utils.contains("USE_VIDEO_OMX", "1", "codecinfo ", "",d)} \
"
