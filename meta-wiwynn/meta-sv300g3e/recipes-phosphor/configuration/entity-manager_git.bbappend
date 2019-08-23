FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Fix-the-EEPROM-format-to-16-bit-addressing.patch \
            file://sv300g3e-MB.json \
            "

do_install_append(){
        install -d ${D}/usr/share/entity-manager/configurations
        install -m 0444 ${WORKDIR}/*.json ${D}/usr/share/entity-manager/configurations
}