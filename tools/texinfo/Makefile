# 
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=texinfo
PKG_VERSION:=6.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_MD5SUM:=3859a67eb6bad23fcd36250e18720871

HOST_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk

$(eval $(call HostBuild))
