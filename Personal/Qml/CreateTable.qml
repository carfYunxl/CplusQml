import QtQuick 2.0
import QtQuick.Controls 2.2
import mysql 1.0
import myfile 1.0
ApplicationWindow{
    id:root
    width: 400
    height: 400
    title: qsTr("Create DataBase Table")
    visible: true
    background: Rectangle{
        color: "lightblue"
    }

    My_SQL{
        id:msql
    }
    Column{
        id:col
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
        Button{
            id:button
            text: qsTr("创建")
            onClicked: {
                msql.createTable(tableName,{arg1,arg2,arg3})
            }
        }

    }
}
