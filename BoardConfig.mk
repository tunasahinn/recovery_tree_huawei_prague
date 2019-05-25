#
# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

include build/make/target/board/generic_arm64_a/BoardConfig.mk

DEVICE_PATH := device/huawei/prague

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hisi
TARGET_NO_BOOTLOADER := true

# File System
TARGET_EXFAT_DRIVER := exfat
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false


# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := /dev/null


# Partitions
BOARD_AVB_ENABLE := false
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 32768
BOARD_USES_METADATA_PARTITION := true

TARGET_COPY_OUT_VENDOR := vendor

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.hi6250

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools


# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/public


# TWRP features
TW_THEME := portrait_hdpi
TW_EXCLUDE_SUPERSU := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_NTFS_3G := true

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

TW_BRIGHTNESS_PATH := /sys/class/leds/lcd_backlight0/brightness
TW_NO_SCREEN_BLANK := true
TW_DEFAULT_BRIGHTNESS := "1024"
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/Battery

# Decryption 
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

BOARD_CUSTOM_BOOTIMG_MK := device/huawei/prague/custombootimg.mk