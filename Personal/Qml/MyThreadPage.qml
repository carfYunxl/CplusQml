import QtQuick 2.0
import QtQml 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import mythread 1.0
import myworker 1.0
Item{
    id:root
    ColumnLayout{
        id:column
        spacing: 20
        anchors.centerIn: parent
        //thread1
        Rectangle{
            id:bg
            color: "black"
            opacity: 1.0
            width: 1200
            height: 50
            My_multiThread{
                id:mThread
            }
            Worker{
                id:worker
            }
            Timer{
                id:timer
                interval: 1000;
                //running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: {
                    var currentDate = new Date()
                    infoshow.append("Line " + infoshow.lineCount + "         \\ " +  mThread.info + "         \\ " + currentDate.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd HH:mm:ss"))
                    showCount.text = worker.isStop()? "COUNT" : mThread.getName()
                    //timer.running = worker.isStop() ? false : true???????????????????????????????????????????????????
                    button.text = worker.isStop()?(("%1 is not running...").arg(mThread.readThreadName()))
                                           :(("%1 is running...").arg(mThread.readThreadName()))
                }
            }
            Flow{
                id:rowlay
                anchors.fill: parent
                spacing: 20
                Label{
                    id:threadName
                    height: bg.height
                    width: 200
                    text: qsTr("Thread Name")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:button
                    text: qsTr("Not running...")
                    height: bg.height
                    width: 300
                    icon.source:"qrc:/icon_sys/c.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: button.hovered ? "yellow" : "white"
                        opacity: button.hovered ? 1.0 : 0.3
                    }

                    onClicked: {
                        timer.start()
                        mThread.startThread()
                        threadName.text = mThread.readThreadName()
                    }
                }
                Label{
                    id:showCount
                    height: bg.height
                    width: 100
                    text:"COUNT"
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:stop
                    text: qsTr("STOP")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/g.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: stop.hovered ? "yellow" : "white"
                        opacity: stop.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread.stopThread();
                    }
                }
                Button{
                    id:restart
                    text: qsTr("RESTART")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/i.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: restart.hovered ? "yellow" : "white"
                        opacity: restart.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread.restartThread()
                    }
                }
                Button{
                    id:quit
                    text: qsTr("QUIT")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/f.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: quit.hovered ? "yellow" : "white"
                        opacity: quit.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread.quitThread();
                    }
                }
                Button{
                    id:source
                    text: qsTr("Source Code")
                    height: bg.height
                    width: 150
                    icon.source:"qrc:/icon_sys/h.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: source.hovered ? "yellow" : "white"
                        opacity: source.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        //mThread.quitThread();
                    }
                }
            }
        }

        //thread4
        Rectangle{
            id:bg4
            color: "black"
            opacity: 1.0
            width: 1200
            height: 50
            My_multiThread{
                id:mThread4
            }
            Worker{
                id:worker4
            }
            Timer{
                id:timer4
                interval: 1000;
                //running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: {
                    var currentDate = new Date()
                    infoshow.append("Line " + infoshow.lineCount + "         \\ " +  mThread4.info + "         \\ " + currentDate.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd HH:mm:ss"))
                    showCount4.text = worker4.isStop()? "COUNT" : mThread4.getName()
                    button4.text = worker4.isStop() ? (("%1 is not running...").arg(mThread4.readThreadName()))
                                     :(("%1 is running...").arg(mThread4.readThreadName()))

                    timer4.running = worker4.isStop() ? false : true
                }
            }
            Flow{
                id:rowlay4
                anchors.fill: parent
                spacing: 20
                Label{
                    id:threadName4
                    height: bg4.height
                    width: 200
                    text: qsTr("Thread Name")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:button4
                    text: qsTr("Not running...")
                    height: bg4.height
                    width: 300
                    icon.source:"qrc:/icon_sys/c.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: button4.hovered ? "yellow" : "white"
                        opacity: button4.hovered ? 1.0 : 0.3
                    }

                    onClicked: {
                        timer4.start()
                        mThread4.startThread()
                        threadName4.text = mThread4.readThreadName()
                    }
                }
                Label{
                    id:showCount4
                    height: bg4.height
                    width: 100
                    text:"COUNT"
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:stop4
                    text: qsTr("STOP")
                    height: bg4.height
                    width: 100
                    icon.source:"qrc:/icon_sys/g.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: stop4.hovered ? "yellow" : "white"
                        opacity: stop4.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread4.stopThread();
                    }
                }
                Button{
                    id:restart4
                    text: qsTr("RESTART")
                    height: bg4.height
                    width: 100
                    icon.source:"qrc:/icon_sys/i.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: restart4.hovered ? "yellow" : "white"
                        opacity: restart4.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread4.restartThread()
                    }
                }
                Button{
                    id:quit4
                    text: qsTr("QUIT")
                    height: bg4.height
                    width: 100
                    icon.source:"qrc:/icon_sys/f.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: quit4.hovered ? "yellow" : "white"
                        opacity: quit4.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread4.quitThread();
                    }
                }
                Button{
                    id:source4
                    text: qsTr("Source Code")
                    height: bg4.height
                    width: 150
                    icon.source:"qrc:/icon_sys/h.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: source4.hovered ? "yellow" : "white"
                        opacity: source4.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        //mThread.quitThread();
                    }
                }
            }
        }
        //thread2
        Rectangle{
            id:bg2
            color: "black"
            opacity: 1.0
            width: 1200
            height: 50
            My_multiThread{
                id:mThread2
            }
            Worker{
                id:worker2
            }
            Timer{
                id:timer2
                interval: 1000;
                //running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: {
                    var currentDate = new Date()
                    infoshow.append("Line " + infoshow.lineCount + "         \\ " +  mThread2.info + "         \\ " + currentDate.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd HH:mm:ss"))
                    showCount2.text = worker2.isStop()? "COUNT" : mThread2.getName()
                    worker2.isStop()?(button2.text = (("%1 is not running...").arg(mThread2.readThreadName())))
                                           :(button2.text = (("%1 is running...").arg(mThread2.readThreadName())))

                    timer.running = worker.isStop() ? false : true
                }
            }
            Flow{
                id:rowlay2
                anchors.fill: parent
                spacing: 20
                Label{
                    id:threadName2
                    height: bg.height
                    width: 200
                    text: qsTr("Thread Name")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:button2
                    text: qsTr("Not running...")
                    height: bg.height
                    width: 300
                    icon.source:"qrc:/icon_sys/c.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: button2.hovered ? "yellow" : "white"
                        opacity: button2.hovered ? 1.0 : 0.3
                    }

                    onClicked: {
                        timer2.start()
                        mThread2.startThread()
                        threadName2.text = mThread2.readThreadName()
                    }
                }
                Label{
                    id:showCount2
                    height: bg.height
                    width: 100
                    text:"COUNT"
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:stop2
                    text: qsTr("STOP")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/g.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: stop2.hovered ? "yellow" : "white"
                        opacity: stop2.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread2.stopThread();
                    }
                }
                Button{
                    id:restart2
                    text: qsTr("RESTART")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/i.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: restart2.hovered ? "yellow" : "white"
                        opacity: restart2.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread2.restartThread()
                    }
                }
                Button{
                    id:quit2
                    text: qsTr("QUIT")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/f.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: quit2.hovered ? "yellow" : "white"
                        opacity: quit2.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread2.quitThread();
                    }
                }
                Button{
                    id:source2
                    text: qsTr("Source Code")
                    height: bg.height
                    width: 150
                    icon.source:"qrc:/icon_sys/h.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: source2.hovered ? "yellow" : "white"
                        opacity: source2.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        //mThread.quitThread();
                    }
                }
            }
        }

        //thread3
        Rectangle{
            id:bg3
            color: "black"
            opacity: 1.0
            width: 1200
            height: 50
            My_multiThread{
                id:mThread3
            }
            Worker{
                id:worker3
            }
            Timer{
                id:timer3
                interval: 1000;
                //running: true
                repeat: true
                triggeredOnStart: true
                onTriggered: {
                    var currentDate = new Date()
                    infoshow.append("Line " + infoshow.lineCount + "         \\ " +  mThread3.info + "         \\ " + currentDate.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd HH:mm:ss"))
                    showCount3.text = worker3.isStop()? "COUNT" : mThread3.getName()
                    worker3.isStop()?(button3.text = (("%1 is not running...").arg(mThread3.readThreadName())))
                                           :(button3.text = (("%1 is running...").arg(mThread3.readThreadName())))

                    timer3.running = worker3.isStop() ? false : true
                }
            }
            Flow{
                id:rowlay3
                anchors.fill: parent
                spacing: 20
                Label{
                    id:threadName3
                    height: bg3.height
                    width: 200
                    text: qsTr("Thread Name")
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:button3
                    text: qsTr("Not running...")
                    height: bg.height
                    width: 300
                    icon.source:"qrc:/icon_sys/c.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: button3.hovered ? "yellow" : "white"
                        opacity: button3.hovered ? 1.0 : 0.3
                    }

                    onClicked: {
                        timer3.start()
                        mThread3.startThread()
                        threadName3.text = mThread3.readThreadName()
                    }
                }
                Label{
                    id:showCount3
                    height: bg.height
                    width: 100
                    text:"COUNT"
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Button{
                    id:stop3
                    text: qsTr("STOP")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/g.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: stop3.hovered ? "yellow" : "white"
                        opacity: stop3.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread3.stopThread();
                    }
                }
                Button{
                    id:restart3
                    text: qsTr("RESTART")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/i.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: restart3.hovered ? "yellow" : "white"
                        opacity: restart3.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread3.restartThread()
                    }
                }
                Button{
                    id:quit3
                    text: qsTr("QUIT")
                    height: bg.height
                    width: 100
                    icon.source:"qrc:/icon_sys/f.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: quit3.hovered ? "yellow" : "white"
                        opacity: quit3.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        mThread3.quitThread();
                    }
                }
                Button{
                    id:source3
                    text: qsTr("Source Code")
                    height: bg.height
                    width: 150
                    icon.source:"qrc:/icon_sys/h.png"
                    icon.color:"red"
                    background: Rectangle{
                        color: source3.hovered ? "yellow" : "white"
                        opacity: source3.hovered ? 1.0 : 0.3
                    }
                    onClicked: {
                        //mThread.quitThread();
                    }
                }
            }
        }
    }
    ScrollTextEdit{
        id:infoshow
        width: column.width
        height: 200
        anchors.top: column.bottom
        x:column.x
        y:column.y + column.height + 20
        readOnly: true
        color: "yellow"
    }


}
