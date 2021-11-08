import QtQuick 2.0
import QtQuick.Controls 2.12

TextField {
    id: control
    placeholderText: txt.text
    horizontalAlignment:TextEdit.AlignHCenter
    verticalAlignment:TextEdit.AlignVCenter
    background: Rectangle {
    implicitWidth: 200
    implicitHeight: 40
    color: control.enabled ? "transparent" : "#353637"
    }
}
