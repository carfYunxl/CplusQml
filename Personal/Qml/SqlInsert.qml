import QtQuick 2.0
import QtQuick.Controls 2.2
import mysql 1.0
import myfile 1.0
ApplicationWindow{
    id:root
    width: 400
    height: 400
    title: qsTr("插入")
    visible: true

    background: Rectangle{
        color: "lightblue"
    }

    My_SQL{
        id:msql
    }
    Column{
        id:col4
        spacing: 20
        anchors.centerIn: parent
        MyTextArea{
            id:insert
            placeholderText: "请输入sql插入语句"
        }
        Button{
            id:button
            text: qsTr("Insert")
            onClicked: {
                msql.insertItem(insert.text)
            }
        }
    }
}
