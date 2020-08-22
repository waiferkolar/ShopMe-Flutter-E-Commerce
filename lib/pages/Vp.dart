import 'package:flutter/material.dart';
import 'package:heynow/subpages/One.dart';
import 'package:heynow/subpages/Three.dart';
import 'package:heynow/subpages/Two.dart';

class Vp extends StatefulWidget {
  @override
  _VpState createState() => _VpState();
}

class _VpState extends State<Vp> {
  int currentPage = 0;
  PageController _pc = PageController();
  var _pages = [One(), Two(), Three()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pages View")),
      body: PageView(
        controller: _pc,
        onPageChanged: (ind) {
          setState(() {
            currentPage = ind;
            // _pc.animateToPage(ind,
            //     duration: Duration(seconds: 1), curve: Curves.linear);
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (ind) {
          setState(() {
            currentPage = ind;
            _pc.jumpToPage(ind);
            // _pc.animateToPage(ind,
            //     duration: Duration(seconds: 1), curve: Curves.linear);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('One')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Two')),
          BottomNavigationBarItem(icon: Icon(Icons.pages), title: Text('Three'))
        ],
      ),
    );
  }
}
