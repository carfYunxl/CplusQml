#include "my_sql.h"
#include <QFile>
My_SQL::My_SQL(QObject *parent) : QObject(parent)
{

}

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

QString My_SQL::readDriversCode()
{
    QFile file("D:/gitFile/CplusQml/Personal/src/my_sql/sql_drivers.cpp");
    if(!file.open(QIODevice::ReadWrite))
    {
        return "Open Filed!";
    }
    QString str;
    QTextStream in(&file);
    str = in.readAll();
    file.close();
    return str;
}

QString My_SQL::readconnectToDatabaseCode()
{
    QFile file("D:/gitFile/CplusQml/Personal/src/my_sql/sql_createToDataBase.cpp");
    if(!file.open(QIODevice::ReadWrite))
    {
        return "Open Filed!";
    }
    QString str;
    QTextStream in(&file);
    str = in.readAll();
    file.close();
    return str;
}

QString My_SQL::readcreateTableCode()
{
    QFile file("D:/gitFile/CplusQml/Personal/src/my_sql/sql_createTable.cpp");
    if(!file.open(QIODevice::ReadWrite))
    {
        return "Open Filed!";
    }
    QString str;
    QTextStream in(&file);
    str = in.readAll();
    file.close();
    return str;
}

void My_SQL::saveDriversCode(QString string)
{
    QFile file("D:/gitFile/CplusQml/Personal/src/my_sql/sql_drivers.cpp");
    if(!file.open(QIODevice::ReadWrite))
    {
        return;
    }
    QTextStream out(&file);
    out << string;
    file.flush();
    file.close();
}

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

