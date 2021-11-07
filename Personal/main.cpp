#include "login.h"

#include <QApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "personmessage.h"
#include <QDebug>
#include "message.h"
#include "showlogin.h"
#include "checklogin.h"
#include <QQuickStyle>
#include "showpage.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    qmlRegisterType<PersonMessage>("helllo", 1, 0, "PersonMessage");
    qmlRegisterType<Message>("msgA", 1, 0, "Message");
    qmlRegisterType<MessageBody>("msgB", 1, 0, "MessageBody");
    qmlRegisterType<CheckLogin>("checkLogin",1,0,"CheckLogin");
    qmlRegisterType<ShowPage>("showpage",1,0,"ShowPage");
    //Login w;
    //w.show();
    /*QQuickView view ;
    PersonMessage msg;
    view.engine()->rootContext()->setContextProperty("msg",&msg);
    view.setSource(QUrl::fromLocalFile(":/LoginF.qml"));
    view.show();*/
    /*QQuickView view;
    view.setSource(QUrl::fromLocalFile(":/MyItem.qml"));
    view.show();*/

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/LoginPage.qml"));

    QObject::connect(&engine,&QQmlApplicationEngine::objectCreated,&app,[url](QObject* obj,const QUrl& objurl){
        if(!obj && url == objurl)
            QCoreApplication::exit(-1);
    },Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
