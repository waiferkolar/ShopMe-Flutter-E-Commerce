class ShopModel{
  bool status;
  String id;
  String name;
  String owner;
  String phone;
  String image;
  String marketId;
  String created;
  String updated;

  ShopModel({this.status,this.id,this.name,this.owner,this.phone,this.image,this.marketId,this.created,this.updated});

  factory ShopModel.fromJson(dynamic data){
    return ShopModel(
      id:data["_id"],
      status:data["status"],
      name:data["name"],
      owner:data["owner"],
      phone:data["phone"],
      image:data["image"],
      marketId:data["marketId"],
      created:data["created"],
      updated:data["updated"],
    );
  }

}