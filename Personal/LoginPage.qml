import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Particles 2.12
import checkLogin 1.0
import showpage 1.0
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
            GradientStop{position: 0.0; color: "darkblue"}
            GradientStop{position: 1.0; color: "gray"}
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
        width: parent.width * 0.7
        height: width
        x:parent.width / 2 - width / 2
        y:30
        opacity: 1.0
        source: "qrc:/Image/bg7.jpg"

        SequentialAnimation on opacity{
            loops: Animation.Infinite
            PropertyAnimation { to: 0.0 ;duration: 2500}
            PropertyAnimation { to: 1.0 ;duration: 2500}
        }

        Image {
            id: run
            x:0
            y:logo.height - width
            source: "qrc:/Image/QE.png"

            SequentialAnimation on x{
                loops: Animation.Infinite
                NumberAnimation { to: logo.width - run.width ;duration: 2500}
                NumberAnimation { to: 0 ; duration: 2500}
            }
        }
    }
    Label{
        id:account
        width: 80
        height: 50
        y:logo.y + logo.height + 30
        x:logo.x + 50
        Text {
            anchors.centerIn: account
            text: qsTr("请输入账号 :")
            font.pointSize: 10
        }
    }
    TextField{
        id:inputaccount
        width: 150
        height: 50
        y:account.y
        x:account.x + account.width + 30
        cursorVisible: true
    }
    Label{
        id:password
        width: 80
        height: 50
        y:account.y + 70
        x:logo.x + 50
        Text {
            anchors.centerIn: password
            text: qsTr("请输入密码 :")
            font.pointSize: 10
        }
    }
    TextField{
        id:inputpassword
        width: 150
        height: 50
        y:inputaccount.y + 70
        x:inputaccount.x
        cursorVisible: true
    }
    RoundButton{
        id:register
        width: 100
        height: 40
        x:logo.x
        y:password.y + 50
        radius: 5
        text: "注册"
        onClicked:{
            register_dialog.open()
        }

    }
    RoundButton{
        id:login
        width: 100
        height: 40
        x:logo.x + logo.width - width
        y:inputpassword.y + 50
        radius: 5
        text: "登陆"
        onClicked:{
            check_login.checkText(inputaccount.text,inputpassword.text)
        }

    }

    ShowPage{
        id:sp
    }

    CheckLogin{
        id:check_login

        onCheckOk: {
            sp.showWorkPage(":/MyItem.qml")
            //root.hide()
            console.log("SUCCESS!")
        }
        onCheckNo: {
            login_dialog.open()
            console.log("WRONG!")
        }
    }

    Dialog{
        id:login_dialog
        width: root.width * 0.5
        height: root.height * 0.5
        x:root.width * 0.2
        y:root.height * 0.2
        title:qsTr("<h2><b>Info</b></h2>")
        standardButtons: Dialog.Ok | Dialog.Cancel
        modal:false

        background: Rectangle
        {
            color:"gray"
        }

        Text {
            id: inf
            anchors.fill: parent
            //warpMode:Text.Wrap
            text: qsTr(
                      "Your account or password is wrong!
First:   Check your account.
Second:  Check your password.
Third:   Try again!
")
        }
    }

    Dialog{
        id:register_dialog
        width: root.width * 0.5
        height: root.height * 0.5
        x:root.width * 0.2
        y:root.height * 0.2
        title:qsTr("<h2><b>注册</b></h2>")
        standardButtons: Dialog.Ok | Dialog.Cancel
        modal:false
        leftMargin:5
        rightMargin:5
        background: Rectangle{
            color:"gray"
        }
        TextField{
            id:input_acc
            width: register_dialog.width - 50
            height: 50
            x:0
            y:register_dialog.height * 0.05
            color: "green"

        }
        TextField{
            id:input_pwd
            width: register_dialog.width - 50
            height: 50
            x:0
            y:input_acc.y + 70
            color: "green"

        }

        onAccepted: {
            check_login.writeIni(input_acc.text,input_pwd.text)
        }
        onRejected: {
            console.log("you canceled!")
        }
    }
}
