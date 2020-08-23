import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heynow/models/MessageModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../models/MessageModel.dart';
import '../utils/Global.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<MessageModel> _messageList = [];

  IO.Socket socket;
  initializeChatSocket() {
    _messageList.add(MessageModel(
        sender: "Waifer",
        message: "Starting",
        direction: "left",
        dateTime: "08-23-2020"));
    socket = IO.io(Global.SOCKET_ENDPOINT);
    socket.on('connect', (_) {
      print('connected');
    });
    socket.emit("join");
    socket.on("active_users", (data) {
      print(data);
    });
    socket.on('new_message', (data) {
      String id = data['id'];
      String sender = data['sender'];
      String message = data['message'];
      String dirct = Global.user.id == id ? "right" : "left";

      MessageModel msgModel = MessageModel(
          sender: sender,
          message: message,
          direction: dirct,
          dateTime: "08-23-2020");
      _messageList.add(msgModel);
      setState(() {});
    });
  }

  _emitMessage(msg) {
    var sendMsg = new Map();
    sendMsg['id'] = Global.user.id;
    sendMsg['sender'] = "Coca Cola";
    sendMsg['message'] = msg;

    socket.emit('send_message', sendMsg);
  }

  var _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initializeChatSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Group Chat!")),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: _messageList.length,
                  itemBuilder: (context, ind) => _messageList[ind]),
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
                      _textController.text = "";
                    }),
              ],
            )
          ],
        ));
  }

  _receiveMessage(msg) {
    MessageModel msgModel = MessageModel(
      sender: "Other",
      message: msg,
      dateTime: "08-22-2020",
      direction: "left",
    );
    setState(() {
      _messageList.add(msgModel);
    });
  }
}
