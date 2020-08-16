import 'package:flutter/material.dart';
import 'package:heynow/pages/Flash.dart';
import 'package:heynow/pages/Home.dart';
import 'package:heynow/pages/Login.dart';
import 'package:heynow/pages/Order.dart';
import 'package:heynow/pages/Product.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context)=> Flash(),
      "/home":(context)=> Home(),
      "/product":(context)=> Product(),
      "/order":(context)=> Order(),
      "/login":(context)=> Login(),
    },
  ));
}
