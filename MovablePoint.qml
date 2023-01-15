import QtQuick 2.15

import QtQuick.Controls 2.15

Rectangle {
    id: point
    color: "black"
    radius: width / 2
    width: 10
    height: 10

//    MouseArea {
//        id : area
//        anchors.fill: parent
//        x: point.x
//        y: point.y

//        acceptedButtons: Qt.LeftButton

//        Menu {
//            id: triangleMenu
//            MenuItem {
//                text: qsTr("Удалить")
//            }
//        }

////        onClicked: {
////            triangleMenu.popup()
////        }

//        onMouseXChanged : {
//            point.x = mapToItem(point.parent, mouse.x, mouse.y).x
//        }
//        onMouseYChanged: {
//            point.y = mapToItem(point.parent, mouse.x, mouse.y).y
//        }
//    }
}
