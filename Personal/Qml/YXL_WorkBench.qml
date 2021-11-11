import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Particles 2.12

import showpage 1.0
ApplicationWindow {
    id:root
    width: 1920*0.8
    height: 1080*0.8
    visible: true
    title: "WorkBench"
    ShowPage{
        id:show
    }

    menuBar: MenuBar {
        Menu{
            id:file
            title:qsTr("File")
            MenuItem{
                id:newAction
                text: qsTr("new")
                icon.source: "qrc:/icon_sys/a.png"
                onTriggered: {
                    console.log("newAction")
                }
            }
        }
        Menu{
            id:open
            title:qsTr("Open")
            MenuItem{
                id:openAction
                text: qsTr("open")
                icon.source: "qrc:/icon_sys/b.png"
                onTriggered: {
                    console.log("openAction")
                }
            }
        }
        Menu{
            id:edit
            title:qsTr("Edit")
            MenuItem{
                id:editAction
                text: qsTr("new")
                icon.source: "qrc:/icon_sys/c.png"
                onTriggered: {
                    console.log("editAction")
                }
            }
        }
        Menu{
            id:home
            title:qsTr("Back")
            MenuItem{
                id:homeAction
                text: qsTr("切换账号")
                icon.source: "qrc:/icon_sys/c.png"
                onTriggered: {
                    show.showWorkPage("qrc:/LoginPage.qml")
                    root.hide()
                }
            }
        }
    }

    header: ToolBar {
        id:toorbar
        spacing: 20
        background: Rectangle{
            color: "lightblue"
            opacity: 1.0
        }
        Flow {
                     anchors.fill: parent

                     ToolButton {
                         id:tb1
                         display: AbstractButton.IconOnly
                         icon.source: "qrc:/icon_sys/a.png"
                         background: Rectangle{
                            anchors.fill: parent
                            opacity: tb1.hovered ? 1.0 : 0.0
                            color:tb1.hovered ? "red" : "darkblue"
                         }
                         onClicked: {
                            console.log("111")
                         }
                     }
                     ToolButton {
                         id:tb2
                         display: AbstractButton.IconOnly
                         icon.source: "qrc:/icon_sys/b.png"
                         background: Rectangle{
                            anchors.fill: parent
                            opacity: tb2.hovered ? 1.0 : 0.0
                            color:tb2.hovered ? "red" : "darkblue"
                         }
                     }

                     ToolButton {
                         id:tb3
                         display: AbstractButton.IconOnly
                         icon.source: "qrc:/icon_sys/c.png"
                         background: Rectangle{
                            anchors.fill: parent
                            opacity: tb3.hovered ? 1.0 : 0.0
                            color:tb3.hovered ? "red" : "darkblue"
                         }
                     }
                 }
    }

    footer: TabBar {
        id: tapbar
        currentIndex:swipeView.currentIndex
        width: parent.width
        TabButton {
            text: qsTr("数据库")
        }
        TabButton {
            text: qsTr("多线程")
        }
        TabButton {
            text: qsTr("网络编程")
        }
    }

    background: Image{
        /*gradient: Gradient {
            GradientStop { position: 0; color: "gray" }
            GradientStop { position: 1; color: "lightblue" }
        }*/
        source: "qrc:/Image/bg9.jpg"
    }

    ParticleSystem
    {
        id:partisystem
    }
    Emitter{
        id:emitter1
        x:0
        y:0
        width: root.width
        height: 60
        system:partisystem
        emitRate:20
        lifeSpan:6000

        lifeSpanVariation:1000
        size:20
        endSize:60
        sizeVariation:10

        velocity: AngleDirection{
            angle: 135
            angleVariation: 15
            magnitude: 100
            magnitudeVariation: 50
        }
        acceleration: AngleDirection{
            angle: 90
            magnitude: 25
        }
    }
    Turbulence{
        id:turb
        anchors.horizontalCenter: parent.horizontalCenter
        width: 240
        height: 120
        strength: 100
    }
    ImageParticle{
        color: 'yellow'
        source: "qrc:/Image/leaf_middle.png"
        opacity: 0.6
        system: partisystem
        colorVariation: 0.2
        rotation: 15
        rotationVariation: 5
        rotationVelocity: 45
        rotationVelocityVariation: 15
        //entryEffect: ImageParticle.scale
        alpha: 1.0
    }

    SwipeView{
        id:swipeView
        width: parent.width
        height: parent.height
        x:0
        currentIndex: tapbar.currentIndex

        MySQLPage{

        }
        MyThreadPage{

        }
        MyNetworkPage{

        }
    }
}
