import QtQuick 2.9
import QtQuick.Controls 2.2

Dialog{
    id:root
    implicitWidth: 600
    implicitHeight: 400
    modal: false
    closePolicy: Popup.NoAutoClose

    property alias text: tex.text
    background: Rectangle{
        color: "lightgray"
    }

    ScrollView{
        id:scview
        anchors.fill: parent
        wheelEnabled: true
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
             ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.interactive: true
        TextEdit {
            id: tex
            anchors.fill: parent
            text: qsTr("Hello")
            focus: true
            wrapMode: TextEdit.Wrap
            color: "black"
            selectByMouse: true
            mouseSelectionMode:TextEdit.SelectWords
            renderType: Text.QtRendering
            persistentSelection: true
            cursorVisible: true
        }
    }
}
