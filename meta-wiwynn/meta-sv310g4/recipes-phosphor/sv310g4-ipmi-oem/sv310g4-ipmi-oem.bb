FILESEXTRAPATHS_append := "${THISDIR}/files:"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${WIWYNNBASE}/COPYING.apache-2.0;md5=34400b68072d710fecd0a2940a0d1658"

SUMMARY = "SV310G4 IPMI OEM Command Set"
DESCRIPTION = "SV310G4 ipmi oem command implementation"

DEPENDS += "boost"
DEPENDS += "phosphor-ipmi-host"
DEPENDS += "phosphor-logging"
DEPENDS += "systemd"
DEPENDS += "obmc-libi2c"
DEPENDS += "libgpiod"

RDEPENDS_${PN} += "obmc-libi2c libgpiod"

inherit cmake obmc-phosphor-ipmiprovider-symlink rm_work
EXTRA_OECMAKE= "-DENABLE_TEST=0 -DYOCTO=1"

S = "${WORKDIR}"
SRC_URI = "file://CMakeLists.txt \
           file://LICENSE \
           file://appcommands.cpp \
           file://appcommands.hpp \
           file://chassishandler.cpp \
           file://storagecommands.cpp \
           file://storagecommands.hpp \
           file://oemcommands.cpp \
           file://oemcommands.hpp \
           file://Utils.cpp \
           file://Utils.hpp \
          "

LIBRARY_NAMES = "libzsv310g4oemcmds.so"

HOSTIPMI_PROVIDER_LIBRARY += "${LIBRARY_NAMES}"
NETIPMI_PROVIDER_LIBRARY += "${LIBRARY_NAMES}"

FILES_${PN}_append = " ${libdir}/ipmid-providers/lib*${SOLIBS}"
FILES_${PN}_append = " ${libdir}/host-ipmid/lib*${SOLIBS}"
FILES_${PN}_append = " ${libdir}/net-ipmid/lib*${SOLIBS}"
FILES_${PN}-dev_append = " ${libdir}/ipmid-providers/lib*${SOLIBSDEV} ${libdir}/ipmid-providers/*.la"
