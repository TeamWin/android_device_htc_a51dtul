$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/htc_a51dtul/htc_a51dtul-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/htc_a51dtul/overlay

LOCAL_PATH := device/htc/htc_a51dtul

    #Zoneinfo
PRODUCT_COPY_FILES += \
    $(TARGET_OUT)/usr/share/zoneinfo:recovery/root/system/usr/share/zoneinfo/tzdata

$(call inherit-product, build/target/product/full.mk)

PRODUCT_COPY_FILES += \
	device/htc/htc_a51/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    persist.fuse_sdcard=true \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.bootloader.mode=download \
    persist.sys.usb.config=mass_storage \
    ro.mount.fs=EXT4

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    persist.timed.enable=true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_COPY_FILES_OVERRIDES += \
    root/fstab.goldfish \
    root/ueventd.goldfish.rc

PRODUCT_NAME := full_htc_a51dtul
PRODUCT_DEVICE := htc_a51dtul
