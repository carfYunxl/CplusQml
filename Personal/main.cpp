#include "login.h"

#include <QApplication>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include "personmessage.h"
#include <QDebug>
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    //Login w;
    //w.show();
    QQuickView view ;
    PersonMessage msg;
    view.engine()->rootContext()->setContextProperty("msg",&msg);
    view.setSource(QUrl::fromLocalFile(":/LoginF.qml"));
    view.show();
    return a.exec();
}
