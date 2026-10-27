SUMMARY = "Linux firmware for Realtek RTL8821CU WiFi/Bluetooth chip"
DESCRIPTION = "This package provides firmware files for the Realtek RTL8821CU WiFi/Bluetooth chip."
LICENSE = "CLOSED"

FILESEXTRAPATH:prepend := "${THISDIR}/files:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

PV = "0.1"

SRC_URI = " \
    file://rtl8821c_fw.bin \
    file://rtl8821c_config.bin \
    file://rtw8821c_fw.bin \
"
S = "${WORKDIR}"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/rtl_bt/
    install -d ${D}${nonarch_base_libdir}/firmware/rtw88/
    install -m 0644 ${S}/rtl8821c_fw.bin ${D}${nonarch_base_libdir}/firmware/rtl_bt/
    install -m 0644 ${S}/rtl8821c_config.bin ${D}/${nonarch_base_libdir}/firmware/rtl_bt/
    install -m 0644 ${S}/rtw8821c_fw.bin ${D}/${nonarch_base_libdir}/firmware/rtw88/
}

FILES:${PN} += "${nonarch_base_libdir}/firmware/rtl_bt/rtl8821c_*"
FILES:${PN} += "${nonarch_base_libdir}/firmware/rtw88/rtw8821c_fw.bin"
