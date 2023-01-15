import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import QtQuick.Shapes 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Triangles")

    property bool savePoints: false
    property list<point> points

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
            id: triangle
            function addPoint(point) {
                var newObject = Qt.createQmlObject(`
                   import QtQuick 2.15
                   import QtQuick.Controls 2.15

                   MovablePoint {
                       x: ${point}.x
                       y: ${point}.y

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
                                   ${point}.x = mapToItem(parent.parent, mouse.x, mouse.y).x
                           }
                           onMouseYChanged: {
                               if (mouse.button != Qt.RightButton)
                                   ${point}.y = mapToItem(parent.parent, mouse.x, mouse.y).y
                           }
                       }
                   }
                    `,
                    triangle,
                );
            }

            Component.onCompleted: {
                addPoint("xPoint")
                addPoint("yPoint")
                addPoint("zPoint")
            }

            Shape {
                opacity: 0.5
                ShapePath {
                    id: shapePath
                    strokeColor: Qt.rgba(Math.random(), Math.random(), Math.random())
                    strokeWidth: 4

                    startX: xPoint.x
                    startY: xPoint.y

                    function addPathLine(point) {
                        var pathLine = Qt.createQmlObject(`
                            import QtQuick 2.15
                            import QtQuick.Shapes 1.15
                            PathLine {
                                x: ${point}.x
                                y: ${point}.y
                            }
                            `,
                            shapePath,
                        );
                        shapePath.pathElements.push(pathLine)
                    }

                    Component.onCompleted: {
                        addPathLine("xPoint")
                        addPathLine("yPoint")
                        addPathLine("zPoint")
                        addPathLine("xPoint")
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


    Label {
        id: intersectLabel
        anchors.right: parent.right
        anchors.top: parent.top
        text: {
            return qsTr("Число пересечений ") + triangleModel.intersectCount().toString()
        }
        Connections {
            target: triangleModel
            onIntersectingCountChanged: {
                intersectLabel.text = qsTr("Число пересечений ") + triangleModel.intersectCount().toString()
            }
        }
    }

}
