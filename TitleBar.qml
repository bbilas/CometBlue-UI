/***************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
** Modified by: Bartosz Bilas (bartosz.bilas@hotmail.com)
**
****************************************************************************/

import QtQuick 2.7

Rectangle    {
    id: titleBar
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: AppStyle.fieldHeight
    color: AppStyle.viewColor

    property var __titles: ["CONNECT", "MEASURE", "STATS", "SETTINGS"]
    property int currentIndex: 0

    signal titleClicked(int index)

    Repeater {
        model: 4
        Text {
            width: titleBar.width / 4
            height: titleBar.height
            x: index * width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: __titles[index]
            font.pixelSize: AppStyle.tinyFontSize
            color: titleBar.currentIndex === index ? AppStyle.textColor : AppStyle.disabledTextColor

            MouseArea {
                anchors.fill: parent
                onClicked: titleClicked(index)
            }
        }
    }


    Item {
        anchors.bottom: parent.bottom
        width: parent.width / 4
        height: parent.height
        x: currentIndex * width

        BottomLine{}

        Behavior on x { NumberAnimation { duration: 200 } }
    }

}
