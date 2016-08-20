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

# AAPT high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := 320dpi

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Build Props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	ro.magic.api.version=0.1 \
	persist.sys.usb.config=manufacture,adb \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320 \
	hw.lcd.lcd_density=320 \
	debug.atrace.tags.enableflags=0

# Operator Name Database (for automatic recognition of network and APN)
PRODUCT_COPY_FILES :=  \
	$(LOCAL_PATH)/global/voicemail-conf.xml:system/etc/voicemail-conf.xml \
	$(LOCAL_PATH)/global/virtualNets-conf-nolte.xml:system/etc/virtualNets-conf.xml \
	$(LOCAL_PATH)/global/apns-conf.xml:system/etc/apns-conf.xml \
	$(LOCAL_PATH)/global/globalAutoAdapt-conf.xml:system/etc/globalAutoAdapt-conf.xml \
	$(LOCAL_PATH)/global/globalMatchs-conf.xml:system/etc/globalMatchs-conf.xml \
	$(LOCAL_PATH)/global/ons/net_example.txt:system/etc/ons/net_example.txt \
	$(LOCAL_PATH)/global/ons/ons.bin:system/etc/ons/ons.bin \
	$(LOCAL_PATH)/global/xml/hw_defaults.xml:system/etc/xml/hw_defaults.xml \
	$(LOCAL_PATH)/global/xml/mccTable_V2.xml:system/etc/xml/mccTable_V2.xml

# Ramdisk
$(call inherit-product, $(LOCAL_PATH)/ramdisk/ramdisk_cherryk.mk)

# Add openssh support for remote debugging and job submission
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh uim

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Build BT a2dp audio HAL
PRODUCT_PACKAGES += audio.a2dp.default

# Needed to sync the system clock with the RTC clock
PRODUCT_PACKAGES += hwclock

# Include USB speed switch App
PRODUCT_PACKAGES += UsbSpeedSwitch

# Build libion for new double-buffering HDLCD driver
PRODUCT_PACKAGES += libion

# Build gatord daemon for DS-5/Streamline
PRODUCT_PACKAGES += gatord

# Build gralloc for Juno
PRODUCT_PACKAGES += gralloc.hi6210sft

# OpenGL Renderer
PRODUCT_PACKAGES += libGLES_android

# Force disable Strict Mode
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

# Dalvik Flags
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# HWUI Memory Config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-hwui-memory.mk)

# Off charging mode
PRODUCT_PACKAGES += \
    charger_res_images

# Time Zone data
PRODUCT_COPY_FILES += \
	bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    audioril.lib=libhuawei-audio-ril.so \
    ro.telephony.ril_class=HuaweiRIL

# Audio Packages
#PRODUCT_PACKAGES += \
#    audio.primary.default \
#    audio_policy.stub \
#   audio.a2dp.default \
#   audio.usb.default \
#    audio.r_submix.default \
#    sound_trigger.primary.hi6210sft \
#   libaudioutils \
#    libtinyalsa \
#    tinyplay \
#    tinycap \
#    tinymix \
#   tinypcminfo

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.no_hw_vsync=1 \
    ro.secure=0 \
    ro.adb.secure=0
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

# WiFi Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/hostapd_hisi.conf:system/etc/wifi/hostapd_hisi.conf \
	$(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
	wpa_supplicant \
	wpa_supplicant.conf \
	hostapd \
	libwpa_client \
	libwpa_cli \
	dhcpcd.conf \
	libwifi-service \
	dhcpcd

# Camera
PRODUCT_PACKAGES += \
	camera.default \
	camera.hi6210sft

# libhi6210sft (contains symbols, thanks to @XePeleato)
PRODUCT_PACKAGES += libhi6210sft

# Build Hardware Composer
PRODUCT_PACKAGES += hwcomposer.hi6210sft

# Shim Libraries (will be added after fixed boot)
#PRODUCT_PACKAGES += \
#	libboringssl-compat \
#	libhw_cutils \
#	libhw_gui \
#	libhw_log

# Security Enhanced Linux Configurations
$(call inherit-product, $(LOCAL_PATH)/selinux/selinux_cherryk.mk)


# Audio Configurations
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
#	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Media Profiles (Patched)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Bluetooth Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(LOCAL_PATH)/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf

# GPS Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# Thermal Configurations (These will be added later)

# CPU Profiles (These will be added later)

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# USB OTG support
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true

# Additional Packages
PRODUCT_PACKAGES += \
	Torch \
	com.android.future.usb.accessory

# Security Enhanced Linux
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.boot.selinux=0
