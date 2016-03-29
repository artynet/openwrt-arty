#
# Copyright (c) 2013 Arduino LLC. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cpu-mcu-bridge
PKG_VERSION:=1.6.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.arduino.cc/
PKG_MD5SUM:=878d6a8a6a18e1c497bc1665f5e9f0d6

include $(INCLUDE_DIR)/package.mk

define Package/cpu-mcu-bridge
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=CPU-MCU Bridge
  DEPENDS:=+python-base +python-light
endef

define Package/cpu-mcu-bridge/description
 Bridge lets linux and arduino communicate
endef

define Build/Compile
	# NOOP
endef

define Package/cpu-mcu-bridge/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.7/bridge
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.py $(1)/usr/lib/python2.7/bridge

	$(INSTALL_DIR) $(1)/usr/lib/php/bridge
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/php/*.php $(1)/usr/lib/php/bridge
endef

define Package/cpu-mcu-bridge/postrm
#!/bin/sh
# check if we are on a real system
if [ -d $${IPKG_INSTROOT}/usr/lib/python2.7/bridge ]
then
	rm -rf $${IPKG_INSTROOT}/usr/lib/python2.7/bridge 
fi

if [ -d $${IPKG_INSTROOT}/usr/lib/php/bridge ]
then
	rm -rf $${IPKG_INSTROOT}/usr/lib/php/bridge 
fi

exit 0
endef

$(eval $(call BuildPackage,cpu-mcu-bridge))
