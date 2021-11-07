#ifndef SHOWPAGE_H
#define SHOWPAGE_H

#include <QObject>
#include <QQuickView>
class ShowPage : public QObject
{
    Q_OBJECT
public:
    explicit ShowPage(QObject *parent = nullptr);

    Q_INVOKABLE void showWorkPage(QString filepath)
    {
        view.setSource(QUrl::fromLocalFile(filepath));
        view.show();
    }
signals:

private:
    QQuickView view;
};

#endif // SHOWPAGE_H
