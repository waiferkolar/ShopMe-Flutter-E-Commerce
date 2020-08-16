class ProductModel {
  String id,name,shop,tag,cat,market,created,updated;
  int price;
  int count = 1;
  List<String> images;
  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.shop,
      this.tag,
      this.cat,
      this.market,
      this.created,
      this.updated,
      this.images
      });

  factory ProductModel.fromJson(dynamic data) {
    List<String> imgList = List<String>();

    for(String image in data["images"]){
        imgList.add(image);
    }

    List<Map<String,String>> detailMap = List<Map<String,String>>();
    List lisy = data['detail'] as List;
    List<dynamic> list = lisy.map((e) => e).toList();
 
    for(dynamic dd in list){
        detailMap.add(Map<String,String>.from(dd));
    }

    return ProductModel(
      id: data["_id"],
      name: data["name"],
      price: int.parse(data["price"]),
      shop: data["shop"],
      tag: data["tag"],
      cat: data["cat"],
      market: data["market"],
      created: data["created"],
      updated: data["updated"],
      images: imgList
    );
  }
}
