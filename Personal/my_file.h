#ifndef MY_FILE_H
#define MY_FILE_H

#include <QObject>

class My_File : public QObject
{
    Q_OBJECT
public:
    explicit My_File(QObject *parent = nullptr){
        Q_UNUSED(parent)
    }

    Q_INVOKABLE QString readCode(QString tag);
signals:

};

#endif // MY_FILE_H
