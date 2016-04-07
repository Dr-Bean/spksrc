PKG_NAME = geogig
PKG_VERS = 1.0-RC1a
PKG_EXT = zip
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://sourceforge.net/projects/$(PKG_NAME)/files/$(PKG_NAME)-$(PKG_VERS)
PKG_DIR = geogig


DEPENDS =

HOMEPAGE = http://geogig.org
COMMENT  = Distributed Version Control System for geospatial data
LICENSE  = Eclipse Distribution License

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myInstall
myInstall:
	mkdir -p $(STAGING_INSTALL_PREFIX)/share/geogig
	tar -cf - -C $(WORK_DIR)/$(PKG_DIR) . | tar -xf - -C $(STAGING_INSTALL_PREFIX)/share/geogig
