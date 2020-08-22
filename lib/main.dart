import 'package:flutter/material.dart';
import 'package:heynow/pages/Flash.dart';
import 'package:heynow/pages/Home.dart';
import 'package:heynow/pages/Login.dart';
import 'package:heynow/pages/Order.dart';
import 'package:heynow/pages/Product.dart';
import 'package:heynow/pages/Register.dart';
import 'package:heynow/pages/SL.dart';
import 'package:heynow/pages/Vp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context)=> Flash(),
      "/home":(context)=> Home(),
      "/product":(context)=> Product(),
      "/order":(context)=> Order(),
      "/login":(context)=> Login(),
      "/register":(context)=> Register(),
      "/vp":(context)=> Vp(),
      "/sl":(context)=> SL(),
    },
  ));
}
