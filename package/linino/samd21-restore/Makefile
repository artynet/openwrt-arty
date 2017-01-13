#
# Copyright (c) 2013 Arduino Srl. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=samd21-restore
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/samd21-restore
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=Simple script to restore SAMD21 mcu
  DEPENDS:=+kmod-loop
endef

define Build/Compile
	# NOOP
endef

define Package/samd21-restore/install
	$(INSTALL_DIR) $(1)/usr/bin/
	
	$(INSTALL_BIN) ./files/samd21-restore $(1)/usr/bin
endef

$(eval $(call BuildPackage,samd21-restore))

