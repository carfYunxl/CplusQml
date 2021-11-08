import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import mysql 1.0
Item {
    id: root
    My_SQL{
        id:msql
    }

    //显示支持的数据库
            Dialog{
                id:sql_driver
                width: 300
                height: 200
                x:0
                y:0
                modal: false
                title: qsTr("Drivers")
                standardButtons: Dialog.Ok
                closePolicy: Popup.NoAutoClose
                background: Rectangle{
                    color: "black"
                }
                TextEdit {
                    id: tex_driver
                    anchors.fill: parent
                    text: qsTr("Hello")
                    focus: true
                    wrapMode: TextEdit.Wrap
                    color: "white"
                    selectByMouse: true
                    mouseSelectionMode:TextEdit.SelectWords
                    renderType: Text.QtRendering
                    persistentSelection: true
                }
                onOpened: {
                    tex_driver.text = "Enabled drivers : <br>"
                            + msql.showDrivers()
                }
                onAccepted: {
                    sql_driver.closed()
                }
            }
    //显示该功能的源码
            MyCodeDialog{
                id:sql_driver_code
                x:100
                y:100
                title: qsTr("Source Code")
                standardButtons: Dialog.Ok | Dialog.Cancel
                onAccepted: {
                    msql.saveDriversCode(tex_driver_code.text);
                    sql_driver_code.closed()
                }
                onOpened: {
                     sql_driver_code.text = msql.readDriversCode()
                }
            }

            //连接数据库
            Dialog{
                id:sql_connect
                width: 400
                height: 400
                x:0
                y:0
                modal: false
                title: qsTr("Connect to MySQL")
                standardButtons: Dialog.Ok | Dialog.Cancel
                closePolicy: Popup.NoAutoClose
                background: Rectangle{
                    color: "black"
                }
                Column{
                    id:col
                    spacing: 20
                    anchors.centerIn: parent
                    MyTextArea{
                        id:hostname
                        placeholderText: "请输入主机名"

                    }
                    MyTextArea{
                        id:databasename
                        placeholderText: "请输入数据库名"
                    }
                    MyTextArea{
                        id:username
                        placeholderText: "请输入用户名"
                    }
                    MyTextArea{
                        id:password

                        placeholderText: "请输入用户密码"
                    }

                }
                onAccepted: {
                    msql.connectToDatabase(hostname.text,databasename.text,username.text,password.text)
                }
                onRejected: {

                }
            }
            /*显示连接数据库的源码*/
            MyCodeDialog{
                id:sql_create_code
                x:200
                y:200
                title: qsTr("Source Code")
                standardButtons: Dialog.Ok | Dialog.Cancel
                onAccepted: {

                }
                onOpened: {
                     sql_create_code.text = msql.readconnectToDatabaseCode()
                }
            }
            /*创建数据库表*/
            Dialog{
                id:sql_createTable
                width: 400
                height: 400
                x:0
                y:0
                modal: false
                title: qsTr("Create DataBase Table")
                standardButtons: Dialog.Ok | Dialog.Cancel
                closePolicy: Popup.NoAutoClose
                background: Rectangle{
                    color: "black"
                }
                Column{
                    id:col2
                    spacing: 20
                    anchors.centerIn: parent
                    MyTextArea{
                        id:tableName
                        placeholderText: "请输入表名"

                    }
                    MyTextArea{
                        id:arg1
                        placeholderText: "请输入参数1"
                    }
                    MyTextArea{
                        id:arg2
                        placeholderText: "请输入参数2"
                    }
                    MyTextArea{
                        id:arg3

                        placeholderText: "请输入参数3"
                    }

                }
                onAccepted: {
                    msql.createTable(tableName,{arg1,arg2,arg3})
                }
                onRejected: {

                }
            }
            /*显示创建数据库表的源码*/
            MyCodeDialog{
                id:sql_create_Table_code
                x:200
                y:200
                title: qsTr("Source Code")
                standardButtons: Dialog.Ok | Dialog.Cancel
                onAccepted: {

                }
                onOpened: {
                     sql_create_Table_code.text = msql.readcreateTableCode()
                }
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
                    sql_driver.open()
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
                    sql_driver_code.open()
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
                    sql_connect.open()
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
                    sql_create_code.open()
                }
            }
        }
        //第三行按钮
        Flow{
            spacing: 25
            Button{
                width: 200
                id:create
                background: Rectangle{
                    color: create.hovered ? "white" : "lightblue"
                }
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
                background: Rectangle{
                    color: createCode.hovered ? "white" : "lightblue"
                }
                display: AbstractButton.TextUnderIcon
                icon.source : hovered ? "qrc:/icon_sys/g.png" : "qrc:/icon_sys/x.png"
                text: hovered ? qsTr("按下显示") : qsTr("显示源码")
            }
        }
        //第四行按钮
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
                    sql_createTable.open()
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
                    sql_create_Table_code.open()
                }
            }
        }
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
            }
        }
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
            }
        }


    }
}
