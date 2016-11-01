#include <QCoreApplication>
#include <QtDBus>
#include "pkgd.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    QCoreApplication::setApplicationName("pkgd");
    QCoreApplication::setOrganizationDomain("dracolinux.org");
    QCoreApplication::setOrganizationName("DracoLinux");
    QCoreApplication::setApplicationVersion(PKGD_VERSION);

    PKGd pkg;

    if (!QDBusConnection::systemBus().isConnected()) {
        qWarning("Cannot connect to the D-Bus system bus.");
        return 1;
    }

    if (!QDBusConnection::systemBus().registerService("org.dracolinux.pkgd")) {
        qWarning() << QDBusConnection::systemBus().lastError().message();
        return 1;
    }

    QDBusConnection::systemBus().registerObject("/yum", &pkg.yum, QDBusConnection::ExportAllContents);

    return a.exec();
}
