/*Used for multiQThread!
*Method one
*use moveToThread
*/
#ifndef WORKER_H
#define WORKER_H

#include <QObject>
#include <QRunnable>
#include <QMutex>
#include <QMutexLocker>
class Worker : public QObject,public QRunnable
{
    Q_OBJECT
public:
    explicit Worker(QObject *parent = nullptr);

    void run();
    void stop();
    void restart();

    Q_INVOKABLE bool isStop()
    {
        return stopped;
    }

private : signals:
    void sendName(QString string);
    void finished();
    void cState(QString info);
    void dState(QString info);

private:
    QString name = "Thread ";
    QMutex mutex;
    bool stopped = false;
    qint32 i = 0;
};

#endif // WORKER_H
