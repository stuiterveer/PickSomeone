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

        Label {
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            text: i18n.tr('Hello World!')

            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
    }
}
