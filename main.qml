import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Song player")
    MediaPlayer {
        id: playMusic
        source: "qrc:/data/songs/song_3.mp3"
        onStopped: {
            console.log("completed playback")
            pauseORplay.isPlaying = false
            playMusic.seek(0)
        }
    }
    Rectangle {
        id: topBar
        color: "black"
        height: 20
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
    Rectangle {
        id: mainAudio
        color: "#333333"
        anchors {
            top: topBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 100
        }
        MainAudioBox{
            id: mainAudioBox
            color: parent.color
            anchors.fill: parent
            songtitle:  "Hanuman Chalisa" //playMusic.metaData.title
            authorinfo: "By SaiCharan in the year 2024"//"By" + playMusic.metaData.author + " in the year " + playMusic.metaData.year
            songImageSource: "qrc:/data/images/song_3.jpg"
        }
    }
    Slider{
        id: slider
        anchors {
            top: mainAudio.bottom
            left: parent.left
            right: parent.right
            topMargin: 5
        }
        height: 30
        from: 0
        to : playMusic.duration
        value: playMusic.position

        onMoved: {
            playMusic.seek(slider.position * playMusic.duration)
        }
        onValueChanged: {
            console.log("changed")
        }
    }

    Rectangle {
        id: bottomBar
        color: "black"
        height: 60
        anchors {
            top: slider.bottom
            left: parent.left
            right: parent.right
        }
        Row{
            anchors.centerIn: parent
            spacing: 20

            PlayButton{
                id: previous
                buttonTextColor: "white"
                buttonText: "\u23EE"
                textFont: 40
                width: 50
                height: 40
                radius:5
            }

            PlayButton{
                id: pauseORplay
                property bool isPlaying: false // play button
                buttonTextColor: "white"
                buttonColor: "blue"
                buttonText: isPlaying? "\u23F8": "\u25B6"
                textFont: 40
                width: 50
                height: 40
                radius: 5
                onClicked:{
                    if(isPlaying) {
                        playMusic.pause()
                        // playMusic.source = "qrc:/data/songs/song_3.mp3"
                    }else{
                        playMusic.play()
                    }
                    isPlaying = !isPlaying
                  }
            }

            PlayButton{
                id: next
                buttonTextColor: "white"
                buttonText: "\u23ED"
                textFont: 40
                width: 50
                height: 40
                radius: 5
            }
        }

    }


}
