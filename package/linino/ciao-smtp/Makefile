#
# Copyright (c) 2015 Arduino Srl. All right reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_CONNECTOR:=smtp
PKG_NAME:=ciao-connector-$(PKG_CONNECTOR)
PKG_REVISION:=64f5a1a36910b80d62463a7433b00d63049606f5
PKG_VERSION:=0.0.1
PKG_RELEASE:=3
PKG_INST_DIR:=/root/.ciao
PKG_CONF_DIR:=/usr/lib/python2.7/ciao/conf

PKG_SOURCE_PROTO:=git
PKG_SOURCE_USERNAME:=arduino-org
PKG_SOURCE_NAME:=ciao-connector-$(PKG_CONNECTOR)
PKG_SOURCE_URL:=https://github.com/$(PKG_SOURCE_USERNAME)/$(PKG_SOURCE_NAME).git

PKG_SOURCE:=$(PKG_NAME)-$(PKG_REVISION).tar.gz

PKG_SOURCE_VERSION:=$(PKG_REVISION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REVISION)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_REVISION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Ciao
  TITLE:=Arduino Ciao $(PKG_CONNECTOR) Connector
  DEPENDS:=+ciao +python-email
endef

define Package/ciao-$(PKG_CONNECTOR)/description
    Arduino Ciao - $(PKG_CONNECTOR) client connector library.
endef

define Build/Compile
    # NOOP
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)$(PKG_INST_DIR)/$(PKG_CONNECTOR)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(PKG_CONNECTOR)/$(PKG_CONNECTOR).json.conf $(1)$(PKG_INST_DIR)/$(PKG_CONNECTOR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_CONNECTOR)/*.py $(1)$(PKG_INST_DIR)/$(PKG_CONNECTOR)

	$(INSTALL_DIR) $(1)$(PKG_CONF_DIR)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(PKG_CONNECTOR).ciao.json.conf $(1)$(PKG_CONF_DIR)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
