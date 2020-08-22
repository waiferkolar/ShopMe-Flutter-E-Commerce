import 'package:flutter/material.dart';

class MessageModel extends StatelessWidget {
  String sender, message, dateTime, direction;

  MessageModel({this.sender, this.message, this.dateTime, this.direction});

  @override
  Widget build(BuildContext context) {
    return direction == "left"
        ? Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Image(
                  image: AssetImage("in.png"),
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 6),
                  width: 180,
                  height: 30,
                  decoration: BoxDecoration(color: Color(0xffd6d6d6)),
                  child: Text(sender),
                )
              ]),
              Container(
                margin: EdgeInsets.only(left: 6),
                width: 180,
                decoration: BoxDecoration(color: Color(0xffd6d6d6)),
                child: Text(message),
              ),
              Container(
                margin: EdgeInsets.only(left: 6),
                width: 180,
                decoration: BoxDecoration(color: Color(0xffd6d6d6)),
                child: Text(dateTime),
              )
            ],
          ))
        : Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(children: [
                Image(
                  alignment: Alignment.centerRight,
                  image: AssetImage("out.png"),
                  width: 30,
                ),
                Container(
                  margin: EdgeInsets.only(right: 6),
                  width: 180,
                  height: 30,
                  decoration: BoxDecoration(color: Color(0xffef5350)),
                  child: Text(sender),
                )
              ]),
              Container(
                margin: EdgeInsets.only(right: 6),
                width: 180,
                decoration: BoxDecoration(color: Color(0xffef5350)),
                child: Text(message),
              ),
              Container(
                margin: EdgeInsets.only(right: 6),
                width: 180,
                decoration: BoxDecoration(color: Color(0xffef5350)),
                child: Text(dateTime),
              )
            ],
          ));
  }
}
