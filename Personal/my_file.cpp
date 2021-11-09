#include "my_file.h"
#include <QFile>
#include <QTextStream>
#include <QRegularExpression>
#include <QRegularExpressionMatch>
#include <QDebug>
QString My_File::readCode(QString tag)
{
    QFile file("D:/gitFile/CplusQml/Personal/my_sql.cpp");
    if(!file.open(QIODevice::ReadWrite))
    {
        return "Open Filed!";
    }
    QString str;
    QTextStream in(&file);
    str = in.readAll();
    QRegularExpression reg;
    if(tag == "DriverCode")
    {
        reg = QRegularExpression("@1[\\s\\S]*1@");
    }
    if(tag == "ConnectToDataBaseCode")
    {
        reg = QRegularExpression("@2[\\s\\S]*2@");
    }
    if(tag == "CreateTableCode")
    {
        reg = QRegularExpression("@3[\\s\\S]*3@");
    }
    if(tag == "SelectCode")
    {
        reg = QRegularExpression("@4[\\s\\S]*4@");
    }
    if(tag == "InsertCode")
    {
        reg = QRegularExpression("@5[\\s\\S]*5@");
    }
    QRegularExpressionMatch match = reg.match(str);
    if(match.hasMatch())
    {
        file.close();
        str =  match.captured(0);
        return str;
    }
    return str;
}
