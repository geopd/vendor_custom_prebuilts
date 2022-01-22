# Copyright (C) 2018 The LineageOS Project
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

VENDOR_PATH := vendor/custom/prebuilts

# CAMERA
ifeq ($(WITH_MIUICAM),true)
# Inherit from MiuiCamera
$(call inherit-product, vendor/custom/prebuilts/MiuiCamera/config.mk)
else
# Include CameraGo
PRODUCT_PACKAGES += \
    CameraGo
endif

ifeq ($(USE_GDIALER),true)
PRODUCT_PACKAGES += \
    GoogleContacts \
    GoogleDialer \
    PrebuiltBugle \
    com.google.android.dialer.support

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/custom/prebuilts/MinGapps/overlay

PRODUCT_COPY_FILES += \
    vendor/custom/prebuilts/MinGapps/etc/default-permissions/default-permissions-dialer.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-dialer.xml \
    vendor/custom/prebuilts/MinGapps/etc/permissions/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.dialer.support.xml \
    vendor/custom/prebuilts/MinGapps/etc/permissions/privapp-permissions-google-dialer.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-dialer.xml
endif
