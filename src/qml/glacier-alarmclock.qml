import QtQuick 2.6
import QtQuick.Window 2.1

import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0

import Nemo.Alarms 1.0

import "pages"
// import "components"

ApplicationWindow {
    id: window

    initialPage: MainPage {

    }

    ListModel {
        id: daysOfWeekModel
        ListElement { letter: "m"; short_name: qsTr("Mon"); enabled: true; }
        ListElement { letter: "t"; short_name: qsTr("Tue"); enabled: true; }
        ListElement { letter: "w"; short_name: qsTr("Wed"); enabled: true; }
        ListElement { letter: "T"; short_name: qsTr("Thu"); enabled: true; }
        ListElement { letter: "f"; short_name: qsTr("Fri"); enabled: true; }
        ListElement { letter: "s"; short_name: qsTr("Sat"); enabled: true; }
        ListElement { letter: "S"; short_name: qsTr("Sun"); enabled: true; }
    }

    // add leading 0 when lower than 10
    function pad2(num) {
        return (num < 10) ? "0" + num : num;
    }

    // transforms letter based selection of days in week (mtwTfsS) to string using short_name
    function enabledDaysOfWeek(str) {
        var ret = '';
        if (str.length === 7) {
            return qsTr("Whole week");
        }

        for (var i = 0; i < daysOfWeekModel.count; i++) {
            var it = daysOfWeekModel.get(i)
            if (str.indexOf(it.letter) !== -1) {
                ret += it.short_name + " "
            }
//            if (str.)
        }
        return ret;
    }

}
