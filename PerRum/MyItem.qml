import QtQuick 2.0
import QtQuick.Controls 2.0

Text {
    width: 100; height: 100
    text: mesg.name    // invokes Message::author() to get this value

    Component.onCompleted: {
        mesg.name = "Jonah"  // invokes Message::setAuthor()
    }
}
