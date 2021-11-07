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
    message.cpp \
    personmessage.cpp \
    showpage.cpp

HEADERS += \
    checklogin.h \
    message.h \
    personmessage.h \
    showpage.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Image/leaf_big.png \
    Image/leaf_middle.png \
    Image/leaf_small.png \
    Image/star_b.png \
    Image/star_big.png \
    Image/star_m.png \
    Image/star_mb.png \
    Image/star_s.png \
    Image/star_sb.png \
    Image/star_ss.png \
    Image/star_ssb.png \
    Image/–«–« (1).png \
    Image/–«–« (2).png \
    Image/–«–« (3).png \
    Image/–«–« (4).png \
    Image/–«–« (5).png \
    Image/–«–« (6).png \
    Image/–«–« (7).png \
    Image/∑„“∂ (1).png \
    Image/∑„“∂ (2).png

RESOURCES += \
    img.qrc
