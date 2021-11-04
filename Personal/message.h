#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>
class MessageBody : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text1 READ text1 WRITE setText1 NOTIFY text1Changed)
public:
    explicit MessageBody(QObject *parent = nullptr)
    {
        Q_UNUSED(parent);
    }
    QString text1() const
    {
        return m_text1;
    }

    void setText1(const QString& text1)
    {
        if(m_text1 != text1)
        {
            m_text1 = text1;
            emit text1Changed();
        }
    }
private:signals:
    void text1Changed();
private:
    QString m_text1;
};

class Message : public QObject
{
    Q_OBJECT
    Q_PROPERTY(MessageBody* body READ body WRITE setBody NOTIFY bodyChanged)
public:
    explicit Message(QObject *parent = nullptr)
    {
        Q_UNUSED(parent);
    }
    MessageBody* body() const
    {
        return m_body;
    }
    void setBody(MessageBody* body)
    {
        if(m_body != body)
        {
            m_body = body;
            emit bodyChanged();
        }
    }
private:signals:
    void bodyChanged();

private:
    MessageBody* m_body;
};

#endif // MESSAGE_H
