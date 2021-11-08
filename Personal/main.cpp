#include <QApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include "checklogin.h"
#include <QQuickStyle>
#include "showpage.h"
#include "my_sql.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/Image/leaf_big.png"));

    QQuickStyle::setStyle("Material");

    qmlRegisterType<CheckLogin>("checkLogin",1,0,"CheckLogin");
    qmlRegisterType<ShowPage>("showpage",1,0,"ShowPage");
    qmlRegisterType<My_SQL>("mysql",1,0,"My_SQL");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/Qml/YXL_WorkBench.qml"));

    QObject::connect(&engine,&QQmlApplicationEngine::objectCreated,&app,[url](QObject* obj,const QUrl& objurl){
        if(!obj && url == objurl)
            QCoreApplication::exit(-1);
    },Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
