#include "yum.h"
#include <QProcess>

YUM::YUM(QObject *parent) : QObject(parent)
{
}

QVector<QStringList> YUM::check()
{
    QStringList args;
    args << QString::fromUtf8("check-updates");
    QProcess proc;
    proc.start(QString::fromUtf8("yum"), args);
    proc.waitForFinished();
    QString result = proc.readAll();
    proc.close();
    QVector<QStringList> pkgs;
    if (!result.isEmpty()) {
        QStringList split = result.split(QString::fromUtf8("\n"));
        bool get = false;
        for (int i = 0; i < split.size(); ++i) {
            if (split.at(i).isEmpty() && i < split.size()) {
                get = true;
            }
            if (get && !split.at(i).isEmpty()) {
                QStringList pkg;
                QStringList pkgSplit = split.at(i).split(QString::fromUtf8(" "), QString::SkipEmptyParts);
                for (int i = 0; i < pkgSplit.size(); ++i) {
                    pkg << pkgSplit.at(i);
                }
                if (pkg.size() == 3) {
                    pkgs << pkg;
                }
            }
        }
    }
    return pkgs;
}

int YUM::install(QString pkgs)
{
    if (!pkgs.isEmpty()) {
        QStringList args;
        args << "-y";
        args << "install";
        args << pkgs;
        QProcess proc;
        proc.start(QString::fromUtf8("yum"), args);
        proc.waitForFinished();
        int status = proc.exitCode();
        proc.close();
        return status;
    }
    return 1;
}

int YUM::remove(QString pkgs)
{
    if (!pkgs.isEmpty()) {
        QStringList args;
        args << "-y";
        args << "remove";
        args << pkgs;
        QProcess proc;
        proc.start(QString::fromUtf8("yum"), args);
        proc.waitForFinished();
        int status = proc.exitCode();
        proc.close();
        return status;
    }
    return 1;
}
