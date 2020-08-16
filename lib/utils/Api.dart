import 'dart:convert';

import 'package:heynow/models/CategoryModel.dart';
import 'package:heynow/models/ProductModel.dart';
import 'package:heynow/models/ShopModel.dart';
import 'package:heynow/models/UserModel.dart';
import 'package:heynow/utils/Global.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<bool> getAllCategory() async {
    var url = "${Global.BASE_URL}/api/category/all";
    var encodedJson = json.encode({"market": Global.marketId});
    var response =
        await http.post(url, body: encodedJson, headers: Global.headers);
    List lisy = jsonDecode(response.body)["categories"] as List;
    List<CategoryModel> catList =
        lisy.map((e) => CategoryModel.fromJson(e)).toList();
    Global.categoryList = catList;
    return Global.categoryList.length > 0;
  }

  static Future<bool> getAllShop() async {
    var url = "${Global.BASE_URL}/api/shop/all";
    var jsonEcodeData = json.encode({"market": Global.marketId});
    var response =
        await http.post(url, headers: Global.headers, body: jsonEcodeData);

    List lisy = jsonDecode(response.body)["shops"] as List;
    Global.shopList = lisy.map((e) => ShopModel.fromJson(e)).toList();
    return Global.shopList.length > 0;
  }

  static Future<List<ProductModel>> loadProduct() {
    if (Global.currentType == "category") {
      return getCategoryProduct();
    } else {
      return getShopProduct();
    }
  }

  static Future<List<ProductModel>> getCategoryProduct() async {
    var url = "${Global.BASE_URL}/api/product/by/category";
    var jsonEcodeData = json.encode({
      "market": Global.marketId,
      "catId": Global.currentCategory.id,
      "skip": Global.productList.length
    });
    var response =
        await http.post(url, headers: Global.headers, body: jsonEcodeData);

    List lisy = jsonDecode(response.body)["products"] as List;
    List<ProductModel> ls = lisy.map((e) => ProductModel.fromJson(e)).toList();
    Global.productList.addAll(ls);
    return Global.productList;
  }

  static Future<List<ProductModel>> getShopProduct() async {
    var url = "${Global.BASE_URL}/api/product/by/category";
    var jsonEcodeData = json.encode({
      "market": Global.marketId,
      "catId": Global.currentCategory.id,
      "skip": Global.productList.length
    });
    var response =
        await http.post(url, headers: Global.headers, body: jsonEcodeData);

    List lisy = jsonDecode(response.body)["products"] as List;
    List<ProductModel> ls = lisy.map((e) => ProductModel.fromJson(e)).toList();
    Global.productList.addAll(ls);
    return Global.productList;
  }

  static Future<bool> uploadOrder() {
    print("Order Update");
    return null;
  }

  static Future<bool> loginUser(String userData) async {
    var url = "${Global.BASE_URL}/api/login";
    var response =
        await http.post(url, body: userData, headers: Global.headers);
    dynamic data = jsonDecode(response.body);
    if (data["con"]) {
      Global.user = UserModel.fromJson(data["user"]);
      print(Global.user.name);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> registerUser(String userData) async {
    var url = "${Global.BASE_URL}/api/register";
    var response =
        await http.post(url, body: userData, headers: Global.headers);
    dynamic data = jsonDecode(response.body);
    return data['con'];
  }
}
