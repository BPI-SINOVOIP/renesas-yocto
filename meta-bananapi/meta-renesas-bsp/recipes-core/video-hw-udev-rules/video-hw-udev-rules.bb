SUMMARY = "Udev rules for Renesas video hardware"
DESCRIPTION = "Installs device permissions for Renesas RZ/V2H and RZ/V2N video hardware"
SECTION = "base"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://video-hw.rules"

inherit allarch

do_install() {
	install -d ${D}${sysconfdir}/udev/rules.d
	install -m 0644 ${WORKDIR}/video-hw.rules ${D}${sysconfdir}/udev/rules.d/
}

FILES:${PN} = "${sysconfdir}/udev/rules.d/video-hw.rules"
RDEPENDS:${PN} = "udev"
