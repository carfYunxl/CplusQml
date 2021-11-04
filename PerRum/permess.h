#ifndef PERMESS_H
#define PERMESS_H

#include <QObject>

class PerMess : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
public:
    explicit PerMess(QObject *parent = nullptr);

    QString name() const
    {
        return m_name;;
    }

    void setName(const QString& name)
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

#endif // PERMESS_H
