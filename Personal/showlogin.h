#ifndef SHOWLOGIN_H
#define SHOWLOGIN_H

#include <QObject>
#include "login.h"
#include "test.h"
#include <QQmlApplicationEngine>
class ShowLogin : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Login* window READ window WRITE setWindow NOTIFY windowChanged )
public:
    explicit ShowLogin(QObject *parent = nullptr);
    Login* window()
    {
        return m_window;
    }

    void setWindow(Login* window)
    {
        if(m_window != window)
        {
            m_window = window;
            emit windowChanged();
        }
    }

    Q_INVOKABLE void sshow()
    {
        engine.load(QUrl::fromUserInput("qrc:/Qml/MyItem.qml"));
    }
signals:
    void windowChanged();

private:
    Login* m_window;
    QQmlApplicationEngine engine;
};

#endif // SHOWLOGIN_H
