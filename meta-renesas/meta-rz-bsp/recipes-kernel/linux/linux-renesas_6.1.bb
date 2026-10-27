DESCRIPTION = "Linux kernel from the Renesas RZ BSP based on linux-6.1.y-cip"

require recipes-kernel/linux/linux-yocto.inc
require linux-renesas.inc

LINUX_VERSION ?= "6.1.141-cip43"

KBUILD_DEFCONFIG ?= "defconfig"
KCONFIG_MODE ?= "alldefconfig"

KERNEL_URL ?= "git://github.com/renesas-rz/rz_linux-cip.git"
KERNEL_BRANCH ?= "rz-6.1-cip43"
KERNEL_REV ?= "6717c06c72df7430323d0d48258ae4090f2d76aa"

SRC_URI:append:rzv2h-family = " \
	file://rzv2h-disable-r9a09g056.cfg \
	file://0002-arm64-dts-renesas-r9a09g057-Add-snps-en-tx-lpi-clock.patch \
	file://0001-media-v4l2-common-Add-fractional-bpp-fix-too-big-str.patch \
"

SRC_URI:append = "${@bb.utils.contains('DISTRO_FEATURES','docker', ' file://docker.cfg', '', d)}"
