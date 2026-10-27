include kernel-module-mali.inc

PR = "r54"

SRC_URI = " \
	file://${MALI_GPU}_km_v${PV}.tar.gz \
	file://0001-Add-reset-control-for-driver.patch;striplevel=5 \
	file://0001-support-for-linux-kernel-v5.10.patch;striplevel=5 \
	file://0002-Set-the-performance-governor-by-default.patch;striplevel=5 \
	file://0003-fix-kernel-warning-when-try-to-enable-disable-regula.patch;striplevel=5 \
	file://0004-Fix-kernel-warning-of-irq-names.patch;striplevel=5 \
	file://0005-Update-MIN-MAX-definination-to-compatible-with-cip-k.patch;striplevel=5 \
	file://0006-mali_kbase_mem_linux-require-sync-when-dmabuf-is-all.patch;striplevel=5 \
	file://0007-runtime_pm-prepare-and-enable-clock-again-when-misma.patch;striplevel=5 \
	file://0008-Update-the-getting-reset-control-to-compatible.patch;striplevel=5 \
"
