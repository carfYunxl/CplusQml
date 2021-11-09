import QtQuick 2.0
import QtQuick.Controls 2.2
import mysql 1.0
import myfile 1.0
MyApplicationWindow{
    id:root
    width: 400
    height: 400
    title: qsTr("Connect to MySQL")
    background: Rectangle{
        color: "black"
    }
    My_SQL{
        id:msql
    }
    Column{
        id:col
        spacing: 20
        anchors.centerIn : parent
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
        Button{
            id:button
            text: "连接"
            onClicked: {
                msql.connectToDatabase(hostname.text,databasename.text,username.text,password.text)
            }
        }

    }
}
