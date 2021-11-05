#ifndef PERSONMESSAGE_H
#define PERSONMESSAGE_H

#include <QObject>

class PersonMessage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged)
public:
    explicit PersonMessage(QObject *parent = nullptr);
    QString name(){
        return m_name;
    }
    int age()
    {
        return m_age;
    }
    void setName(QString name)
    {
        if(name != m_name)
        {
            m_name = name;
            emit nameChanged();
        }
    }
    void setAge(int age)
    {
        if(age != m_age)
        {
            m_age= age;
            emit ageChanged();
        }
    }
private:signals:
    void nameChanged();
    void ageChanged();

private:
    QString m_name;
    int m_age;

};

#endif // PERSONMESSAGE_H
