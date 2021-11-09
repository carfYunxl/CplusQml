import QtQuick 2.0
import QtQuick.Controls 2.2
import mysql 1.0
ApplicationWindow {
    id: root
    width: 300
    height: 200
    visible: true
    title: qsTr("Drivers")
    background: Rectangle{
        color: "black"
    }
    TextEdit {
        id: tex_driver
        anchors.fill: parent
        text:  "Enabled drivers : " + msql.showDrivers()
        focus: true
        wrapMode:TextEdit.Wrap
        color: "white"
        selectByMouse: true
        mouseSelectionMode:TextEdit.SelectWords
        renderType: Text.QtRendering
        persistentSelection: true
    }

    My_SQL{
        id:msql
    }
}
