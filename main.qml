import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import QtQuick.Shapes 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Repeater {
        anchors.fill: parent
        model: triangleModel
//        delegate: Triangle {
//            point1.x: xPoint.x
//            point1.y: xPoint.y
//            point2.x: yPoint.x
//            point2.y: yPoint.y
//            point3.x: zPoint.x
//            point3.y: zPoint.y
//        }

        delegate: Item {
            id: triangle
            property MovablePoint x1: MovablePoint {
                parent: triangle
                x: xPoint.x
                y: xPoint.y
            }
            property MovablePoint y1: MovablePoint {
                parent: triangle
                x: yPoint.x
                y: yPoint.y
            }
            property MovablePoint z1: MovablePoint {
                parent: triangle
                x: zPoint.x
                y: zPoint.y
            }
            Shape {
                opacity: 0.5
                ShapePath {
                    id: shapePath
                    strokeColor: Qt.rgba(Math.random(), Math.random(), Math.random())
                    strokeWidth: 4

                    startX: xPoint.x
                    startY: xPoint.y

                    PathLine {
                        x: xPoint.x
                        y: xPoint.y
                    }
                    PathLine {
                        x: yPoint.x
                        y: yPoint.y
                    }
                    PathLine {
                        x: zPoint.x
                        y: zPoint.y
                    }
                    PathLine {
                        x: xPoint.x
                        y: xPoint.y
                    }
                }
            }
        }
    }

    MouseArea {
        property list<point> points
        property bool savePoints: false

        id: contextMenuMouseArea
        anchors.fill: parent
        acceptedButtons: Qt.RightButton | Qt.LeftButton
        onClicked: {
            if (mouse.button == Qt.RightButton)
                contextMenu.popup()
            if ((mouse.button == Qt.LeftButton) && savePoints) {
                points.push(Qt.point(mouse.x, mouse.y))
                if (points.length > 2) {
                    savePoints = false
                    triangleModel.addTriangle(points[0], points[1], points[2])
                    points = {}
                }
            }
        }


        Menu {
            id: contextMenu
            MenuItem {
                text: qsTr("Добавить трегуольник")
                onTriggered: {
                    contextMenuMouseArea.savePoints = true
                }
            }
        }
    }

}
