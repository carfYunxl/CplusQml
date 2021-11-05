#ifndef LOGIN_H
#define LOGIN_H

#include <QDialog>
#include <QQuickView>
QT_BEGIN_NAMESPACE
namespace Ui { class Login; }
QT_END_NAMESPACE

class Login : public QDialog
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
public:
    Login(QWidget *parent = nullptr);
    ~Login();

    QString name()
    {
        return l_name;
    }
    void setName(QString name)
    {
        if(name != l_name)
        {
            l_name = name;
            emit nameChanged();
        }
    }
private slots:
    void on_pushButton_4_clicked();

    void on_pushButton_register_clicked();
private:signals:
        void nameChanged();
private:
    Ui::Login *ui;
    QQuickView view ;
    QString l_name;
};


#endif // LOGIN_H
