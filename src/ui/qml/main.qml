import QtQuick 2.1
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2


Window {
    id: window1
    visible: true
    width: 500
    height: 480

    EmojiPicker {
        id: emojiPicker

        anchors.fill: parent
        anchors.topMargin: parent.height / 2
        anchors.bottomMargin: 80

        color: "white"
        buttonWidth: 40
        textArea: txtIn     //the TextArea in which EmojiPicker is pasting the Emoji into
    }

    //this TextArea hides EmojiPicker; by altering the height EmojiPicker gets revealed
    TextArea {
        id: txtArea
        anchors.fill: parent
        textFormat: TextEdit.RichText
        state: "EMOJI_HIDDEN"
        states: [
            State {
                name: "EMOJI_HIDDEN"
                PropertyChanges { target: txtArea; anchors.bottomMargin: 80 }
            },
            State {
                name: "EMOJI_SHOWN"
                PropertyChanges { target: txtArea; anchors.bottomMargin: parent.height / 2 }
            }
        ]
    }


    //this TextArea is bound to EmojiPicker
    TextArea {
        id: txtIn
        x: 10
        width: parent.width - 50 - 10
        height: 60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        text: "Enter some text and press return"
        textFormat: TextEdit.RichText

        Keys.onReturnPressed: {
            //add text to "chat" and clear input TextArea
            txtArea.text += txtIn.text

            //this is necessary, because the Emoji use a bigger font-size, than the rest of the input.
            //Without this, the big font-size is still in use, if an Emoji was the last character
            txtIn.text += " "
            txtIn.cursorPosition = txtIn.length

            txtIn.text = ""
        }        
    }


    Button {
        id: btn
        width: 44
        height: 35
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 10
        text: "\uD83D\uDE1C"
        style: ButtonStyle {
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "Helvetica"
                font.pointSize: 20
                color: "gray"
                text: control.text
            }
        }

        onClicked: {
            if (txtArea.state == "EMOJI_HIDDEN") {
                txtArea.state = "EMOJI_SHOWN"
            } else {
                txtArea.state = "EMOJI_HIDDEN"
            }
        }
    }

}
