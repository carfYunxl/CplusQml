#ifndef CHECKLOGIN_H
#define CHECKLOGIN_H

#include <QObject>
#include <QSqlDatabase>
#include <QSettings>
#include <QDebug>
class CheckLogin : public QObject
{
    Q_OBJECT
public:
    explicit CheckLogin(QObject *parent = nullptr);

    Q_INVOKABLE void checkText(QString account,QString password )
    {
        QString filepath = "./user.ini";
        QSettings settings(filepath,QSettings::IniFormat);
        m_account = settings.value(QString("ACCOUNT/") + account).toString();
        m_password = settings.value(QString("PASSWORD/") + password).toString();

        if(m_account == "" || m_password == "")
        {
            emit checkNo();
        }
        else if(account == m_account && password == m_password)
        {
            emit checkOk();
        }
        else{
            emit checkNo();
        }
    }

    Q_INVOKABLE void writeIni(QString account,QString password )
    {
        if(account == "" || password == "")
        {
            return;
        }
        qDebug() << "111";
        QString filepath = "./user.ini";
        QSettings settings(filepath,QSettings::IniFormat);
        /*if((settings.value(QString("ACCOUNT/") + account).toString() != "") || (settings.value(QString("ACCOUNT/") + password).toString() != ""))
        {
            return;
        }*/
        settings.beginGroup("ACCOUNT");
        settings.setValue(account,account);
        settings.endGroup();

        settings.beginGroup("PASSWORD");
        settings.setValue(password,password);
        settings.endGroup();
    }


private:signals:
    void checkOk();
    void checkNo();
private:
    QString m_account;
    QString m_password;
};

#endif // CHECKLOGIN_H
