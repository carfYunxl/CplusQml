import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
Item {
    id: root
    ColumnLayout{
        id:column
        anchors.centerIn: parent
        Flow{
            spacing: 25
            Button{
                width: 200
                id:show
                background: Rectangle{
                    color: show.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/a.png" : "qrc:/icon_sys/h.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示本地数据库驱动")
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:showCode
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/b.png" : "qrc:/icon_sys/n.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }

        }
        Flow{
            spacing: 25
            Button{
                width: 200
                id:connect
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/c.png" : "qrc:/icon_sys/t.png"
                text: hovered ? qsTr("按下连接") : qsTr("连接数据库")
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:connectCode
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/d.png" : "qrc:/icon_sys/s.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }
        }
        Flow{
            spacing: 25
            Button{
                width: 200
                id:create
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/f.png" : "qrc:/icon_sys/o.png"
                text: hovered ? qsTr("按下创建") : qsTr("创建数据库")
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:createCode
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/g.png" : "qrc:/icon_sys/x.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }
        }
        Flow{
            spacing: 25
            Button{
                width: 200
                id:createTable
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/h.png" : "qrc:/icon_sys/y.png"
                text: hovered ? qsTr("按下创建") : qsTr("创建数据库表")
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:createTableCode
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/h.png" : "qrc:/icon_sys/z.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }
        }
        Flow{
            spacing: 25
            Button{
                width: 200
                id:search
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/i.png" : "qrc:/icon_sys/l.png"
                text: hovered ? qsTr("按下查询") : qsTr("查询")
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:searchCode
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/j.png" : "qrc:/icon_sys/k.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }
        }
        Flow{
            spacing: 25
            Button{
                width: 200
                id:modify
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/aa.png" : "qrc:/icon_sys/bb.png"
                text: hovered ? qsTr("按下修改") : qsTr("修改")
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:modifyCode
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/cc.png" : "qrc:/icon_sys/dd.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }
        }


    }
}
