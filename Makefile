include $(TOPDIR)/rules.mk

PKG_NAME:=libdh-lua
PKG_RELEASE:=1
PKG_VERSION:=1.0.0

include $(INCLUDE_DIR)/package.mk

define Package/libdh-lua
	DEPENDS:=+libopenssl +liblua
	CATEGORY:=Libraries
	TITLE:=libdh-lua
endef

define Package/libdh-lua/description
	Library for lua. Using openssl lib in c to generate Diffie-Hellman file.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gen_dh_lua.so $(1)/usr/lib/lua
endef

define Package/libdh-lua/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gen_dh_lua.so $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,libdh-lua))