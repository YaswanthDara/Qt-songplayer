import QtQuick 2.15

Rectangle {

    id : root
    property alias songtitle : songTitle.text
    property alias authorinfo: authorInfo.text
    property alias  songImageSource: songImage.source
    Image{
        id: songImage
        height: 320
        width: 240
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 20
        }
    }
    Text{
        id: songTitle
        color: "#ADD8E6"
        font.bold: true
        font.pointSize: 40
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        anchors {
            left: songImage.right
            top: songImage.top
            right: parent.right
            margins: 20
        }

    }

    Text {
        id: authorInfo
        color: songTitle.color
        font.pointSize: 20
        anchors {
            left: songImage.right
            top: songTitle.bottom
            right: parent.right
            leftMargin: 20
            topMargin: 10
            rightMargin: 20
        }
    }
}
