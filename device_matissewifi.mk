#
# Copyright (C) 2015 The AOSParadox Project
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
#

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS += device/samsung/matissewifi/overlay
PRODUCT_PACKAGE_OVERLAYS += device/samsung/matissewifi/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/samsung/matissewifi/matissewifi-vendor.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    device/samsung/matissewifi/platform.xml:system/etc/permissions/platform.xml

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Extra tools from CM
PRODUCT_PACKAGES += \
	e2fsck \
	mke2fs \
	tune2fs \
	mount.exfat \
	fsck.exfat \
	mkfs.exfat \
	ntfsfix \
	ntfs-3g

# Packs
PRODUCT_PACKAGES += \
    libssh \
	ssh \
	sftp \
	scp \
	sshd \
	ssh-keygen \
	start-ssh

PRODUCT_PACKAGES += \
	ROMSettings \
	LayerManager

#CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch=LA.BF.1.1.2_rb1.24

#WCNSS
PRODUCT_PACKAGES += \
    WCNSS_qcom_wlan_factory_nv.bin \
    WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    device/qcom/msm8226/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/matissewifi/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/matissewifi/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/matissewifi/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/matissewifi/prebuilt/system,system)

#Call CodeAurora MSM8226 Tree
include device/qcom/msm8226/msm8226.mk

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Audio
PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.24bit.enable=false \
    audio.offload.multiple.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
    av.streaming.offload.enable=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.calfile0=/etc/Bluetooth_cal.acdb \
    persist.audio.calfile1=/etc/General_cal.acdb \
    persist.audio.calfile2=/etc/Global_cal.acdb \
    persist.audio.calfile3=/etc/Handset_cal.acdb \
    persist.audio.calfile4=/etc/Hdmi_cal.acdb \
    persist.audio.calfile5=/etc/Headset_cal.acdb \
    persist.audio.calfile6=/etc/Speaker_cal.acdb

PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.fm_max_volume=4096

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bt.le_dev_pwr_class=1 \
    ro.bluetooth.dun=false \
    ro.qualcomm.bt.hci_transport=smd \
    ro.bluetooth.sap=false \
    ro.qualcomm.bluetooth.sap=false \
    ro.qualcomm.bluetooth.ftp=true \
    ro.qualcomm.bluetooth.hfp=true \
    ro.qualcomm.bluetooth.hsp=true \
    ro.qualcomm.bluetooth.map=true \
    ro.qualcomm.bluetooth.nap=true \
    ro.qualcomm.bluetooth.opp=true \
    ro.qualcomm.bluetooth.pbap=true

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.enabletr=0 \
    ro.sf.lcd_density=160

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.agps_provider=1 \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5 \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.services.location

# Hardware
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=1

# Keystore
PRODUCT_PACKAGES += \
    keystore.qcom

# Lights
PRODUCT_PACKAGES += \
    lights.msm8226

# Media codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Power
PRODUCT_PACKAGES += \
    power.msm8226 \
    power.qcom

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    ro.qualcomm.cabl=0 \
    ro.vendor.extension_library=/system/vendor/lib/libqc-opt.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.dfr_mode_set=1 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.call_type=1

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true \
    persist.fuse_sdcard=true \
    ro.crypto.fuse_sdcard=true

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	device/qcom/msm8226/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    vendor/qcom/opensource/wlan/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat 

PRODUCT_PACKAGES += \
    libcurl \
    libqsap_sdk \
    libQWiFiSoftApCfg \
	libwcnss_qmi \
    wcnss_service	

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.qc.sub.rdump.on=1 \
    persist.sys.ssr.restart_level=3 \
    persist.sys.qc.sub.rdump.max=0 \
    wifi.interface=wlan0
