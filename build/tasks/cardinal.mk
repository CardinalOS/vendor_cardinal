#
# Copyright (C) 2023 CardinalOS
#
# SPDX-License-Identifier: Apache-2.0
#

CARDINAL_ZIP_NAME := $(CARDINAL_VERSION).zip

.PHONY: cardinal
cardinal: $(INTERNAL_OTA_PACKAGE_TARGET)
	@echo "CardinalOS OTA package"
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(CARDINAL_TARGET_PACKAGE)
	@echo ""
	@echo "Package Completed:"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "Zip: $(CARDINAL_TARGET_PACKAGE)"
	@echo "Size: `du -h "$(CARDINAL_TARGET_PACKAGE)" | cut -f1`"
	@echo "SHA256: `sha256sum $(CARDINAL_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "MD5: `md5sum $(CARDINAL_TARGET_PACKAGE) | cut -f 1 -d " "`"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "" >&2

.PHONY: bacon
bacon: cardinal
