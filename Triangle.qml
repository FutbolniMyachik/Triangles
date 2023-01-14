import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {
    id: triangle
    property MovablePoint xPoint: xPoint
    property MovablePoint yPoint: yPoint
    property MovablePoint zPoint: zPoint
//    property list<MovablePoint> points: [
//        MovablePoint {
//            id: xPoint
//            parent: triangle
//        },
//        MovablePoint {
//            id: yPoint
//            parent: triangle
//        },
//        MovablePoint {
//            id: zPoint
//            parent: triangle
//        }
//    ]
    Shape {
        opacity: 0.5
        ShapePath {
            id: shapePath
            strokeColor: "black"
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

//            startX: triangle.points[1].x
//            startY: triangle.points[1].y
//            function createPathCurve(point) {
//                var qmlString = '
//                        import QtQuick 2.15
//                        import QtQuick.Shapes 1.15
//                        PathLine {
//                            x: xPoint.x
//                            y: xPoint.y
//                        }'
//                console.log(qmlString)
//                var pathLine = Qt.createQmlObject(qmlString, shapePath);
//            }

//            Component.onCompleted: {
//                for (var i = 0; i < triangle.points.lenght; ++i) {
//                    createPathCurve(triangle.points[i])
//                }
//                createPathCurve(triangle.points[0])
//            }
        }
//        MouseArea {
//            onXChanged: {

//            }
//        }
    }
    MovablePoint {
        id: xPoint
        parent: triangle
    }
    MovablePoint {
        id: yPoint
        parent: triangle
    }
    MovablePoint {
        id: zPoint
        parent: triangle
    }
}
