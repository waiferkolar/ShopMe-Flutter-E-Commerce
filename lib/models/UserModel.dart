class UserModel{
  String token,id,phone,name,houseNo,street,city,state,marketId,created,updated;
  bool status;

  UserModel({this.token,this.id,this.phone,this.name,this.houseNo,this.street,
  this.city,this.state,this.marketId,this.created,this.updated});

  factory UserModel.fromJson(dynamic data){
    return UserModel(
        token : data["token"],
        id : data["_id"],
        phone : data["phone"],
        name : data["name"],
        houseNo : data["houseNo"],
        street : data["street"],
        city : data["city"],
        state : data["state"],
        marketId : data["marketId"],
        created : data["created"],
        updated : data["updated"]
    );
  }
}