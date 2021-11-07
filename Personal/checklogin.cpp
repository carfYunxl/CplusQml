#include "checklogin.h"

CheckLogin::CheckLogin(QObject *parent) : QObject(parent),m_account("root"),m_password("123456")
{
    QString filepath = "./user.ini";
    QSettings settings(filepath,QSettings::IniFormat);

    settings.beginGroup("ACCOUNT");
    settings.setValue(m_account,m_account);
    settings.endGroup();

    settings.beginGroup("PASSWORD");
    settings.setValue(m_password,m_password);
    settings.endGroup();
}
