QT -= gui
TARGET = pkgd
TEMPLATE = lib

DEFINES += PKGD_LIBRARY
SOURCES += \
        pkgd.cpp \
        yum.cpp
HEADERS += \
        pkgd.h \
        yum.h \
        pkgd_global.h

DESTDIR = build
OBJECTS_DIR = $${DESTDIR}/.obj

include(../pkgd.pri)

unix {
    target.path = $${LIBDIR}
    target_docs.path = $$DOCDIR/$${TARGET}-$${VERSION}
    target_docs.files = ../COPYING ../README.md
    target_inc.path = $${PREFIX}/include/pkgd
    target_inc.files = $${HEADERS}
    INSTALLS += target target_docs target_inc
}
