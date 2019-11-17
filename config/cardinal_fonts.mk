#
# Copyright (C) 2023 CardinalOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Google fonts
PRODUCT_COPY_FILES += \
    vendor/cardinal/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \
    vendor/cardinal/fonts/ArbutusSlab-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ArbutusSlab-Regular.ttf \
    vendor/cardinal/fonts/GoogleSans-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-BoldItalic.ttf \
    vendor/cardinal/fonts/GoogleSans-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Bold.ttf \
    vendor/cardinal/fonts/GoogleSans-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Italic.ttf \
    vendor/cardinal/fonts/GoogleSans-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-MediumItalic.ttf \
    vendor/cardinal/fonts/GoogleSans-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Medium.ttf \
    vendor/cardinal/fonts/GoogleSans-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/GoogleSans-Regular.ttf \
    vendor/cardinal/fonts/Lato-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-BoldItalic.ttf \
    vendor/cardinal/fonts/Lato-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Bold.ttf \
    vendor/cardinal/fonts/Lato-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Italic.ttf \
    vendor/cardinal/fonts/Lato-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-MediumItalic.ttf \
    vendor/cardinal/fonts/Lato-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Medium.ttf \
    vendor/cardinal/fonts/Lato-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Lato-Regular.ttf \
    vendor/cardinal/fonts/Rubik-BoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-BoldItalic.ttf \
    vendor/cardinal/fonts/Rubik-Bold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Bold.ttf \
    vendor/cardinal/fonts/Rubik-Italic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Italic.ttf \
    vendor/cardinal/fonts/Rubik-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-MediumItalic.ttf \
    vendor/cardinal/fonts/Rubik-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Medium.ttf \
    vendor/cardinal/fonts/Rubik-Regular.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/Rubik-Regular.ttf \
    vendor/cardinal/fonts/ZillaSlab-MediumItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-MediumItalic.ttf \
    vendor/cardinal/fonts/ZillaSlab-Medium.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-Medium.ttf \
    vendor/cardinal/fonts/ZillaSlab-SemiBoldItalic.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-SemiBoldItalic.ttf \
    vendor/cardinal/fonts/ZillaSlab-SemiBold.ttf:$(TARGET_COPY_OUT_PRODUCT)/fonts/ZillaSlab-SemiBold.ttf

PRODUCT_PACKAGES += \
    FontArbutusSourceOverlay \
    FontArvoLatoOverlay \
    FontRubikRubikOverlay \
    FontGoogleSansLatoOverlay \
    FontGoogleSansOverlay
