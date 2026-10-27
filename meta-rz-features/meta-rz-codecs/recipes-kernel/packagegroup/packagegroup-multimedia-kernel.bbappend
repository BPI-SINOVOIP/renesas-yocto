RDEPENDS:packagegroup-multimedia-kernel-modules:append = " \
    ${@bb.utils.contains("USE_VIDEO_OMX", "1", "kernel-module-uvcs-drv", "", d )} \
"
