#
# Copyright 2016 The Android Open Source Project
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

# Inherit from these products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# It's 64-bit product
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Release Name
PRODUCT_RELEASE_NAME := cherryk

# Inherit Device Configuration
$(call inherit-product, device/huawei/cherryk/device_cherryk.mk)

# Apps
PRODUCT_PACKAGES += \
	Launcher3 \
	Dialer \
	CarrierConfig \
	FMRadio

# Device Identifiers
PRODUCT_DEVICE := cherryk
PRODUCT_NAME := cm_cherryk
PRODUCT_BRAND := Honor
PRODUCT_MODEL := cherryk
PRODUCT_MANUFACTURER := Huawei

# Inherit Vendor configurations
$(call inherit-product, vendor/huawei/cherryk/vendor_cherryk.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
