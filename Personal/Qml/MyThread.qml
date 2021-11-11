import QtQuick 2.0
import mythread 1.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import myworker 1.0
Item {
    id:root
    implicitWidth: 1200
    implicitHeight: 50
    //property alias runing   : mThread.threadRunning()
    //property alias runInfo  : mThread.info
    Timer{
        id:timer
        interval: 10;
        running: false;
        repeat: true
        onTriggered: {

            showCount.text = mThread.getName()
            mThread.threadRunning()?(button.text = (("%1 is running...").arg(mThread.readThreadName())))
                                   :(button.text = (("%1 is not running...").arg(mThread.readThreadName())))
        }
    }

    My_multiThread{
        id:mThread
    }
    Worker{
        id:worker
    }
    Rectangle{
        id:bg
        anchors.fill: parent
        color: "black"
        opacity: 1.0
        Flow{
            id:rowlay
            anchors.fill: parent
            spacing: 20
            Label{
                id:threadName
                height: root.height
                width: 200
                text: qsTr("Thread Name")
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Button{
                id:button
                text: qsTr("Not running...")
                height: root.height
                width: 400
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
                height: root.height
                width: 200
                text:"COUNT"
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Button{
                id:quit
                text: qsTr("QUIT")
                height: root.height
                width: 150
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
                height: root.height
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
}
