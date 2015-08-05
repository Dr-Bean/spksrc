PKG_NAME = softether
PKG_VERS = 4.18-9570
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-src-v$(PKG_VERS)-rtm.$(PKG_EXT)
PKG_DIST_SITE = http://www.softether-download.com/files/softether/v$(PKG_VERS)-rtm-2015.07.26-tree/Source_Code/
PKG_DIR = v$(PKG_VERS)

DEPENDS = cross/glib cross/ncurses cross/readline cross/openssl

HOMEPAGE = https://www.softether.org
COMMENT  = SoftEther VPN is one of the most powerful and easiest VPN software in the world. It is freeware, developed as an academic research project in University of Tsukuba, Japan.
LICENSE  = GNU GPLv2

CONFIGURE_TARGET = myConfigure
INSTALL_TARGET = nop

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	cp $(WORK_DIR)/$(PKG_DIR)/src/makefiles/linux_32bit.mak $(WORK_DIR)/$(PKG_DIR)/Makefile
