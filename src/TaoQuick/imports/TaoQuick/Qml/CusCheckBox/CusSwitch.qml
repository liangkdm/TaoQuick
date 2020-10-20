import QtQuick 2.9
import QtQuick.Controls 2.2
import ".."
import "../.."
Switch {
    id: cusSwitch
    implicitWidth: 36
    implicitHeight: 20
    property color backgroundColor_on :"#579ee5"
    property color indicatorColor_on: "#ffffff"

    property color backgroundColor_on_disable: "#108bcb"
    property color indicatorColor_on_disable: "#b6bdc5"

    property color backgroundColor_off :"#808080"
    property color indicatorColor_off: "#ffffff"

    property color backgroundColor_off_disable :"#919191"
    property color indicatorColor_off_disable: "#b6bdc5"

    indicator: Rectangle {
        id: indicatorRect
        width: cusSwitch.width
        height: cusSwitch.height
        x: cusSwitch.leftPadding
        y: (parent.height - height) / 2
        radius: height / 2
        color: cusSwitch.enabled ? backgroundColor_off : backgroundColor_off_disable
        antialiasing: true
        smooth: true
        Rectangle {
            id: backgroundRect
            height: parent.height
            radius: parent.radius
            width: barRect.x + barRect.width - 1
            color: cusSwitch.enabled ? backgroundColor_on : backgroundColor_on_disable
            antialiasing: true
            smooth: true
        }
        Rectangle {
            id: barRect
            x: cusSwitch.checked ? parent.width - width : 0
            antialiasing: true
            smooth: true
            Behavior on x {
                NumberAnimation { duration: 80}
            }
            height: parent.height
            width: height
            radius: width / 2
            color: cusSwitch.enabled ? (cusSwitch.checked ? indicatorColor_on : indicatorColor_off) : (cusSwitch.checked ? indicatorColor_on_disable : indicatorColor_off_disable)
            border.width: 1
            border.color: cusSwitch.checked ? backgroundColor_on : backgroundColor_off
        }
    }
    TransArea {}
}