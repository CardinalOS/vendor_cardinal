#
# Copyright (C) 2023 CardinalOS
#
# SPDX-License-Identifier: Apache-2.0
#

OFFICIAL_KEEPER = $(shell cat cardinal-keepers/keepers.list | awk '{ print $$1 }')

ifdef CARDINAL_KEEPER
ifeq ($(filter $(CARDINAL_KEEPER), $(OFFICIAL_KEEPER)), $(CARDINAL_KEEPER))
$(warning "$(CARDINAL_KEEPER) is verified as official keeper, build as official build.")
    CARDINAL_DEVELOPER := true
    CARDINAL_BUILD_TYPE := REL
else
$(warning "Unofficial keeper detected, building as unofficial build.")
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   org.cardinal.keeper=$(CARDINAL_KEEPER)
else
$(warning "No keeper name detected, building as unofficial build.")
endif
