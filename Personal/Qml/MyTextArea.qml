import QtQuick 2.0
import QtQuick.Controls 2.12

TextArea {
    id: control
    placeholderText: qsTr("Enter description")

    background: Rectangle {
    implicitWidth: 200
    implicitHeight: 40
    border.color: control.enabled ? "#21be2b" : "transparent"
    }
}
