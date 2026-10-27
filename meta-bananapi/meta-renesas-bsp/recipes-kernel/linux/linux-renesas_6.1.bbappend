FILESEXTRAPATHS:prepend := "${THISDIR}/files-6.1:"

KERNEL_DEVICETREE_OVERLAYS ?= ""

KERNEL_DEVICETREE_OVERLAYS:bananapi-ai2h = " \
        renesas/overlay/bpi-ai2h-i2c0-mux.dtbo \
        renesas/overlay/bpi-ai2h-i2c1.dtbo \
        renesas/overlay/bpi-ai2h-i2c1-flash.dtbo \
        renesas/overlay/bpi-ai2h-i2c1-rtc.dtbo \
        renesas/overlay/bpi-ai2h-i2c2.dtbo \
        renesas/overlay/bpi-ai2h-uart0.dtbo \
        renesas/overlay/bpi-ai2h-uart2.dtbo \
        renesas/overlay/bpi-ai2h-pwm.dtbo \
        renesas/overlay/bpi-ai2h-pwmfan.dtbo \
        renesas/overlay/bpi-ai2h-spi0.dtbo \
        renesas/overlay/bpi-ai2h-spi2.dtbo \
        renesas/overlay/bpi-ai2h-spi2-flash.dtbo \
        renesas/overlay/bpi-ai2h-spi2-waveshare-st7789v.dtbo \
        renesas/overlay/bpi-ai2h-spi2-waveshare-tft24.dtbo \
        renesas/overlay/bpi-ai2h-spi2-waveshare-tft35c.dtbo \
        renesas/overlay/bpi-ai2h-i2s3-nxez-pcm512x.dtbo \
        renesas/overlay/bpi-ai2h-i2s3-waveshare-wm8960.dtbo \
	renesas/overlay/bpi-ai2h-camA-imx415.dtbo \
	renesas/overlay/bpi-ai2h-camB-imx415.dtbo \
	renesas/overlay/bpi-ai2h-camC-imx415.dtbo \
	renesas/overlay/bpi-ai2h-camD-imx415.dtbo \
	renesas/overlay/bpi-ai2h-camA-imx415-74M.dtbo \
	renesas/overlay/bpi-ai2h-camB-imx415-74M.dtbo \
	renesas/overlay/bpi-ai2h-camC-imx415-74M.dtbo \
	renesas/overlay/bpi-ai2h-camD-imx415-74M.dtbo \
	renesas/overlay/bpi-ai2h-camAB-imx415-dual.dtbo \
	renesas/overlay/bpi-ai2h-camCD-imx415-dual.dtbo \
	renesas/overlay/bpi-ai2h-camAB-imx415-74M-dual.dtbo \
	renesas/overlay/bpi-ai2h-camCD-imx415-74M-dual.dtbo \
	renesas/overlay/bpi-ai2h-camAB-imx415-dual-master.dtbo \
	renesas/overlay/bpi-ai2h-camCD-imx415-dual-master.dtbo \
	renesas/overlay/bpi-ai2h-camAB-imx415-74M-dual-master.dtbo \
	renesas/overlay/bpi-ai2h-camCD-imx415-74M-dual-master.dtbo \
	renesas/overlay/bpi-ai2h-panel-hc070iy30025.dtbo \
	renesas/overlay/bpi-ai2h-waveshare-jetson-io-cam0-ov5640.dtbo \
	renesas/overlay/bpi-ai2h-waveshare-jetson-io-cam0-imx415.dtbo \
	renesas/overlay/bpi-ai2h-waveshare-jetson-io-cam0-waveshare-imx415.dtbo \
	renesas/overlay/bpi-ai2h-waveshare-jetson-io-cam1-waveshare-imx415.dtbo \
	renesas/overlay/bpi-ai2h-waveshare-jetson-io-cam0-luckfox-imx415.dtbo \
"

KERNEL_DEVICETREE_OVERLAYS:bananapi-ai2n = " \
        renesas/overlay/bpi-ai2n-i2c0-mux.dtbo \
        renesas/overlay/bpi-ai2n-i2c1.dtbo \
        renesas/overlay/bpi-ai2n-i2c1-flash.dtbo \
        renesas/overlay/bpi-ai2n-i2c1-rtc.dtbo \
        renesas/overlay/bpi-ai2n-i2c2.dtbo \
        renesas/overlay/bpi-ai2n-uart0.dtbo \
        renesas/overlay/bpi-ai2n-uart2.dtbo \
        renesas/overlay/bpi-ai2n-pwm.dtbo \
        renesas/overlay/bpi-ai2n-pwmfan.dtbo \
        renesas/overlay/bpi-ai2n-spi0.dtbo \
        renesas/overlay/bpi-ai2n-spi2.dtbo \
        renesas/overlay/bpi-ai2n-spi2-flash.dtbo \
        renesas/overlay/bpi-ai2n-spi2-waveshare-st7789v.dtbo \
        renesas/overlay/bpi-ai2n-spi2-waveshare-tft24.dtbo \
        renesas/overlay/bpi-ai2n-spi2-waveshare-tft35c.dtbo \
        renesas/overlay/bpi-ai2n-i2s3-nxez-pcm512x.dtbo \
        renesas/overlay/bpi-ai2n-i2s3-waveshare-wm8960.dtbo \
	renesas/overlay/bpi-ai2n-camA-imx415.dtbo \
	renesas/overlay/bpi-ai2n-camB-imx415.dtbo \
	renesas/overlay/bpi-ai2n-camA-imx415-74M.dtbo \
	renesas/overlay/bpi-ai2n-camB-imx415-74M.dtbo \
	renesas/overlay/bpi-ai2n-camAB-imx415-dual.dtbo \
	renesas/overlay/bpi-ai2n-camAB-imx415-dual-master.dtbo \
	renesas/overlay/bpi-ai2n-camAB-imx415-74M-dual.dtbo \
	renesas/overlay/bpi-ai2n-camAB-imx415-74M-dual-master.dtbo \
	renesas/overlay/bpi-ai2n-panel-hc070iy30025.dtbo \
	renesas/overlay/bpi-ai2n-waveshare-jetson-io-cam0-ov5640.dtbo \
	renesas/overlay/bpi-ai2n-waveshare-jetson-io-cam0-imx415.dtbo \
	renesas/overlay/bpi-ai2n-waveshare-jetson-io-cam0-waveshare-imx415.dtbo \
	renesas/overlay/bpi-ai2n-waveshare-jetson-io-cam1-waveshare-imx415.dtbo \
	renesas/overlay/bpi-ai2n-waveshare-jetson-io-cam0-luckfox-imx415.dtbo \
"

SRC_URI:append:bananapi-ai2h = " \
	file://bananapi.cfg \
	file://0001-support-dts-overlay.patch \
	file://0002-add-bananapi-ai2h-board.patch \
        file://0003-drm-add-bananapi-7inch-ili9881c-hc070iy30025-panel.patch \
        file://0004-rzg2l_mipi_dsi-fix-kernel-panic-when-dsi-panel-conne.patch \
"

SRC_URI:append:bananapi-ai2n = " \
	file://bananapi.cfg \
	file://0001-support-dts-overlay.patch \
	file://0002-add-bananapi-ai2n-board.patch \
        file://0003-drm-add-bananapi-7inch-ili9881c-hc070iy30025-panel.patch \
        file://0004-rzg2l_mipi_dsi-fix-kernel-panic-when-dsi-panel-conne.patch \
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
