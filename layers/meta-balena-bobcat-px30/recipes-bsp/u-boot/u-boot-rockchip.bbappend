UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

# rework meta-resin patch whose context is different now in u-boot v2019.4
SRC_URI_remove = "file://resin-specific-env-integration-kconfig.patch"

SRC_URI_append_bobcat-px30 = " \
    file://0001-resin-specific-env-integration-kconfig_REWORKED-lec-px30.patch \
    file://0000-rockchip-add-support-for-px30.patch \
    file://0001-lec-px30.patch \
"

SRCREV_bobcat-px30  = "v2019.10"

do_compile_append_bobcat-px30() {
    tools/mkimage -n px30 -T rksd -d ${DEPLOY_DIR_IMAGE}/rkbin/px30_ddr_333MHz_v1.10.bin idbloader.bin
    cat ${DEPLOY_DIR_IMAGE}/rkbin/px30_miniloader_v1.15.bin >> idbloader.bin
    ${DEPLOY_DIR_IMAGE}/rkbin/tools/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000
}
