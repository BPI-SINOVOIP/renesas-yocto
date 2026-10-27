DEPENDS += "${@bb.utils.contains("USE_VIDEO_OMX", "1", "gstreamer1.0-omx", "", d)}"

RDEPENDS:packagegroup-gstreamer1.0-plugins += " \
    ${@bb.utils.contains("USE_VIDEO_OMX", "1", "gstreamer1.0-omx", "", d)} \
"
