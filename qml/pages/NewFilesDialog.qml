import QtQuick 2.5
import Sailfish.Silica 1.0

Dialog {
    id: dialog

    property string operation: ""
    property string path: ""

    property string currentFileType: "directory"

    property var files: [ ]

    canAccept: true

    allowedOrientations: Orientation.All

    onAccepted: {
        addEntry()
    }

    DialogHeader {
        id: header
    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.bottom: parent.bottom

        ComboBox {
            width: parent.width
            label: qsTr("Type")

            menu: ContextMenu {
                id: contextMenu

                MenuItem {
                    text: qsTr("Map")
                    onClicked: currentFileType = "directory"
                }
                MenuItem {
                    text: qsTr("File")
                    onClicked: currentFileType = "file"
                }
            }
        }

        TextField {
            id: name
            placeholderText: qsTr("Name…")
            width: parent.width
            focus: true

            onTextChanged: {
                var valid = validateEntryName(text)
                name.errorHighlight = !valid
                canAccept = valid
            }
        }

    }

    function addEntry()
    {
        var entries = [];

        var entry = {};
        entry.path = path
        entry.type = currentFileType
        entry.name = name.text

        entries[0] = entry

        var json = JSON.stringify(entries)

        engine.createEntries(json)

        getDirectoryPage().refreshDirectoryView()
    }

    function validateEntryName(entryName)
    {
        if (entryName.indexOf("\\") != -1 || entryName.indexOf("/") != -1 || entryName == "")
            return false
        else
            return true
    }

    function updateEntryName(id, name)
    {
        fileModel.get(id).name = name
    }
}
