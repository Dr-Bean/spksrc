PKG_NAME = rtmpdump
PKG_VERS = 2.4
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-git$(PKG_GIT_HASH).$(PKG_EXT)
PKG_DIST_SITE = git://github.com/BurntSushi/rtmpdump-ksv.git
PKG_DIR = $(PKG_NAME)-git$(PKG_GIT_HASH)
PKG_DOWNLOAD_METHOD = git
PKG_GIT_HASH = 550a0ca

DEPENDS = cross/openssl

HOMEPAGE = http://rtmpdump.mplayerhq.hu/
COMMENT  = rtmpdump is a toolkit for RTMP streams. All forms of RTMP are supported, including rtmp://, rtmpt://, rtmpe://, rtmpte://, and rtmps://.
LICENSE  = GPLv2

CONFIGURE_TARGET = Nope
COMPILE_TARGET = myCompile

include ../../mk/spksrc.cross-cc.mk

myCompile:
	$(RUN) make SYS=posix prefix=$(INSTALL_PREFIX) CROSS_COMPILE=$(TC_PATH)$(TC_PREFIX) INC=-I$(STAGING_INSTALL_PREFIX) LDFLAGS=" $(LDFLAGS)"