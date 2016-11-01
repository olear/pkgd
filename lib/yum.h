#ifndef YUM_H
#define YUM_H

#include <QObject>
#include <QVector>
#include <QStringList>

class YUM : public QObject
{
    Q_OBJECT
public:
    explicit YUM(QObject *parent = 0);

signals:

public slots:
    QVector<QStringList> check();
    int install(QString pkgs);
    int remove(QString pkgs);
};

#endif // YUM_H
