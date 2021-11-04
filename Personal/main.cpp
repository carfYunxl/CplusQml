#include "login.h"

#include <QApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include "personmessage.h"
#include <QDebug>
#include "message.h"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    qmlRegisterType<PersonMessage>("helllo", 1, 0, "PersonMessage");
    qmlRegisterType<Message>("msgA", 1, 0, "Message");
    qmlRegisterType<MessageBody>("msgB", 1, 0, "MessageBody");
    Login w;
    w.show();
    /*QQuickView view ;
    PersonMessage msg;
    view.engine()->rootContext()->setContextProperty("msg",&msg);
    view.setSource(QUrl::fromLocalFile(":/LoginF.qml"));
    view.show();*/
    /*QQuickView view;
    view.setSource(QUrl::fromLocalFile(":/MyItem.qml"));
    view.show();*/
    return a.exec();
}
