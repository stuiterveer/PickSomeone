import QtQuick 2.12
import Lomiri.Components 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'picksomeone.stuiterveer'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    property int fullSeconds: 0
    property int selectedFinger: 0

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: 'Pick Someone!'
        }

        Timer {
            id: timer
            interval: 1000
            repeat: true

            onTriggered: {
                fullSeconds++;
                if (fullSeconds == 10) {
                    var currentlyPressed = []
                    for (var i = 0; i < touchSurface.touchPoints.length; i++) {
                        if (touchSurface.touchPoints[i].pressed) {
                            currentlyPressed.push(i);
                        }
                    }

                    selectedFinger = currentlyPressed[Math.floor(Math.random() * currentlyPressed.length)];
                }
            }
        }

        MultiPointTouchArea {
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            id: touchSurface

            maximumTouchPoints: 5
            touchPoints: [
                TouchPoint {id: point1},
                TouchPoint {id: point2},
                TouchPoint {id: point3},
                TouchPoint {id: point4},
                TouchPoint {id: point5}
            ]

            Rectangle {
                width: units.gu(13)
                height: width
                radius: width/2
                x: point1.x - (width / 2)
                y: point1.y - (height / 2)
                color: 'green'
                visible: point1.pressed
            }

            Rectangle {
                width: units.gu(13)
                height: width
                radius: width/2
                x: point2.x - (width / 2)
                y: point2.y - (height / 2)
                color: 'yellow'
                visible: point2.pressed
            }

            Rectangle {
                width: units.gu(13)
                height: width
                radius: width/2
                x: point3.x - (width / 2)
                y: point3.y - (height / 2)
                color: 'red'
                visible: point3.pressed
            }

            Rectangle {
                width: units.gu(13)
                height: width
                radius: width/2
                x: point4.x - (width / 2)
                y: point4.y - (height / 2)
                color: 'blue'
                visible: point4.pressed
            }

            Rectangle {
                width: units.gu(13)
                height: width
                radius: width/2
                x: point5.x - (width / 2)
                y: point5.y - (height / 2)
                color: 'purple'
                visible: point5.pressed
            }

            onTouchUpdated: {
                if (touchPoints.length > 0) {
                    if (!timer.running) {
                        timer.start();
                    }
                } else {
                    fullSeconds = 0;
                    timer.stop();
                }
            }
        }
    }
}
