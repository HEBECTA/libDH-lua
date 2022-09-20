include $(TOPDIR)/rules.mk

PKG_NAME:=libDH-lua
PKG_RELEASE:=1
PKG_VERSION:=1.0.0

include $(INCLUDE_DIR)/package.mk

define Package/libDH-lua
	DEPENDS:=+libopenssl +liblua
	CATEGORY:=Libraries
	TITLE:=libDH-lua
endef

define Package/libDH-lua/description
	Library for lua. Using openssl lib in c to generate Diffie-Hellman file.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib $(1)/usr/include
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libdh_lua.so $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dh_gen.h $(1)/usr/include/
endef

define Package/libDH-lua/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libdh_lua.so $(1)/usr/lib
endef

$(eval $(call BuildPackage,libDH-lua))