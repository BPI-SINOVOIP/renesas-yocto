FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:rzv2n-family = " \
	file://0001-Add-OpenCVA-and-Codec-for-V2N.patch \
"
SRC_URI:append:rzv2h-family = " \
        file://0001_Add_OpenCVA_and_Codec.patch \
"
