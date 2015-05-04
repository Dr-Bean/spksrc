PKG_NAME = ffmpeg
PKG_VERS = 2.6
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://www.ffmpeg.org/releases/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/x264 cross/lame cross/fdk-aac cross/speex cross/flac cross/libvorbis 
DEPENDS += cross/freetype cross/openssl cross/libass cross/libbluray cross/openjpeg 
DEPENDS += cross/libopus cross/libtheora cross/rtmpdump cross/libvpx

HOMEPAGE = http://www.ffmpeg.org/
COMMENT  = FFmpeg is a complete, cross-platform solution to record, convert and stream audio and video. It includes libavcodec - the leading audio/video codec library
LICENSE  =

CONFIGURE_ARGS = --enable-gpl --enable-version3 --enable-nonfree --enable-cross-compile --enable-rpath --target-os=linux --cross-prefix=$(TC_PATH)$(TC_PREFIX) --prefix=$(INSTALL_PREFIX) --extra-cflags="-I$(WORK_DIR)/install$(INSTALL_PREFIX)/include" --extra-ldflags="-L$(WORK_DIR)/install$(INSTALL_PREFIX)/lib" --extra-libs="-lxml2 -ldl"
CONFIGURE_ARGS += --disable-doc --disable-htmlpages --disable-manpages --disable-podpages --disable-txtpages --pkg-config=/usr/bin/pkg-config 
CONFIGURE_ARGS += --enable-pic --disable-debug --enable-pthreads --enable-thumb #--disable-optimizations --disable-runtime-cpudetect
CONFIGURE_ARGS += --enable-libx264 --enable-libmp3lame --enable-libfdk-aac --enable-libspeex --enable-openssl --enable-libvorbis --enable-gpl --enable-nonfree 
CONFIGURE_ARGS += --enable-libass --enable-libbluray --enable-libopenjpeg --enable-libopus --enable-libtheora --enable-librtmp --enable-fontconfig --enable-libfreetype
CONFIGURE_ARGS += --enable-libvpx

include ../../mk/spksrc.cross-cc.mk

ifeq ($(findstring $(ARCH),$(ARM5_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --arch=arm --disable-neon --disable-yasm --disable-asm 
endif

ifeq ($(findstring $(ARCH),$(ARM7_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --arch=arm --disable-neon --disable-armv6 --disable-armv6t2 --disable-vfp --disable-armv5te --disable-yasm --disable-asm 
endif

ifeq ($(findstring $(ARCH),$(x86_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --arch=i386
DEPENDS += native/yasm
ENV += PATH=$(WORK_DIR)/../../../native/yasm/work-native/install/usr/local/bin/:$$PATH
endif

ifeq ($(findstring $(ARCH),$(x64_ARCHES)),$(ARCH))
CONFIGURE_ARGS += --arch=x86_64
DEPENDS += native/yasm
ENV += PATH=$(WORK_DIR)/../../../native/yasm/work-native/install/usr/local/bin/:$$PATH
endif