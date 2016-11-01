VERSION = 1.0.0
DEFINES += PKGD_VERSION=\"\\\"$${VERSION}\\\"\"

isEmpty(PREFIX) {
    PREFIX = /usr/local
}

isEmpty(LIBDIR) {
    LIBDIR = $${PREFIX}/lib$${LIBSUFFIX}
}

isEmpty(DBUS_CONF) {
    DBUS_CONF = /etc
}

isEmpty(DBUS_SERVICE) {
    DBUS_SERVICE = /usr/share
}

isEmpty(INCLUDEDIR) {
    INCLUDEDIR = $${PREFIX}/include
}

isEmpty(DOCDIR) {
    DOCDIR = $$PREFIX/share/doc
}

isEmpty(ADMIN_GROUP) {
    ADMIN_GROUP = wheel
}
