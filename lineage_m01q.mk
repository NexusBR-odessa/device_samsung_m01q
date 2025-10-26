
#
# Copyright (C) 2021 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from m01q device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_m01q
PRODUCT_DEVICE := m01q
PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-M015G

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="m01qins-user 11 RP1A.200720.012 M015GXXU3BUH1 release-keys"

BUILD_FINGERPRINT := samsung/m01qins/m01q:11/RP1A.200720.012/M015GXXU3BUH1:user/release-keys
# Desabilita a inclusão de módulos de teste que não são essenciais para a ROM
BOARD_EXCLUDE_TEST_MODULES := true

# Exclui explicitamente o módulo problemático e qualquer coisa relacionada a testes de plataforma
PRODUCT_PACKAGES := $(filter-out BluetoothInstrumentationTests, $(PRODUCT_PACKAGES))
PRODUCT_PACKAGES := $(filter-out continuous_instrumentation_tests, $(PRODUCT_PACKAGES))

TARGET_PREBUILT_KERNEL := device/samsung/m01q/prebuilt/zImage
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel
