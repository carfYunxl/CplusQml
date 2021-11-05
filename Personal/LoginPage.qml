import QtQuick 2.0
import QtQuick.Controls 2.0
import login 1.0
import msgA 1.0
import msgB 1.0
import helllo 1.0
import sLogin 1.0
ApplicationWindow{
    id:root
    width: 500
    height: 600
    visible: true
    title: qsTr("Login")

    Rectangle{
        id:rect
        width: root.width
        height: root.height
        color: "gray"
    }

    Image{
        id:image
    }
    ShowLogin{
        window: Login{
        id:lo
        }
    }
    Button{
        id:login
        width: 60
        height: 30
        anchors.centerIn: parent

        onClicked:{
            lo.show()
            root.hide()
        }
    }
}
