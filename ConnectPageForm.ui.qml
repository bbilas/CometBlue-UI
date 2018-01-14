import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Item {
    id: item1

    Rectangle {
        id: viewContainer
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: AppStyle.fieldMargin + 40
        anchors.bottomMargin: AppStyle.fieldMargin
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - AppStyle.fieldMargin*2
        color: AppStyle.viewColor
        radius: AppStyle.buttonRadius


        Text {
            id: title
            width: parent.width
            height: AppStyle.fieldHeight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: AppStyle.textColor
            font.pixelSize: AppStyle.mediumFontSize
            text: qsTr("FOUND DEVICES")

            BottomLine {
                height: 1;
                width: parent.width
                color: "#898989"
            }
        }


        ListView {
            id: devices
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: title.bottom
            //            model:
            clip: true

            delegate: Rectangle {
                id: box
                height:AppStyle.fieldHeight * 1.2
                width: parent.width
                color: index % 2 === 0 ? AppStyle.delegate1Color : AppStyle.delegate2Color

                MouseArea {
                    anchors.fill: parent
                }

                Text {
                    id: device
                    font.pixelSize: AppStyle.smallFontSize
                                        text: qsTr("duap")
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 0.1
                    anchors.leftMargin: parent.height * 0.1
                    anchors.left: parent.left
                    color: AppStyle.textColor
                }

                Text {
                    id: deviceAddress
                    font.pixelSize: AppStyle.smallFontSize
                    //                    text:
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height * 0.1
                    anchors.rightMargin: parent.height * 0.1
                    anchors.right: parent.right
                }
            }
        }
    }

    Button{
        id: connectButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: searchButton.bottom
        anchors.bottomMargin: AppStyle.fieldMargin + 40
        width: viewContainer.width
        height: AppStyle.fieldHeight
        enabled: false


        Text {
            anchors.centerIn: parent
            font.pixelSize: AppStyle.tinyFontSize
            text: qsTr("CONNECT WITH DEVICE")
            color: connectButton.enabled ? AppStyle.textDarkColor : AppStyle.disabledTextColor
        }
    }

    Button{
        id: searchButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: AppStyle.fieldMargin
        width: viewContainer.width
        height: AppStyle.fieldHeight
        enabled: true


        Text {
            anchors.centerIn: parent
            font.pixelSize: AppStyle.tinyFontSize
            text: qsTr("START SEARCH")
            color: searchButton.enabled ? AppStyle.textDarkColor : AppStyle.disabledTextColor
        }
    }
}
