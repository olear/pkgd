#ifndef PKGD_GLOBAL_H
#define PKGD_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(PKGD_LIBRARY)
#  define PKGDSHARED_EXPORT Q_DECL_EXPORT
#else
#  define PKGDSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // PKGD_GLOBAL_H
