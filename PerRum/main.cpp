#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include "permess.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    /*
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
*/

    QQuickView view;
    PerMess mesg;
    view.engine()->rootContext()->setContextProperty("mesg",&mesg);
    view.setSource(QUrl::fromLocalFile(":/MyItem.qml"));

    view.show();

    return app.exec();
}
