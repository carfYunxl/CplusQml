#include "worker.h"
#include <QThread>
#include <QDebug>

Worker::Worker(QObject *parent) : QObject(parent)
{
}

void Worker::run()
{
    qInfo() << " RUNNING... " << QThread::currentThread();   
    if(!stopped)
    {
        mutex.lock();
        emit sendName(name + " " + QString::number(i));
        emit cState(QThread::currentThread()->objectName() + "  is RUNNING......");
        QThread::sleep(1);
        i++;
        mutex.unlock();
    }
    else{
        emit dState(QThread::currentThread()->objectName() + "  Stopped......");
    }
    //emit finished();
    //this->deleteLater();
}

void Worker::stop()
{
    mutex.lock();
    stopped = true;
    mutex.unlock();
}

void Worker::restart()
{
    mutex.lock();
    stopped = false;
    mutex.unlock();
}
