#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v6.3.0
PKG_RELEASE:=3

PKG_SOURCE:=node-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nodejs.org/dist/${PKG_VERSION}
PKG_MD5SUM:=8c14e5c89d66d4d060c91b3ba15dfd31

PKG_BUILD_DEPENDS:=python/host
PKG_INSTALL:=1

PKG_MAINTAINER:=John Crispin <blogic@openwrt.org>
PKG_LICENSE:=

include $(INCLUDE_DIR)/package.mk

define Package/node
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Node.js
  TITLE:=Node.js is a platform built on Chrome's JavaScript runtime
  URL:=http://nodejs.org/
  DEPENDS:=+libpthread +librt +libstdcpp +libopenssl +libuv
endef

define Package/node/description
  Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses
  an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js'
   package ecosystem, npm, is the largest ecosystem of open source libraries in the world.
endef

CONFIGURE_ARGS= \
	--dest-cpu=$(CONFIG_ARCH) \
	--dest-os=linux \
	--with-mips-float-abi=soft \
	--without-snapshot \
	--shared-zlib \
	--shared-openssl \
	--with-intl=none \
	--prefix=/usr

CPUHOST:=$(subst x86_64-linux-gnu,x64,$(subst i686-linux-gnu,x86,$(GNU_HOST_NAME)))

NODEJS:=node-$(PKG_VERSION)-linux-$(CPUHOST).tar.gz

ifeq ($(CPUHOST),x64)
	# NODEJS:=node-$(PKG_VERSION)-linux-x64.tar.gz
	MD5SUM_NODE:=41d14f57079c5935a4f0b470abd9f6b6
endif
ifeq ($(CPUHOST),x86)
	# NODEJS:=node-$(PKG_VERSION)-linux-x86.tar.gz
	MD5SUM_NODE:=99c35fe8ab89183efe9d6d046182f84b
endif

# Distribution URL doesn't always have the correct version
# Using the OpenWrt mirror provides a stable version
define Download/nodebin
  URL:=https://nodejs.org/dist/$(PKG_VERSION)/
  FILE:=$(NODEJS)
  MD5SUM:=$(MD5SUM_NODE)
endef

# Fetch latest nodejs that works
# Yes, I know this is ugly
define Build/Prepare
    $(call Build/Prepare/Default)
	$(eval $(call Download,nodebin))
	$(TAR) -xvf $(DL_DIR)/$(NODEJS) -C $(STAGING_DIR_HOST) --strip-components=1
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef

define Package/node/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/out/Release/node $(1)/usr/bin/
    #
	mkdir -p $(1)/usr/lib/node_modules
	$(CP) $(PKG_BUILD_DIR)/deps/npm $(1)/usr/lib/node_modules
	ln -sf ../lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

$(eval $(call BuildPackage,node))
