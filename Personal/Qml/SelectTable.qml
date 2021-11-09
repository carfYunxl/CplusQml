import QtQuick 2.0
import QtQuick.Controls 2.2
import mysql 1.0
import myfile 1.0
ApplicationWindow{
    id:root
    width: 400
    height: 400
    visible: true
    title: qsTr("查询:")

    My_SQL{
        id:msql
    }
    background: Rectangle{
        color: "lightblue"
    }
    Column{
        id:col
        spacing: 20
        anchors.centerIn: parent
        MyTextArea{
            id:query
            placeholderText: "请输入sql查询语句"
        }
        MyTextArea{
            id:result
            placeholderText: "result"
        }
        Button{
            id:button
            text: qsTr("Select")
            onClicked: {
                msql.selectItem(query.text)
            }
        }
    }
}
