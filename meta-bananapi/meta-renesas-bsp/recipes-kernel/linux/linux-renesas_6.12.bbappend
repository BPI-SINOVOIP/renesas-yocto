FILESEXTRAPATHS:prepend := "${THISDIR}/files-6.12:"

KERNEL_DEVICETREE_OVERLAYS ?= ""

KERNEL_DEVICETREE_OVERLAYS:bananapi-g3l = " \
    renesas/overlay/bpi-g3l-cam-ov5640.dtbo \
"

SRC_URI:append:bananapi-g3l = " \
    file://bananapi.cfg \
    file://0001-support-dts-overlay-compilation.patch \
    file://0002-add-bananapi-g3l-board.patch \
"

do_compile:append() {
    if [ -n "${KERNEL_DTC_FLAGS}" ]; then
        export DTC_FLAGS="${KERNEL_DTC_FLAGS}"
    fi

    for dtbf in ${KERNEL_DEVICETREE_OVERLAYS}; do
        dtb=`normalize_dtb "$dtbf"`
        oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ${KERNEL_EXTRA_ARGS}
    done
}

do_install:append() {
    install -d ${D}/${KERNEL_DTBDEST}/overlay
    install -m 0644 ${B}/arch/arm64/boot/dts/renesas/overlay/*.dtbo ${D}/${KERNEL_DTBDEST}/overlay/
}

do_deploy:append() {
    install -d $deployDir/overlay
    install -m 0644 ${D}/${KERNEL_DTBDEST}/overlay/*dtbo $deployDir/overlay/
}

