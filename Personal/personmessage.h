#ifndef PERSONMESSAGE_H
#define PERSONMESSAGE_H

#include <QObject>

class PersonMessage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
public:
    explicit PersonMessage(QObject *parent = nullptr);
    QString name(){
        return m_name;
    }

    void setName(QString name)
    {
        if(name != m_name)
        {
            m_name = name;
            emit nameChanged();
        }
    }
private:signals:
    void nameChanged();

private:
    QString m_name;

};

#endif // PERSONMESSAGE_H
