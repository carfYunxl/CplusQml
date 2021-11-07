#include <QApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include "checklogin.h"
#include <QQuickStyle>
#include "showpage.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/Image/leaf_middle.png"));

    QQuickStyle::setStyle("Material");

    qmlRegisterType<CheckLogin>("checkLogin",1,0,"CheckLogin");
    qmlRegisterType<ShowPage>("showpage",1,0,"ShowPage");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/LoginPage.qml"));

    QObject::connect(&engine,&QQmlApplicationEngine::objectCreated,&app,[url](QObject* obj,const QUrl& objurl){
        if(!obj && url == objurl)
            QCoreApplication::exit(-1);
    },Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
