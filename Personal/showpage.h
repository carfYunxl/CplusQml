#ifndef SHOWPAGE_H
#define SHOWPAGE_H

#include <QObject>
#include <QQmlApplicationEngine>
class ShowPage : public QObject
{
    Q_OBJECT
public:
    explicit ShowPage(QObject *parent = nullptr);

    Q_INVOKABLE void showWorkPage(const QString& filepath)
    {
        engine.load(QUrl::fromUserInput(filepath));
    }
signals:

private:
    QQmlApplicationEngine engine;
};

#endif // SHOWPAGE_H
