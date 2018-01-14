/***************************************************************************
**
** Author: Bartosz Bilas (bartosz.bilas@hotmail.com)
**
****************************************************************************/

import QtQuick 2.7
import QtQuick.Window 2.2
import "."

Window {
    id: wroot
    visible: true
    width: 720 * .7
    height: 1240 * .7
    title: qsTr("CometBlue")
    color: AppStyle.backgroundColor

    property int __currentIndex: 0

    Component.onCompleted: {
        AppStyle.wWidth = Qt.binding(function() {return width})
        AppStyle.wHeight = Qt.binding(function() {return height})
    }

    TitleBar {
        id: titleBar
        anchors.top: parent.top
        currentIndex: __currentIndex
        onTitleClicked: __currentIndex = index
    }
}
