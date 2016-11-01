#ifndef PKGD_H
#define PKGD_H

#include "pkgd_global.h"
#include "yum.h"

class PKGDSHARED_EXPORT PKGd
{

public:
    PKGd();
    YUM yum;
};

#endif // PKGD_H
