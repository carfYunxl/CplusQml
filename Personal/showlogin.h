#ifndef SHOWLOGIN_H
#define SHOWLOGIN_H

#include <QObject>
#include "login.h"
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

signals:
    void windowChanged();

private:
    Login* m_window;
};

#endif // SHOWLOGIN_H
