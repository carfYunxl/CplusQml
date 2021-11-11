QT       += core gui quick sql
QT += quickcontrols2

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    checklogin.cpp \
    main.cpp \
    my_file.cpp \
    my_multithread.cpp \
    my_sql.cpp \
    showpage.cpp \
    worker.cpp

HEADERS += \
    checklogin.h \
    my_file.h \
    my_multithread.h \
    my_sql.h \
    showpage.h \
    worker.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

RESOURCES += \
    img.qrc
