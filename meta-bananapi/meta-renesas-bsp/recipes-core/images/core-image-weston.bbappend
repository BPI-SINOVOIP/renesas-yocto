# install all kernel modules
IMAGE_INSTALL:append = " kernel-modules"

# wireless
IMAGE_INSTALL:append = " \
	packagegroup-base-wifi \
	packagegroup-base-bluetooth \
"

# rtl8821cu for kernel 6.1
IMAGE_INSTALL:append:rzv2h-family = " \
	rtl8821cu \
"

IMAGE_INSTALL:append:rzv2n-family = " \
	rtl8821cu \
"

# wireless firmware
IMAGE_INSTALL:append = " \
	linux-firmware-rtl8821cu \
"

SYSTEMD_AUTO_ENABLE:bluez5 = "enable"
SYSTEMD_AUTO_ENABLE:wpa-supplicant = "enable"

# bootscript
IMAGE_INSTALL:append = " \
	bootscript \
"

# systemd
IMAGE_INSTALL:append = " \
	rfkill-unblock \
	resize-helper \
"

# utils
IMAGE_INSTALL:append = " \
	u-boot-tools \
	stress-ng \
"

#glmark2
IMAGE_INSTALL:append = " \
        glmark2 \
"

# Bananapi board identification
# The DRP-AI layer registers a generic update_issue() for core images.  Remove
# that hook for Bananapi machines and use board-specific information instead.
update_issue_bananapi() {
    case "${MACHINE}" in
    bananapi-ai2h)
        AI_SDK_BOARD="Bananapi BPI-AI2H"
        AI_SDK_SOC="RZ/V2H"
        AI_SDK_VERSION="AI SDK V8.00 (Source Code)"
        ;;
    bananapi-ai2n)
        AI_SDK_BOARD="Bananapi BPI-AI2N"
        AI_SDK_SOC="RZ/V2N"
        AI_SDK_VERSION="AI SDK V8.00 (Source Code)"
        ;;
    bananapi-g3l)
        AI_SDK_BOARD="Bananapi BPI-G3L"
        AI_SDK_SOC="RZ/G3L"
        AI_SDK_VERSION="AI SDK V8.00 (Source Code)"
        ;;
    esac

    echo "BOARD: ${AI_SDK_BOARD}" >> ${IMAGE_ROOTFS}/etc/issue
    echo "LSI: ${AI_SDK_SOC}" >> ${IMAGE_ROOTFS}/etc/issue
    echo "${AI_SDK_VERSION}" >> ${IMAGE_ROOTFS}/etc/issue
}

ROOTFS_POSTPROCESS_COMMAND:remove:bananapi-ai2h = "update_issue;"
ROOTFS_POSTPROCESS_COMMAND:remove:bananapi-ai2n = "update_issue;"
ROOTFS_POSTPROCESS_COMMAND:remove:bananapi-g3l = "update_issue;"

ROOTFS_POSTPROCESS_COMMAND:append:bananapi-ai2h = " update_issue_bananapi;"
ROOTFS_POSTPROCESS_COMMAND:append:bananapi-ai2n = " update_issue_bananapi;"
ROOTFS_POSTPROCESS_COMMAND:append:bananapi-g3l = " update_issue_bananapi;"

# initramfs
#INITRAMFS_IMAGE = "initramfs-image"
#INITRAMFS_IMAGE_BUNDLE = "1"
#do_image[depends] += "initramfs-image:do_mkimage_uinitrd"
