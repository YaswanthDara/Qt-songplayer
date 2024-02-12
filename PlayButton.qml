import QtQuick 2.15

Item {
    id: root
    property alias buttonTextColor: buttonText.color
    property alias buttonColor: button.color
    property alias buttonText: buttonText.text
    property alias textFont: buttonText.font.pointSize
    property alias radius: button.radius
    signal clicked
    Rectangle {
        id: button
        anchors.fill: parent
        Text {
            id: buttonText
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
