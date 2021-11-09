#include "my_sql.h"
#include <QFile>
#include <QRegularExpression>
#include <QRegularExpressionMatch>
#include <QQueue>
My_SQL::My_SQL(QObject *parent) : QObject(parent)
{

}
//@2   ConnectToDataBaseCode:
bool My_SQL::connectToDatabase(QString hostName, QString dataBaseName, QString userName, QString passWord)
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName(hostName);
    db.setDatabaseName(dataBaseName);
    db.setUserName(userName);
    db.setPassword(passWord);

    if(!db.open())
    {
        qDebug() << "Connect Failed! " << db.lastError();
        return false;
    }
    return true;
}
//2@

//@1    DriverCode:
QString My_SQL::showDrivers()
{
    QStringList stringList =  QSqlDatabase::drivers();
    QString tmp;
    for(auto& tp : stringList)
    {
        tmp = tmp + " " + tp;
    }
    return tmp;
}
//1@
//@3    CreateTableCode:
bool My_SQL::createTable(QString tableName, QStringList args)
{
    int num = args.size();
        QString tmp("");
        for(int i = 0;i < num;++i)
        {
            tmp.append("," + args.at(i));
        }
        QString string = QString("create table %1(id int primary key auto_increment").arg(tableName) + tmp +");";
        qInfo() << string;
        QSqlQuery query;
        if(!query.exec(string))
        {
            return false;
        }
        return true;
}
//3@

//@4 Select:
QVariant My_SQL::selectItem(QString sqlSelectString)
{
    QSqlQuery query;
    bool ok = query.exec(sqlSelectString);
    if(!ok)
    {
        return QQueue<QVariant>();
    }
    if(query.next())
    {
        return query.value(0);
    }
    return QVariant();
}
//4@

//@5
bool My_SQL::insertItem(QString sqlInsert)
{
    QSqlQuery query;
    if(!query.exec(sqlInsert))
    {
        return false;
    }
    return true;
}
//5@

