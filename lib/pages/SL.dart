import 'dart:math';

import 'package:flutter/material.dart';

class SL extends StatefulWidget {
  @override
  _SLState createState() => _SLState();
}

class _SLState extends State<SL> {
  List<int> numList = [1, 2, 3, 4, 5, 6, 7];
  bool isScrolling = false;

  _loadMoreProduct() async {
    setState(() {
      isScrolling = true;
    });
    await Future.delayed(Duration(seconds: 2));
    Random ran = Random();
    int num = ran.nextInt(100);
    setState(() {
      numList.add(num);
      isScrolling = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Scroll Loading")),
        // ignore: missing_required_param
        body: Column(
          children: [
            Expanded(child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isScrolling &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadMoreProduct();
                }
              },
              child: ListView.builder(
                  itemCount: numList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Current index is ${numList[index]}"),
                    );
                  }),
            ),),
            Container(
              child: Center(
                child: isScrolling ?  CircularProgressIndicator(): null,
              ),
            )
          ],
        ));
  }
}
