import QtQuick 2.0
import QtQuick.Controls 2.0
Item{
    id:root
    property alias color: edit.color
    property alias lineCount: edit.lineCount
    property alias readOnly: edit.readOnly
    function append(s){
        return edit.append(s)
    }
    Flickable {
         id: flick
         contentWidth: edit.paintedWidth
         contentHeight: edit.paintedHeight
         clip: true
         anchors.fill: parent

         function ensureVisible(r)
         {
             if (contentX >= r.x)
                 contentX = r.x;
             else if (contentX+width <= r.x+r.width)
                 contentX = r.x+r.width-width;
             if (contentY >= r.y)
                 contentY = r.y;
             else if (contentY+height <= r.y+r.height)
                 contentY = r.y+r.height-height;
         }

         TextEdit {
             id: edit
             width: flick.width
             focus: true
             wrapMode: TextEdit.Wrap
             onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
             readOnly: true
         }
     }


}
