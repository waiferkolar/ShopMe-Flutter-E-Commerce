import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/Api.dart';
import '../utils/Global.dart';


class Register extends StatelessWidget {
  var _phoneController = TextEditingController();
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _houseNoController = TextEditingController();
  var _streetController = TextEditingController();
  var _cityController = TextEditingController();
  var _stateController = TextEditingController();

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
                  controller: _nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: "Name",
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
              TextFormField(
                  controller: _houseNoController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "House No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
              TextFormField(
                  controller: _streetController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Street",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
              TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "City",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
              TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "State",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ))),
              Row(
                children: [
                  Text("Already Member! Login here"),
                  Spacer(),
                  RaisedButton(
                    onPressed: () async {
                      String userData = json.encode({
                        "phone":_phoneController.text,
                        "name":_nameController.text,
                        "password":_passwordController.text,
                        "houseNo":_houseNoController.text,
                        "street":_streetController.text,
                        "city":_cityController.text,
                        "state":_stateController.text,
                        "marketId":Global.marketId
                      });
                      bool bol = await Api.registerUser(userData);
                      if(bol){
                        print("Aung Tal");
                        Navigator.pop(context);
                      }else{
                        print("Register fail!");
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
