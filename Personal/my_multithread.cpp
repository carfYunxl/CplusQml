#include "my_multithread.h"
static int i = 0;
My_multiThread::My_multiThread(QObject *parent) : QObject(parent),timer(new QTimer(this))
{
    thread.setObjectName("Work Thread " + QString::number(i));
    i++;
    worker = new Worker();
    connect(timer,&QTimer::timeout,worker,&Worker::run,Qt::QueuedConnection);

    connect(worker,&Worker::sendName,this,&My_multiThread::readName,Qt::QueuedConnection);
    /*connect(worker,&Worker::finished,[=](){
        thread.exit(0);
        thread.wait(2);
    });*/
    connect(worker,&Worker::cState,this,&My_multiThread::rState);
    connect(worker,&Worker::dState,this,&My_multiThread::rState);
}

void My_multiThread::startThread()
{
    worker->moveToThread(&thread);
    thread.start();
    timer->start(1000);
}
void My_multiThread::quitThread()
{
    thread.exit(0);
    thread.wait(2);
}
void My_multiThread::readName(QString name)
{
    m_name = name;
}
QString My_multiThread::readThreadName()
{
    return thread.objectName();
}

void My_multiThread::startThreadPool()
{
    QThreadPool::globalInstance()->start(worker);
}

void My_multiThread::rState(QString info)
{
    m_info = info;
}
