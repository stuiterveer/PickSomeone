import QtQuick 2.12
import Lomiri.Components 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'picksomeone.stuiterveer'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: 'Pick Someone!'
        }

        MultiPointTouchArea {
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            maximumTouchPoints: 5
            touchPoints: [
                TouchPoint {id: point1},
                TouchPoint {id: point2},
                TouchPoint {id: point3},
                TouchPoint {id: point4},
                TouchPoint {id: point5}
            ]

            Rectangle {
                id: rect1
                width: units.gu(10)
                height: width
                radius: width/2
                x: point1.x - (width / 2)
                y: point1.y - (height / 2)
                color: 'green'
                visible: false
            }

            Rectangle {
                id: rect2
                width: units.gu(10)
                height: width
                radius: width/2
                x: point2.x - (width / 2)
                y: point2.y - (height / 2)
                color: 'yellow'
                visible: false
            }

            Rectangle {
                id: rect3
                width: units.gu(10)
                height: width
                radius: width/2
                x: point3.x - (width / 2)
                y: point3.y - (height / 2)
                color: 'red'
                visible: false
            }

            Rectangle {
                id: rect4
                width: units.gu(10)
                height: width
                radius: width/2
                x: point4.x - (width / 2)
                y: point4.y - (height / 2)
                color: 'blue'
                visible: false
            }

            Rectangle {
                id: rect5
                width: units.gu(10)
                height: width
                radius: width/2
                x: point5.x - (width / 2)
                y: point5.y - (height / 2)
                color: 'purple'
                visible: false
            }

            onTouchUpdated: {
                var pointLut = [rect1, rect2, rect3, rect4, rect5]
                for (var i = 0; i < pointLut.length; i++) {
                    if (i < touchPoints.length) {
                        pointLut[i].visible = true;
                    } else {
                        pointLut[i].visible = false;
                    }
                }
            }
        }
    }
}
