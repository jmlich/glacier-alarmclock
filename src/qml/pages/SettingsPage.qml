import QtQuick
import Nemo.Controls
import "../components"

Page {
    id: mainPage

    property variant settingsObject

    headerTools: HeaderToolsLayout {
        id: tools
        title: qsTr("Settings")
        showBackButton: true;

    }


}
