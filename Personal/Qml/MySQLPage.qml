import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import mysql 1.0
import myfile 1.0
import showpage 1.0
Item {
    id: root
    My_SQL{
        id:msql
    }
    My_File{
        id:mfile
    }
    ShowPage{
        id:sp
    }
    ColumnLayout{
        id:column
        anchors.centerIn: parent
//界面布局
        //第一行按钮
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
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ShowEnabledDriver.qml")
                }
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:showCode
                background: Rectangle{
                    color: showCode.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/b.png" : "qrc:/icon_sys/n.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")

                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ShowDriverSourceCode.qml")
                }
            }

        }
        //第二行按钮
        Flow{
            spacing: 25
            Button{
                width: 200
                id:connect
                background: Rectangle{
                    color: connect.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/c.png" : "qrc:/icon_sys/t.png"
                text: hovered ? qsTr("按下连接") : qsTr("连接数据库")
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ConnectToDataBase.qml")
                }
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:connectCode
                background: Rectangle{
                    color: connectCode.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/d.png" : "qrc:/icon_sys/s.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")

                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ShowConnectToDataBaseSourceCode.qml")
                }
            }
        }
        //第三行按钮
        Flow{
            spacing: 25
            Button{
                width: 200
                id:createTable
                background: Rectangle{
                    color: createTable.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/h.png" : "qrc:/icon_sys/y.png"
                text: hovered ? qsTr("按下创建") : qsTr("创建数据库表")

                onClicked: {
                    sp.showWorkPage("qrc:/Qml/CreateTable.qml")
                }
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:createTableCode
                background: Rectangle{
                    color: createTableCode.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/h.png" : "qrc:/icon_sys/z.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ShowCreateTableSourceCode.qml")
                }
            }
        }
        //第四行按钮
        Flow{
            spacing: 25
            Button{
                width: 200
                id:search
                background: Rectangle{
                    color: search.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/i.png" : "qrc:/icon_sys/l.png"
                text: hovered ? qsTr("按下查询") : qsTr("查询")
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/SelectTable.qml")
                }
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:searchCode
                background: Rectangle{
                    color: searchCode.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/j.png" : "qrc:/icon_sys/k.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ShowSelectSourceCode.qml")
                }
            }
        }
        //第五行按钮
        Flow{
            spacing: 25
            Button{
                width: 200
                id:modify
                background: Rectangle{
                    color: modify.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/aa.png" : "qrc:/icon_sys/bb.png"
                text: hovered ? qsTr("按下修改") : qsTr("修改")
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/SqlInsert.qml")
                }
            }
            Label{
                text: qsTr(" /=\\ ")
            }
            Button{
                width: 200
                id:modifyCode
                background: Rectangle{
                    color: modifyCode.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/cc.png" : "qrc:/icon_sys/dd.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
                onClicked: {
                    sp.showWorkPage("qrc:/Qml/ShowInsertSourceCode.qml")
                }
            }
        }
    }
}
