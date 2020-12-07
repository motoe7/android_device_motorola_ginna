#
# Copyright (C) 2019 The LineageOS Open Source Project
# Copyright (C) 2020 The LibreMobileOS Foundation
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LMODroid stuff
$(call inherit-product, vendor/lmodroid/config/common_full_phone.mk)

# Inherit from ginna device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE  := true
PRODUCT_BUILD_ODM_IMAGE := false
PRODUCT_BUILD_VENDOR_IMAGE := true

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

PRODUCT_BUILD_RAMDISK_IMAGE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_BUILD_RETROFIT_DYNAMIC_PARTITIONS_OTA_PACKAGE := false
BOARD_USES_RECOVERY_AS_BOOT := false

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := ginna
PRODUCT_MANUFACTURER := motorola
PRODUCT_NAME := lmodroid_ginna
PRODUCT_MODEL := moto e(7)
PRODUCT_SHIPPING_API_LEVEL := 29

PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=ginna \
        PRIVATE_BUILD_DESC="ginna-user 10 QPG30.82-105 80737 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := motorola/ginna_retail/ginna:10/QPG30.82-105/80737:user/release-keys
