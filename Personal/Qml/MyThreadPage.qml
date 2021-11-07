import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
Item {
    id:root
    ColumnLayout{
        anchors.centerIn: parent
        spacing: 80

        Flow{
            spacing: 20
            Button{
                width: 200
                id:show
                background: Rectangle{
                    color: show.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/a.png" : "qrc:/icon_sys/h.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示第一种方法")
            }
            Button{
                width: 200
                id:show1
                background: Rectangle{
                    color: show1.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/c.png" : "qrc:/icon_sys/j.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示第二种方法")
            }
            Button{
                width: 200
                id:show2
                background: Rectangle{
                    color: show2.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/e.png" : "qrc:/icon_sys/k.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示第三种方法")
            }
        }

        Flow{
            spacing: 20
            Button{
                width: 200
                id:shows
                background: Rectangle{
                    color: shows.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/a.png" : "qrc:/icon_sys/h.png"
                text: hovered ? qsTr("按下    显示") : qsTr("显示    源码")
            }
            Button{
                width: 200
                id:show1s
                background: Rectangle{
                    color: show1s.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/a.png" : "qrc:/icon_sys/h.png"
                text: hovered ? qsTr("按下    显示") : qsTr("显示    源码")
            }
            Button{
                width: 200
                id:show2s
                background: Rectangle{
                    color: show2s.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/a.png" : "qrc:/icon_sys/h.png"
                text: hovered ? qsTr("按下    显示") : qsTr("显示    源码")
            }
        }
    }
}
