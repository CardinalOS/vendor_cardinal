#
# Copyright (C) 2023 CardinalOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_BRAND ?= CardinalOS

# CardinalOS makefiles
$(call inherit-product, vendor/cardinal/config/cardinal_packages.mk)
$(call inherit-product, vendor/cardinal/config/cardinal_properties.mk)
$(call inherit-product, vendor/cardinal/config/cardinal_version.mk)

# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/cardinal/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/cardinal/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/cardinal/prebuilt/common/bin/50-cardinal.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-cardinal.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/addon.d/50-cardinal.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/cardinal/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/cardinal/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/cardinal/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/backuptool_ab.sh \
    system/bin/backuptool_ab.functions \
    system/bin/backuptool_postinstall.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Cardinal-specific init rc file
PRODUCT_COPY_FILES += \
    vendor/cardinal/prebuilt/common/etc/init/init.cardinal-system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.cardinal-system_ext.rc

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_045e_Product_0719.kl

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

ifneq ($(TARGET_DISABLE_EPPE),true)
# Require all requested packages to exist
$(call enforce-product-packages-exist-internal,$(wildcard device/*/$(CARDINAL_BUILD)/$(TARGET_PRODUCT).mk),product_manifest.xml rild Calendar Launcher3 Launcher3Go Launcher3QuickStep Launcher3QuickStepGo android.hidl.memory@1.0-impl.vendor vndk_apex_snapshot_package)
endif

# Bootanimation
TARGET_SCREEN_WIDTH ?= 1080
TARGET_SCREEN_HEIGHT ?= 1920
PRODUCT_PACKAGES += \
    bootanimation.zip

# SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.systemuicompilerfilter=speed

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/cardinal/overlay/no-rro
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/cardinal/overlay/common \
    vendor/cardinal/overlay/no-rro

-include $(WORKSPACE)/build_env/image-auto-bits.mk

