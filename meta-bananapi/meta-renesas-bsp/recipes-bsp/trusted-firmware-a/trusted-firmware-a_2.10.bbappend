FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:bananapi-ai2h = " \
	file://0001-bananapi-ai2h-disable-protected-chipid.patch \
"

SRC_URI:append:bananapi-ai2n = " \
	file://0001-bananapi-ai2n-disable-protected-chipid.patch \
"

SRC_URI:append:bananapi-g3l = " \
        file://0001-bananapi-g3l-disable-protected-chipid.patch \
        file://0002-rzg3l_otp_chip_id_support.patch \
"
