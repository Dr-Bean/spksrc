PKG_NAME = libvpx
PKG_VERS = 1.3.0
PKG_EXT = tar.bz2
PKG_DIST_NAME = $(PKG_NAME)-v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://webm.googlecode.com/files
PKG_DIR = $(PKG_NAME)-v$(PKG_VERS)

DEPENDS = 

HOMEPAGE = http://www.webmproject.org/code/
COMMENT  =

CONFIGURE_ARGS = --disable-sse --disable-sse2 --disable-sse3 --disable-ssse3 --disable-sse4_1 --enable-shared --enable-vp8 --enable-vp9 --disable-examples --disable-docs --enable-postproc --enable-vp9-postproc --enable-pic --disable-altivec --disable-unit_tests --prefix=$(INSTALL_PREFIX)
 
include ../../mk/spksrc.cross-cc.mk

ENV = DESTDIR=$(INSTALL_DIR) CROSS=$(TC_PATH)$(TC_PREFIX) LDFLAGS="$(LDFLAGS)" CFLAGS="$(CFLAGS)" #AS="$(TC_PATH)$(TC_PREFIX)as" 

ifeq ($(findstring $(ARCH),$(ARM5_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --target=armv5te-linux-gcc #--disable-use_x86inc 
endif
ifeq ($(findstring $(ARCH),$(ARM7_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --target=armv7-linux-gcc #--disable-use_x86inc 
endif
ifeq ($(findstring $(ARCH),$(x86_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --target=x86-linux-gcc
endif
ifeq ($(findstring $(ARCH),$(x64_ARCHES)),$(ARCH))
DEPENDS += native/yasm
ENV += PATH=$(WORK_DIR)/../../../native/yasm/work-native/install/usr/local/bin/:$$PATH
CONFIGURE_ARGS += --target=x86_64-linux-gcc --as=auto
endif
