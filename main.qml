import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property list<Triangle> triangles

    MouseArea {
        id: contextMenuMouseArea
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: contextMenu.popup()
        Menu {
            id: contextMenu
            MenuItem {
                text: qsTr("Добавить трегуольник")
                onTriggered: {
                    var component = Qt.createComponent("Triangle.qml");
                    var triangle = component.createObject(window, {});
                    window.triangles.push(triangle);
                }
            }
        }
    }

}
