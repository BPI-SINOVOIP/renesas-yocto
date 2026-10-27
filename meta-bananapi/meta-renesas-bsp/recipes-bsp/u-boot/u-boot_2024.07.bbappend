FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

UBOOT_URI:bananapi-ai2h = "git://github.com/renesas-rz/renesas-u-boot-cip.git;protocol=https"
UBOOT_BRANCH:bananapi-ai2h = "v2024.07/rz_rel"
UBOOT_REV:bananapi-ai2h = "6daf0179322338046504c38623c5502947f3cfcc"

UBOOT_URI:bananapi-ai2n = "git://github.com/renesas-rz/renesas-u-boot-cip.git;protocol=https"
UBOOT_BRANCH:bananapi-ai2n = "v2024.07/rz_rel"
UBOOT_REV:bananapi-ai2n = "6daf0179322338046504c38623c5502947f3cfcc"

UBOOT_URI:bananapi-g3l = "git://github.com/renesas-rz/renesas-u-boot-cip.git;protocol=https"
UBOOT_BRANCH:bananapi-g3l = "v2024.07/rz_rel"
UBOOT_REV:bananapi-g3l = "6daf0179322338046504c38623c5502947f3cfcc"

SRC_URI:remove:bananapi-ai2n = "file://0001-board-renesas-rzv2n-dev-remove-unused-PMIC-I2C-initi.patch"

SRC_URI:append:bananapi-ai2h = " \
	file://0001-add-bananapi-ai2h-board.patch \
"

SRC_URI:append:bananapi-ai2n = " \
	file://0001-add-bananapi-ai2n-board.patch \
"

SRC_URI:append:bananapi-g3l = " \
	file://0001-add-bananapi-g3l-board.patch \
"
