FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# SRCREV = "c0dcf0d3f0a0865ccc9ff3ada2d3e70918377401"

EXTRA_OEMESON += "-Dmotherboard-config-path=/usr/share/entity-manager/configurations/sv310g4-MB.json"

SRC_URI += "file://sv310g4-MB.json \
            file://blacklist.json \
            file://0001-Set-the-boot-order-of-EntityManager-after-FruDevice.patch \
            file://0002-Get-fru-device-from-motherboard-config.patch \
            "

do_install_append(){
        install -d ${D}/usr/share/entity-manager/configurations
        install -m 0444 ${WORKDIR}/sv310g4-MB.json ${D}/usr/share/entity-manager/configurations    
        install -m 0444 ${WORKDIR}/blacklist.json ${D}/usr/share/entity-manager
}
