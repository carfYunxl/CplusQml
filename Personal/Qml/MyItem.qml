import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
MyApplicationWindow{
    id: root
    width: 600
    height: 400
    visible: true

    background: Rectangle
    {
        color:"blue"
    }
    Text {
        id: name
        anchors.centerIn: parent
        text: "hello"

    }
    MyTextArea{
    x:0
    y:0
    }
    MyTextField{
    x:0
    y:50
    }
}


