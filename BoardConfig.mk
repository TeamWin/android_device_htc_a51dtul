
# inherit from the proprietary version
-include vendor/htc/htc_a51dtul/BoardConfigVendor.mk

# Bootloader
BOARD_VENDOR := htc

TARGET_OTA_ASSERT_DEVICE := a51ul a51dtul a51tuhl htc_a51dtul htc_a51ul htc_a51tuhl
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8939
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405

# Architecture
A51_32_BIT := true
ifneq ($(A51_32_BIT),true)
	TARGET_ARCH := arm64
	TARGET_ARCH_VARIANT := armv8-a
	TARGET_CPU_ABI := arm64-v8a
	TARGET_CPU_ABI2 :=
	TARGET_CPU_VARIANT := generic
	TARGET_2ND_ARCH := arm
	TARGET_2ND_ARCH_VARIANT := armv7-a-neon
	TARGET_2ND_CPU_ABI := armeabi-v7a
	TARGET_2ND_CPU_ABI2 := armeabi
	TARGET_2ND_CPU_VARIANT := cortex-a53
	TARGET_BOARD_SUFFIX := _64
	TARGET_USES_64_BIT_BINDER := true
else
	TARGET_ARCH := arm
	TARGET_ARCH_VARIANT := armv7-a-neon
	TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
	TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
	TARGET_CPU_ABI := armeabi-v7a
	TARGET_CPU_ABI2 := armeabi
	TARGET_CPU_VARIANT := cortex-a53
endif
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := htc_a51dtul
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

#Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci
ifneq ($(A51_32_BIT),true)
	BOARD_KERNEL_BASE := 0x80078000
else
	BOARD_KERNEL_BASE := 0x80000000
endif
BOARD_KERNEL_PAGESIZE := 2048
ifneq ($(A51_32_BIT),true)
	TARGET_KERNEL_ARCH := arm64
	TARGET_KERNEL_SOURCE := kernel/htc/msm8939_64
	TARGET_KERNEL_CONFIG := a51dtul-64_defconfig
	TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
	TARGET_KERNEL_HEADER_ARCH := arm64
	TARGET_USES_UNCOMPRESSED_KERNEL := false
	BOARD_KERNEL_IMAGE_NAME := Image.gz
	BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01f88000 --tags_offset 0x01d88000
else
	TARGET_KERNEL_SOURCE := kernel/htc/msm8939
	TARGET_KERNEL_CONFIG := a51dtul_defconfig
	BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02008000 --tags_offset 0x01e00000 --dt device/htc/htc_a51dtul/dt.img
endif
KERNEL_EXFAT_MODULE_NAME := "exfat"

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4697620480
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10200547328
BOARD_CACHEIMAGE_PARTITION_SIZE := 335544320
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
#Screen
TARGET_RECOVERY_SCREEN_WIDTH := 720x1280
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Pixel Format RGBX
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

#Pixel if or? And configure KERNEL_OBJ
TARGET_USES_QCOM_BSP := false
#BOARD_CUSTOM_GRAPHICS := device/htc/htc_a51dtul/recovery/graphics_cn.c

#Keys
BOARD_CUSTOM_RECOVERY_KEYMAPPING := device/htc/htc_a51dtul/recovery/recovery_keys.c

TARGET_QCOM_DISPLAY_VARIANT := caf-new

#Init
TARGET_RECOVERY_INITRC := device/htc/htc_a51dtul/recovery/root/init.rc

#mmcutils
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true

#Fstab
TARGET_RECOVERY_FSTAB := device/htc/htc_a51dtul/rootdir/etc/recovery.fstab

#/data/media/0 Storage
RECOVERY_USE_MIGRATED_STORAGE := true
#RECOVERY_NEED_SELINUX_FIX := true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

#Virtual Key
RECOVERY_USE_VIRTUAL_KEY := true

#Fix Wipe
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

#TWRP flags
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_DUMLOCK := true

