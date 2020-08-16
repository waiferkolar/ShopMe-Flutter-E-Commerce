import 'package:heynow/models/CategoryModel.dart';
import 'package:heynow/models/ProductModel.dart';
import 'package:heynow/models/ShopModel.dart';
import 'package:heynow/models/UserModel.dart';

class Global {
  static const String BASE_URL = "http://54.179.1.90:3000";
  static const String marketId = "5f0949f6c5afbd05fe52d031";
  static List<CategoryModel> categoryList = List<CategoryModel>();
  static List<ShopModel> shopList = List<ShopModel>();
  static List<ProductModel> productList = List<ProductModel>();
  static List<ProductModel> orderList = List<ProductModel>();
  static String currentType = "";
  static CategoryModel currentCategory;
  static UserModel user;
  static final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  static Map<String, String> headers = {"content-type": "application/json"};

  static addToCart(ProductModel product) {
    var existingItem = orderList
        .firstWhere((element) => element.id == product.id, orElse: () => null);

    if (existingItem == null) {
      orderList.add(product);
    }
    return orderList.length;
  }

  static addCountToCart(ProductModel product) {
    for (ProductModel pModel in orderList) {
      if (pModel == product) {
        pModel.count++;
      }
    }
  }
  static hehe(){
    
  }
  static removeCountToCart(ProductModel product) {
    for (ProductModel pModel in orderList) {
      if (pModel == product) {
        if (pModel.count <= 1) {
          orderList.remove(pModel);
        } else {
          pModel.count--;
        }
      }
    }
  }
}
