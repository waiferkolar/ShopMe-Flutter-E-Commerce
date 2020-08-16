import 'package:flutter/material.dart';
import 'package:heynow/utils/Api.dart';
import 'package:heynow/utils/Global.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int cartCount = Global.orderList.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
        actions: [
          IconButton(
              icon: Icon(Icons.payment),
              onPressed: () {
                if (Global.user == null)
                  Navigator.pushNamed(context, "/login");
                else
                  Api.uploadOrder();
              }),
          SizedBox(width: 10)
        ],
      ),
      body: ListView.builder(
          itemCount: Global.orderList.length,
          itemBuilder: (context, ind) {
            var cat = Global.orderList[ind];
            return Table(
              border: TableBorder.all(
                  color: Colors.black26, width: 1, style: BorderStyle.solid),
              children: [
                TableRow(children: [
                  Text(cat.name),
                  Image(
                    image: NetworkImage(cat.images[0]),
                    height: 100,
                  ),
                  Row(
                    children: [
                      IconButton(
                          color: Colors.redAccent,
                          icon: Icon(
                            Icons.remove,
                            size: 16,
                          ),
                          onPressed: () {
                            Global.removeCountToCart(cat);
                            setState(() {
                              cartCount = Global.orderList.length;
                            });
                          }),
                      Text("${cat.count}"),
                      IconButton(
                          color: Colors.green,
                          icon: Icon(
                            Icons.add,
                            size: 16,
                          ),
                          onPressed: () {
                            Global.addCountToCart(cat);
                            setState(() {
                              cartCount = Global.orderList.length;
                            });
                          })
                    ],
                  )
                ])
              ],
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index)async {
          if (Global.orderList.length > 0) {
           bool bol =  await Api.uploadOrder();
           if(bol) Navigator.pop(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            title:Text("Order"),
            icon: Icon(Icons.shop)),
             BottomNavigationBarItem(
            title:Text("Order"),
            icon: Icon(Icons.shop)),
        ],
      ),
    );
  }
}
