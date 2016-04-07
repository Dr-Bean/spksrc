SPK_NAME = geogig
SPK_VERS = 1.0-RC1a
SPK_REV = 1
SPK_ICON = src/geogig.png

DEPENDS  = cross/$(SPK_NAME)
SPK_DEPENDS = "Java8"

MAINTAINER = Dr-Bean
DESCRIPTION = Distributed Version Control System for geospatial data
STARTABLE = no
DISPLAY_NAME = GeoGig

HOMEPAGE = http://geogig.org
LICENSE  = Eclipse Distribution License

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

FIRMWARE = 6.0-7300

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

# Pure Java package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk
