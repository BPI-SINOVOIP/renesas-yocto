SUMMARY = "RZ/V2N ISP kernel modules autoload configuration"
DESCRIPTION = "Installs modules-load.d configuration for RZ/V2N ISP kernel modules"
SECTION = "base"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://rzv2n-isp.conf"

inherit allarch

do_install() {
	install -d ${D}${sysconfdir}/modules-load.d
	install -m 0644 ${WORKDIR}/rzv2n-isp.conf ${D}${sysconfdir}/modules-load.d/
}

FILES:${PN} = "${sysconfdir}/modules-load.d/rzv2n-isp.conf"
