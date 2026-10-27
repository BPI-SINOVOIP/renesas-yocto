DESCRIPTION = "RT Linux kernel from the Renesas RZ BSP based on linux-6.1.y-cip"

require recipes-kernel/linux/linux-yocto.inc
require linux-renesas.inc

LINUX_VERSION ?= "6.1.141-cip43-rt23"
LINUX_VERSION:rzg3e-family = "6.1.107-cip28-rt15"

KBUILD_DEFCONFIG ?= "defconfig"
KCONFIG_MODE ?= "alldefconfig"

KERNEL_URL ?= "git://github.com/renesas-rz/rz_linux-cip.git"
KERNEL_BRANCH ?= "rz-6.1-cip43-rt23"
KERNEL_REV ?= "b64f5a3c159735ab489edb2e98d7d0c181f74673"

SRC_URI:append = " \
    file://0001-dmaengine-sh-rz-dmac-Protect-the-driver-specific-lis.patch \
"
