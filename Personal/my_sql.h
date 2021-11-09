#ifndef MY_SQL_H
#define MY_SQL_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QSqlError>
class My_SQL : public QObject
{
    Q_OBJECT
public:
    explicit My_SQL(QObject *parent = nullptr);

    Q_INVOKABLE bool connectToDatabase(QString hostName,QString dataBaseName,QString userName,QString passWord);
    Q_INVOKABLE QString showDrivers();
    Q_INVOKABLE bool createTable(QString tableName,QStringList args);
    Q_INVOKABLE QVariant selectItem(QString sqlSelect);
    Q_INVOKABLE bool insertItem(QString sqlInsert);
signals:

};
#endif // MY_SQL_H
