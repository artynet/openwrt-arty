#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python-expat
$(call Package/python/Default)
  TITLE:=Python $(PYTHON_VERSION) expat module
  DEPENDS:=+python-light +libexpat
endef

$(eval $(call PyBasePackage,python-expat, \
	/usr/lib/python$(PYTHON_VERSION)/lib-dynload/pyexpat.so \
))
