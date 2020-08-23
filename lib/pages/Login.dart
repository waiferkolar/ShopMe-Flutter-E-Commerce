import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heynow/utils/Api.dart';

class Login extends StatelessWidget {
  var _phoneController = TextEditingController(text:"09259165884");
  var _passwordController = TextEditingController(text:"@123!aBc&");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Login to Order"),
              TextFormField(
                controller: _phoneController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: "Your Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
              TextFormField(
                controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/register"),
                    child:Text("Not a member yet! Register here")
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: () async {
                      String userData = json.encode(
                        {
                          "phone":_phoneController.text,
                        "password":_passwordController.text
                        });
                      bool bol = await Api.loginUser(userData);
                      if(bol){
                        Navigator.pop(context);
                      }else{
                        print("Login Fail!");
                      }
                    },
                    child: Text("Login"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
