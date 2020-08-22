import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:heynow/models/ProductModel.dart';
import 'package:heynow/utils/Api.dart';
import 'package:heynow/utils/Global.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int orderCount = 0;
  List<ProductModel> productList = List<ProductModel>();
  bool isLoading = false;

  initialLoadData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      List<ProductModel> lm = await Api.loadProduct();
      setState(() {
        productList = lm;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initialLoadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products",
          ),
          actions: [
            Badge(
              position: BadgePosition.topRight(top: 0, right: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                orderCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, "/order")),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              // ignore: missing_required_param
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!isLoading &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    initialLoadData();
                  }
                },
                child: GridView.builder(
                  itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3),
                  itemBuilder: (context, ind) {
                    var cat = productList[ind];
                    return Card(
                      child: Column(
                        children: [
                          Text(cat.name),
                          Expanded(
                            child: Image(
                              image: NetworkImage(
                                cat.images[0],
                              ),
                              height: 100,
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              int count = Global.addToCart(cat);
                              setState(() {
                                orderCount = count;
                                print(orderCount);
                              });
                            },
                            child: Text("add to cart"),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
                child: Center(
              child: isLoading ? CircularProgressIndicator() : null,
            ))
          ],
        ));
  }
}
