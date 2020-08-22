import 'package:flutter/material.dart';
import 'package:heynow/models/MessageModel.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<MessageModel> _messageList = [];
  var _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Group Chat!")),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: _messageList.length,
                  itemBuilder: (context, ind) => _messageList[ind]
                  ),
            ),
            Row(
              children: [
                IconButton(
                    icon: Image(image: AssetImage("send_in.png")),
                    onPressed: () {
                      _receiveMessage(_textController.text);
                    }),
                Flexible(
                  child: TextFormField(
                    controller: _textController,
                  ),
                ),
                IconButton(
                    icon: Image(image: AssetImage("send_out.png")),
                    onPressed: () {
                      String msg = _textController.text;
                      _emitMessage(msg);
                    }),
              ],
            )
          ],
        ));
  }
  _receiveMessage(msg) {
    MessageModel msgModel =
        MessageModel(sender: "Other", message: msg, dateTime: "08-22-2020",direction: "left",);
    setState(() {
      _messageList.add(msgModel);
    });
  }
  _emitMessage(msg) {
    MessageModel msgModel =
        MessageModel(sender: "Me", message: msg, dateTime: "08-22-2020",direction: "right",);
    setState(() {
      _messageList.add(msgModel);
    });
  }
}
