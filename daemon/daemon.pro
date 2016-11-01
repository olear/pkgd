TARGET = pkgd
QT += core dbus
QT -= gui
CONFIG += console
CONFIG -= app_bundle
TEMPLATE = app

SOURCES += main.cpp
OTHER_FILES += org.dracolinux.pkgd.conf

DESTDIR = build
OBJECTS_DIR = $${DESTDIR}/.obj

include(../pkgd.pri)

INCLUDEPATH += \
        ../lib \
        $${PREFIX}/include/pkgd \
        /usr/include/pkgd
LIBS += \
        -L"$${LIBDIR}" \
        -L"../lib/build" \
        "-l$${TARGET}"

unix {
    target.path = $${PREFIX}/sbin
    target_dbus_conf.path = $${DBUS_CONF}/dbus-1/system.d
    target_dbus_service.path = $${DBUS_SERVICE}/dbus-1/system-services
    target_dbus_conf.commands = $$quote(cat org.dracolinux.pkgd.conf | sed "\"s/_GROUP_/$${ADMIN_GROUP}/"\" > ${INSTALL_ROOT}$${DBUS_CONF}/dbus-1/system.d/org.dracolinux.pkgd.conf$$escape_expand(\\n\\t))
    target_dbus_service.commands = $$quote(echo "\"[D-BUS Service]"\" > ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.pkgd.service$$escape_expand(\\n\\t))
    target_dbus_service.commands += $$quote(echo "\"Name=org.dracolinux.pkgd"\" >> ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.pkgd.service$$escape_expand(\\n\\t))
    target_dbus_service.commands += $$quote(echo "\"Exec=$${PREFIX}/sbin/pkgd"\" >> ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.pkgd.service$$escape_expand(\\n\\t))
    target_dbus_service.commands += $$quote(echo "\"User=root"\" >> ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.pkgd.service$$escape_expand(\\n\\t))
    target_docs.path = $$DOCDIR/$${TARGET}-$${VERSION}
    target_docs.files = ../COPYING ../README.md
    INSTALLS += target target_dbus_conf target_dbus_service target_docs
}
