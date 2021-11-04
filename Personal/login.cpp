#include "login.h"
#include "ui_login.h"
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include "personmessage.h"
#include <QDebug>
Login::Login(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::Login)
{
    ui->setupUi(this);

    QQuickView view ;
    PersonMessage msg;
    view.engine()->rootContext()->setContextProperty("msg",&msg);
    view.setSource(QUrl::fromLocalFile(":/LoginF.qml"));
    view.show();
}

Login::~Login()
{
    delete ui;
}

