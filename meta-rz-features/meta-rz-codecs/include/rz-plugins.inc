DISTRO_FEATURES:append = " hwh264dec hwh264enc hwh265dec hwh265enc "
MACHINE_FEATURES:append = " hwh264dec hwh264enc hwh265dec hwh265enc "

DISTRO_FEATURES:append:rzg3l-family = " hwh264dec hwh264enc "
MACHINE_FEATURES:append:rzg3l-family = " hwh264dec hwh264enc "

require omx-control.inc

RENESAS_DATADIR ?= "/usr/local"

# Many platforms shared the same configuration
def get_common_platform(d):
    soc = d.getVar("SOC_FAMILY").split(':')[0]
    if soc == 'rzg3l-family':
        return 'rzg2l'
    elif soc in ['rzv2h-family', 'rzv2n-family']:
        return 'rzv2h'
    else:
        return ''

COMMON_PLATFORM = "${@get_common_platform(d)}"

LICENSE_FLAGS_ACCEPTED:append=" \
	${@bb.utils.contains("USE_VIDEO_OMX", "1", "commercial_gstreamer1.0-omx", "", d )} \
	${@bb.utils.contains("USE_VIDEO_OMX", "1", "commercial_libomxil", "", d )} \
"

IMAGE_INSTALL:append = " \
	${@bb.utils.contains("USE_VIDEO_OMX", "1", " kernel-module-uvcs-drv ", "", d)} \
	${@bb.utils.contains("USE_VIDEO_OMX", "1", " codec-user-module ", "",d)} \
	${@bb.utils.contains("USE_VIDEO_OMX", "1", " codecinfo ", "",d)} \
"
