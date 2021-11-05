import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import login 1.0
import msgA 1.0
import msgB 1.0
import helllo 1.0
import sLogin 1.0
import Qt.labs.platform 1.0
import QtQuick.Particles 2.12
ApplicationWindow{
    id:root
    width: 500
    height: 600
    visible: true
    title: qsTr("Login")

    Rectangle{
        id:sky
        width: root.width
        height: root.height

        gradient: Gradient{
            GradientStop{position: 0.0; color: "#0080FF"}
            GradientStop{position: 1.0; color: "white"}
        }
    }
/*
    Rectangle{
        id:ground
        anchors.top: sky.bottom
        width: root.width
        height: root.height * 0.25

        gradient: Gradient{
            GradientStop{position: 0.0; color: "blue"}
            GradientStop{position: 0.6; color: "darkgray"}
            GradientStop{position: 1.0; color: "gray"}
        }
    }*/

    ParticleSystem
    {
        id:partisystem
    }
    Emitter{
        id:emitter1
        x:parent.width * 0.5
        y:0
        width: 160
        height: 60
        system:partisystem
        emitRate:5
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
        color: '#FFD700'
        source: "qrc:/Image/leaf_middle.png"
        opacity: 0.6
        system: partisystem
        colorVariation: 0.2
        rotation: 15
        rotationVariation: 5
        rotationVelocity: 45
        rotationVelocityVariation: 15
        entryEffect: ImageParticle.scale
    }

    Image{
        id:logo
        width: parent.width * 0.8
        height: width*0.8
        x:parent.width / 2 - width / 2
        y:30
        opacity: 0.6
        source: "qrc:/Image/bg1.jpg"

        SequentialAnimation on opacity{
            loops: Animation.Infinite
            PropertyAnimation { to: 0.4 ;duration: 4000}
            PropertyAnimation { to: 0.8 ;duration: 4000}
        }

/*
        property bool running:false
        Image {
            id: star
            x:width / 2
            y:height / 2
            source: "qrc:/Image/star_s.png"

            NumberAnimation on x{
                to:animbackground.width - 50
                duration: 4000
                running: animbackground.running
            }

            NumberAnimation on y{
                to:animbackground.height - 50
                duration: 4000
                running: animbackground.running
            }

            RotationAnimation on rotation {
                to:3600
                duration: 4000
                running: animbackground.running
            }
        }

        MouseArea{
            anchors.fill: animbackground
            onClicked: animbackground.running = true
        }*/
    }
    ShowLogin{
        window: Login{
        id:lo
        }
    }
    Text{
        id:account
        width: 80
        height: 30
        y:logo.y + logo.height + 30
        x:logo.x + 50

        text: "请输入账号:"
    }
    TextInput{
        id:inputaccount
        width: 150
        height: 30
        y:account.y
        x:logo.x + logo.width - width
    }
    Text{
        id:password
        width: 80
        height: 30
        y:account.y + 50
        x:logo.x + 50

        text: "请输入密码:"
    }
    TextInput{
        id:inputpassword
        width: 150
        height: 30
        y:inputaccount.y + 50
        x:inputaccount.x

    }
    RoundButton{
        id:register
        width: 100
        height: 30
        x:logo.x
        y:password.y + 50

        text: "Register"
        onClicked:{

        }

    }
    RoundButton{
        id:login
        width: 100
        height: 30
        x:logo.x + logo.width - width
        y:inputpassword.y + 50

        text: "Login"
        onClicked:{
            lo.show()
            root.hide()
        }

    }
}
