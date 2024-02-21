import QtQuick 2.1
import Sailfish.Silica 1.0
import "./components"

Page {
    id: settingspage
        allowedOrientations: Orientation.All

    SilicaFlickable
    {
        anchors.fill: parent
        contentHeight: content.height

        Column
        {
            id: content
            width: parent.width

            PageHeader { title: qsTr("Settings") }

            SectionHeader { text: qsTr("Fileman settings") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-file-image"
                text: qsTr("Cache thumbnails")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/DirectoryViewSettings.qml"))
            }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-transfer"
                text: qsTr("File ordering")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/FileOrderSettings.qml"))
            }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-display"
                text: qsTr("File display")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/FileDisplay.qml"))
            }

            SectionHeader { text: qsTr("Fileman information") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-about"
                text: qsTr("About Fileman")
                onActionRequested: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }

            SectionHeader { text: qsTr("Fileman translations") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-region"
                text: qsTr("Translations")
                onActionRequested: pageStack.push(Qt.resolvedUrl("TranslationsPage.qml"))
            }
          }
        }
      }
