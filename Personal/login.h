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

public:
    Login(QWidget *parent = nullptr);
    ~Login();

private slots:
    void on_pushButton_4_clicked();

    void on_pushButton_register_clicked();

private:
    Ui::Login *ui;
    QQuickView view ;
};


#endif // LOGIN_H
