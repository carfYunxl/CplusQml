#include "login.h"
#include "ui_login.h"
#include <QQmlEngine>
#include <QQmlContext>
#include "personmessage.h"
#include <QMessageBox>
#include <QSettings>
#include "message.h"
#include <QQmlApplicationEngine>
Login::Login(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::Login)
{
    ui->setupUi(this);
    this->setWindowTitle("Login");
    setAutoFillBackground(true);
}
Login::~Login()
{
    delete ui;
}
void Login::on_pushButton_4_clicked()
{
    QString filepath = "./user.ini";
    QSettings settings(filepath,QSettings::IniFormat);

    QString account = settings.value(QString("ACCOUNT/") + ui->lineEdit_account->text()).toString();
    QString password = settings.value(QString("PASSWORD/") + ui->lineEdit_password->text()).toString();

    if(account == "" || password == "")
    {
        QMessageBox::critical(this,"Critical","<b><font color = 'red'>Sorr</font></b>y!"
                                                                "<ol>"
                                                                "<li>EMPTY</li>"
                                                                "<li>account</li>"
                                                                "<li>or password</li>"
                                                                "</ol>",QMessageBox::Ok | QMessageBox::Cancel);
        return;
    }

    if(ui->lineEdit_account->text() == account  &&  ui->lineEdit_password->text() == password)
    {
        int ret = QMessageBox::information(this,"Info","<b><font color = 'red'>Succ</font></b>ess!"
                                                        "<ol>"
                                                        "<li>First</li>"
                                                        "<li>Second</li>"
                                                        "<li>Third</li>"
                                                        "</ol>",QMessageBox::Ok | QMessageBox::Cancel);
        if(ret == QMessageBox::Ok)
        {
            this->hide();
            /*
            PersonMessage msg;
            Message message;
            MessageBody messageBody;
*/
            //QQmlContext* m_ctxt;

            //view.engine()->clearComponentCache();
            //m_engine->clearComponentCache();
            //m_engine.reset(new QQmlApplicationEngine, &QObject::deleteLater);
            //m_ctxt = view.engine()->rootContext();
            //m_ctxt->setParent(view.engine());

            //m_ctxt = view.engine()->rootContext();
            //m_ctxt->setParent(view.engine());
/*
            QVector<QQmlContext::PropertyPair> qmlProperties;

            qmlProperties.push_back(QQmlContext::PropertyPair{"PersonMessage", QVariant::fromValue(&msg)});

            qmlProperties.push_back(QQmlContext::PropertyPair{"Message", QVariant::fromValue(&message)});
            qmlProperties.push_back(QQmlContext::PropertyPair{"MessageBody", QVariant::fromValue(&messageBody)});

                //add other context properties
            view.engine()->rootContext()->setContextProperties(qmlProperties);
            //m_engine->load(QUrl(QLatin1String("qrc:/MyItem.qml")));
*/
            qmlRegisterType<PersonMessage>("App", 1, 0, "PersonMessage");
            qmlRegisterType<Message>("App2", 1, 0, "Message");
            qmlRegisterType<MessageBody>("App3", 1, 0, "MessageBody");

            view.setSource(QUrl::fromLocalFile(":/MyItem.qml"));
            view.show();
        }

        else
            return;
    }
    else
        QMessageBox::critical(this,"Critical","<b><font color = 'red'>Sorr</font></b>y!"
                                                                "<ol>"
                                                                "<li>First</li>"
                                                                "<li>Second</li>"
                                                                "<li>Third</li>"
                                                                "</ol>",QMessageBox::Ok | QMessageBox::Cancel);
}


void Login::on_pushButton_register_clicked()
{
    QString filepath = "./user.ini";
    QSettings settings(filepath,QSettings::IniFormat);
    settings.beginGroup("ACCOUNT");
    settings.setValue(ui->lineEdit_account->text(),ui->lineEdit_account->text());
    settings.endGroup();

    settings.beginGroup("PASSWORD");
    settings.setValue(ui->lineEdit_password->text(),ui->lineEdit_password->text());
    settings.endGroup();

    ui->lineEdit_account->clear();
    ui->lineEdit_password->clear();

}

