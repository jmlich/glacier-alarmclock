import QtQuick 2.6

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0

import Nemo.Alarms 1.0


Page {

    id: mainPage

    AlarmsModel {
        id: alarmModel
        onPopulatedChanged: {

            console.log("populated" + populated)
        }
    }


    headerTools: HeaderToolsLayout {
        id: tools
        title: qsTr("Alarms")

        tools: [
//            ToolButton {
//                iconSource: "image://theme/cog"
//                onClicked: {
//                    mainPage.Stack.view.push(Qt.resolvedUrl("SettingsPage.qml"), {settingsObject: settings})
//                }
//            },
            ToolButton {
                iconSource: "image://theme/plus"
                onClicked: {
                    mainPage.Stack.view.push(Qt.resolvedUrl("AddAlarmPage.qml"), {alarmModel: alarmModel, selectedAlarm: null})
                }
            }

        ]
    }

    ListView {
        id: listView;
        width: parent.width !== undefined ? parent.width : 200;
        height: parent.height !== undefined ? parent.height : 200;
        model: alarmModel

        delegate: ListViewItemWithActions {
            label: pad2(model.hour) + ":" + pad2(model.minute)
            description: model.enabled ? enabledDaysOfWeek(model.daysOfWeek) : qsTr("Disabled")
            showNext: false
            iconVisible: false

            width: (parent != null) ? parent.width : 100
            height: Theme.itemHeightLarge

            onClicked: {
                mainPage.Stack.view.push(Qt.resolvedUrl("AddAlarmPage.qml"), {alarmModel: model, selectedAlarm: model.alarm})
            }

            actions:[
                ActionButton {
                    iconSource: "image://theme/trash"
                    onClicked: {
                        model.alarm.deleteAlarm();
                    }
                },
                ActionButton {
                    iconSource: model.enabled ? "image://theme/times" : "image://theme/check"
                    onClicked: {
                        model.alarm.enabled = !model.alarm.enabled;
                        model.alarm.save();
                    }
                }
            ]
        }

    }


    ScrollDecorator {
        flickable: listView
    }

}
