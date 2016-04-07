#!/bin/sh

# Package
PACKAGE="geogig"
DNAME="GeoGig"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"

preinst ()
{
    exit 0
}

postinst ()
{
    # Link
    ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

    # Put geogig on PATH
    mkdir -p /usr/local/bin
    ln -s ${INSTALL_DIR}/share/geogig/bin/geogig /usr/local/bin/geogig

    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
    # Remove link
    rm -f ${INSTALL_DIR}
    rm -f /usr/local/bin/geogig

    exit 0
}

preupgrade ()
{

    exit 0
}

postupgrade ()
{

    exit 0
}
