#
# Copyright (C) 2019 The ArrowOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/coolpad/c106

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8952
TARGET_BOARD_PLATFORM_GPU := qcom-adreno510

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

TARGET_CPU_CORTEX_A53 := true

TARGET_USES_64_BIT_BINDER := true

BUILD_BROKEN_PHONY_TARGETS := true

ENABLE_CPUSETS := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8952

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci earlyprintk loop.max_part=7
BOARD_KERNEL_CMDLINE += skip_initramfs rootwait ro init=/init root=/dev/dm-0 dm=\"system none ro,0 1 android-verity /dev/mmcblk0p27\"
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x00000100
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

TARGET_KERNEL_ARCH := arm64

TARGET_KERNEL_SOURCE := kernel/coolpad/msm8976
TARGET_KERNEL_CONFIG := lineage_c106_defconfig

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Properties
BOARD_VNDK_RUNTIME_DISABLE := true

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_APE_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_VBAT_MONITOR := true
AUDIO_FEATURE_ENABLED_VOICE_CONCURRENCY :=true
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_WMA_OFFLOAD := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
TARGET_USE_QTI_BT_STACK := true

# Camera
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/vendor/bin/mm-qcamera-daemon=27
# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# This is needed for us as it disables tcache, which is breaking camera.
MALLOC_SVELTE := true
BOARD_GLOBAL_CFLAGS += -DDECAY_TIME_DEFAULT=0

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HEALTHD_CUSTOM_CHARGER_RES := $(DEVICE_PATH)/charger/images
BACKLIGHT_PATH := "/sys/class/leds/lcd-backlight/brightness"
BLINK_PATH := "/sys/class/leds/red/blink"
WITH_LINEAGE_CHARGER := false

# CNE
BOARD_USES_QCNE := true

# CSVT
TARGET_USES_CSVT := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
      DONT_DEXPREOPT_PREBUILTS := true
      USE_DEX2OAT_DEBUG := false
      WITH_DEXPREOPT_DEBUG_INFO := false
    endif
  endif
endif

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_AOSP_WFD := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
USE_PREFERRED_CAMERA_FORMAT := true
TARGET_USES_OVERLAY := true
TARGET_USES_NEW_ION_API :=true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# Extended filesystem support
TARGET_EXFAT_DRIVER := sdfat

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432

# Filesystem Config
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# GPS
USE_DEVICE_SPECIFIC_GPS := true
USE_DEVICE_SPECIFIC_LOC_API := true
TARGET_NO_RPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(DEVICE_PATH)/compatibility_matrix.xml

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_s2
TARGET_RECOVERY_DEVICE_MODULES := //$(DEVICE_PATH):libinit_s2

# IPA
USE_DEVICE_SPECIFIC_DATA_IPA_CFG_MGR := true

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_RPM_SYSTEM_STAT := /d/rpm_stats
TARGET_USES_INTERACTION_BOOST := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true

# Render
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
TARGET_USES_OLD_MNC_FORMAT := true
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# SELinux
#include device/qcom/sepolicy/sepolicy.mk
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/legacy

# System As Root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_ROOT_EXTRA_FOLDERS := persist
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

# Shims
TARGET_LD_SHIM_LIBS := \
   /system/lib64/lib-imsvt.so|libshims_ims.so \
   /vendor/bin/mm-qcamera-daemon|libshims_camera.so \
   /system/lib64/hw/gxfingerprint.default.so|fakelogprint.so \
   /system/lib64/hw/fingerprint.vendor.msm8952.so|fakelogprint.so \
   /vendor/bin/gx_fpd|fakelogprint.so \
   /vendor/lib/hw/camera.msm8952.so|libcamera_shim.so

# Telephony
TARGET_USES_ALTERNATIVE_MANUAL_NETWORK_SELECT := true

# Wifi
BOARD_HAS_QCOM_WLAN			:= true
BOARD_HAS_QCOM_WLAN_SDK			:= true
BOARD_WLAN_DEVICE			:= qcwcn
BOARD_HOSTAPD_DRIVER			:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB		:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER		:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB	:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP			:= "ap"
WIFI_DRIVER_FW_PATH_STA			:= "sta"
WPA_SUPPLICANT_VERSION			:= VER_0_8_X
PRODUCT_VENDOR_MOVE_ENABLED		:= true
TARGET_DISABLE_WCNSS_CONFIG_COPY	:= true
TARGET_USES_WCNSS_MAC_ADDR_REV		:= true
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

#Enable DRM plugins 64 bit compilation
TARGET_ENABLE_MEDIADRM_64 := true

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := c106,C106,c103,C103,cool_c1,le_c106,aosp_c106

# inherit from the proprietary version
-include vendor/coolpad/c106/BoardConfigVendor.mk
