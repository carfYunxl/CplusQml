import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import helllo 1.0
import msgA 1.0
import msgB 1.0
import login 1.0
Item {
    id: root
    width: 600
    height: 400
    visible: true

    Text {
        id: name
        anchors.centerIn: parent
        text: pm.name  + md.body.text1 + pm.age

        Message
        {
            id:md
            body:MessageBody
            {
                text1:"Hello World"
            }
        }
        PersonMessage{
            id:pm
            name: "yunxinle"
            age:12
        }
    }

}


