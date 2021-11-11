/*多线程编程的三种方式
*1.使用moveToThread ,QThread 搭配 worker
*2.Threadpool
*3.使用 Qt Concurrent
*/
#ifndef MY_MULTITHREAD_H
#define MY_MULTITHREAD_H
#include <QObject>
#include "worker.h"
#include <QThread>
#include <QDebug>
#include <QThreadPool>
#include <QTimer>
class My_multiThread : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString info READ info WRITE setInfo NOTIFY infoChanged)
public:
    explicit My_multiThread(QObject *parent = nullptr);
    Q_INVOKABLE void startThread();
    Q_INVOKABLE QString getName()
    {
        return m_name;
    }
    Q_INVOKABLE void quitThread();
    Q_INVOKABLE QString readThreadName();
    Q_INVOKABLE bool threadRunning()
    {
        return thread.isRunning();
    }
    Q_INVOKABLE void startThreadPool();

    void setInfo(QString info)
    {
        if(m_info != info)
        {
            emit infoChanged();
        }
    }
     QString info()
     {
         return m_info;
     }
     Q_INVOKABLE void stopThread()
     {
         worker->stop();
     }
     Q_INVOKABLE void restartThread()
     {
         worker->restart();
     }
private:signals:
    void infoChanged();
public slots:
   void readName(QString);
   void rState(QString info);
private:
    Worker* worker;
    QThread thread;
    QString m_name;
    QString m_info;
    QTimer* timer;
};
#endif // MY_MULTITHREAD_H
