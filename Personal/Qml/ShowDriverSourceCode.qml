import QtQuick 2.0
import QtQuick.Controls 2.2
import mysql 1.0
import myfile 1.0
ApplicationWindow{
    id:root
    width: 600
    height: 400
    visible: true
    title:qsTr("Source Code")
    background: Rectangle{
        color: "lightblue"
    }

    My_File{
        id:mfile
    }
    ScrollView{
        id:view
        anchors.fill: parent
        wheelEnabled: true
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.interactive: true
        TextEdit {
            id: text
            anchors.fill: parent
            text: mfile.readCode("DriverCode")
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
