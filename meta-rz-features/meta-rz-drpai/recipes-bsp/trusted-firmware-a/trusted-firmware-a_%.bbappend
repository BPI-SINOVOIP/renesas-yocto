FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:rzv2n-family = " \
    file://0000-ddr_param_def_lpddr4-rzv2n_1.patch \
"

SRC_URI:append:rzv2h-family = " \
    file://0001-system-setting-for-BSP-v2.0.0.patch \
"
