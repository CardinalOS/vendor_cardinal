#
# Copyright (C) 2024 CardinalOS
#
# SPDX-License-Identifier: Apache-2.0
#

include vendor/cardinal/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/cardinal/config/BoardConfigSoong.mk
