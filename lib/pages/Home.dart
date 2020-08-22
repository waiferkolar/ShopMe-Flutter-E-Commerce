import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heynow/utils/Global.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Global.categoryList.length);
    print(Global.shopList.length);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: ()=> Navigator.pushNamed(context, "/vp"),
              icon: Icon(Icons.pages),
            ),
            IconButton(
              onPressed: ()=> Navigator.pushNamed(context, "/sl"),
              icon: Icon(Icons.local_dining),
            ),
            IconButton(
              onPressed: ()=> Navigator.pushNamed(context, "/chat"),
              icon: Icon(Icons.chat),
            )
          ],
          ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              _buildCarouselSlider(),
              Padding(
                padding: EdgeInsets.only(left:20),
                child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                "Category",
                style:TextStyle(
                  fontSize: 16
                )
              ),
              ),),
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Global.categoryList.length,
                    itemBuilder: (context, ind) {
                      return _buildItemNow(Global.categoryList[ind],context,"category");
                    }),
              )
            ],
          ),
        )
      ],
    );
  }

  Card _buildItemNow(cat,context,type) {
    return Card(
      child: Column(
          children: [
            Expanded(child: GestureDetector(
              onTap: (){
                Global.currentType = type;
                Global.currentCategory = cat;
                Global.productList.removeRange(0, Global.productList.length);
                Navigator.pushNamed(context, "/product");
              },
              child: Image(image: NetworkImage(cat.image),),)),
            Text(cat.name)
          ]),
    );
  }

  CarouselSlider _buildCarouselSlider() {
    return CarouselSlider(
        items: Global.imgList
            .map((item) => Container(
                  child: Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 2),
          enlargeCenterPage: true,
        ));
  }
}
