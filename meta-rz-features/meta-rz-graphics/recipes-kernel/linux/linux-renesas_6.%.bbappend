FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:rzg2l-family = " \
        file://0002-Workaround-GPU-driver-remove-power-domains-G2L.patch \
        file://0002-Workaround-GPU-driver-remove-power-domains-v2l.patch \
"

SRC_URI:append:rzv2h-family = " \
        file://0001-GPU-driver-remove-power-domains-of-GPU-note-for-RZV2H.patch \
"

SRC_URI:append:rzv2n-family = " \
	file://0003-GPU-driver-remove-power-domains-of-GPU-note-for-RZV2N.patch \
"

SRC_URI:append:rzg3l-family = " \
        file://0004-GPU-driver-remove-power-domains-of-GPU-note-for-RZG3L.patch \
"
