IMAGE_INSTALL:append:rzv2h-family = " drp-fw"
IMAGE_INSTALL:append:rzv2n-family = " drp-fw"

IMAGE_INSTALL:append:rzv2h-family = " kernel-module-drp"
IMAGE_INSTALL:append:rzv2n-family = " kernel-module-drp"

TOOLCHAIN_TARGET_TASK:append:rzv2h-family = " kernel-module-drp-dev"
TOOLCHAIN_TARGET_TASK:append:rzv2n-family = " kernel-module-drp-dev"