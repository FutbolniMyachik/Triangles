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

    property list<point> points
    property bool savePoints: false

    Menu {
        id: triangleMenu
        property int triangleIndex: 0
        MenuItem {
            text: qsTr("Удалить")
            onTriggered : {
                triangleModel.removeTriangle(triangleMenu.triangleIndex)
            }
        }
    }

    Repeater {

        anchors.fill: parent
        model: triangleModel

        delegate: Item {

            MovablePoint {
                parent: triangle
                x: xPoint.x
                y: xPoint.y

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: {
                        if (mouse.button == Qt.RightButton) {
                            triangleMenu.popup()
                            triangleMenu.triangleIndex = index.row
                        }
                    }
                    onMouseXChanged: {
                        if (mouse.button != Qt.RightButton)
                            xPoint.x = mapToItem(parent.parent, mouse.x, mouse.y).x
                    }
                    onMouseYChanged: {
                        if (mouse.button != Qt.RightButton)
                            xPoint.y = mapToItem(parent.parent, mouse.x, mouse.y).y
                    }
                }
            }
            MovablePoint {
                parent: triangle
                x: yPoint.x
                y: yPoint.y
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: {
                        if (mouse.button == Qt.RightButton) {
                            triangleMenu.popup()
                            triangleMenu.triangleIndex = index.row
                        }
                    }
                    onMouseXChanged: {
                        if (mouse.button != Qt.RightButton)
                            yPoint.x = mapToItem(parent.parent, mouse.x, mouse.y).x
                    }
                    onMouseYChanged: {
                        if (mouse.button != Qt.RightButton)
                            yPoint.y = mapToItem(parent.parent, mouse.x, mouse.y).y
                    }
                }
            }
            MovablePoint {
                parent: triangle
                x: zPoint.x
                y: zPoint.y
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: {
                        if (mouse.button == Qt.RightButton) {
                            triangleMenu.popup()
                            triangleMenu.triangleIndex = index.row
                        }
                    }
                    onMouseXChanged: {
                        if (mouse.button != Qt.RightButton)
                            zPoint.x = mapToItem(parent.parent, mouse.x, mouse.y).x
                    }
                    onMouseYChanged: {
                        if (mouse.button != Qt.RightButton)
                            zPoint.y = mapToItem(parent.parent, mouse.x, mouse.y).y
                    }
                }
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
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        enabled: savePoints
        onClicked: {
            if (!window.savePoints)
                return
            points.push(Qt.point(mouse.x, mouse.y))
            if (points.length <= 2)
                return;
            window.savePoints = false
            triangleModel.addTriangle(points[0], points[1], points[2])
            points = {}
        }
    }

    Button {
        text: qsTr("Добавить треугольник")
        id: contextMenuMouseArea
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        onClicked: {
            window.savePoints = true
        }
    }
}
