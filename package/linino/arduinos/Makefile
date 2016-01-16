#
# Copyright (c) 2015 Arduino Srl - All rights reserved.
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arduinos
PKG_VERSION:=2.0
PKG_REVISION:=cd7aec9
PKG_RELEASE:=$(PKG_REVISION)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_REVISION).tar.gz
PKG_SOURCE_URL:=http://download.linino.org/sources
PKG_MD5SUM:=943fe0a006419b7c1b7c15f322069103
PKG_BUILD_DIR:=$(BUILD_DIR)/arduinos-$(PKG_REVISION)

include $(INCLUDE_DIR)/package.mk

define Package/arduinos
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=The new Linino configuration panel based on Os.js
  DEPENDS:=+luci +luci-lib-json +uhttpd-mod-lua +lua-coxpcall +lua-wsapi-base +lua-wsapi-xavante +lua-base64 +lua-xavante +luafilesystem +iw +shellinabox
endef

define Package/arduinos/description
	The new Linino configuration panel based on Os.js
endef

define Build/Compile
	# NOOP
endef

define Package/arduinos/install
	$(INSTALL_DIR) $(1)/
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d

	$(CP) -R $(PKG_BUILD_DIR)/osjs $(1)/

	# $(CP) -R $(PKG_BUILD_DIR)/lua/osjs $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/lua/osjs.lua $(1)/usr/lib/lua

	$(INSTALL_BIN) files/osjs-init.sh $(1)/etc/init.d/osjs-init
endef

define Package/arduinos/postinst
#!/bin/sh
if [ -e /etc/config/uhttpd ]
then
	# make the webserver ponting to /osjs instead of /www
	sed -i -e 's/www/osjs\/dist/g' /etc/config/uhttpd /etc/config/uhttpd

	# Linking LUci
	mkdir -p /osjs/dist/luci
	ln -sf /www/index.html /osjs/dist/luci/index.html
	ln -sf /www/luci-static /osjs/dist/luci-static
	ln -sf /www/cgi-bin/luci /osjs/dist/cgi-bin/luci

	# Restarting uHttp server
	/etc/init.d/uhttpd restart
fi
exit 0
endef

define Package/arduinos/postrm
#!/bin/sh
if [ -e /etc/config/uhttpd ] && [ -d /osjs ]
then
	# restoring orinal entry to /www
    sed -i -e 's/osjs\/dist/www/g' /etc/config/uhttpd /etc/config/uhttpd

	# cleaning ArduinoOs files
	# rm -rf /usr/lib/lua/osjs
	rm -rf /osjs

	# Restarting uHttp server
	/etc/init.d/uhttpd restart
fi
exit 0
endef

$(eval $(call BuildPackage,arduinos))
