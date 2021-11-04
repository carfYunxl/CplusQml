import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import helllo 1.0
import msgA 1.0
import msgB 1.0
Text {
    id: name
    text: pm.name  + md.body.text1

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
    }
}


