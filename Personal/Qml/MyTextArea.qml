import QtQuick 2.0
import QtQuick.Controls 2.12

TextArea {
    id: control
    placeholderText: control.text
    horizontalAlignment:TextEdit.AlignHCenter
    verticalAlignment:TextEdit.AlignVCenter
    opacity: 1.0
    SequentialAnimation on opacity {
        loops: Animation.Infinite
        PropertyAnimation{ to:0.5; duration:1500}
        PropertyAnimation{ to:1.0; duration:1500}
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        border.color: "transparent"
        color: "white"
    }
}
