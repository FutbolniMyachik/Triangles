import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {
    id: triangle
    property MovablePoint point1: MovablePoint {
        parent: triangle
    }
    property MovablePoint point2: MovablePoint {
        parent: triangle
    }
    property MovablePoint point3: MovablePoint {
        parent: triangle
    }
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
                x: point1.x
                y: point1.y
            }
            PathLine {
                x: point2.x
                y: point2.y
            }
            PathLine {
                x: point3.x
                y: point3.y
            }
            PathLine {
                x: point1.x
                y: point1.y
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
}
