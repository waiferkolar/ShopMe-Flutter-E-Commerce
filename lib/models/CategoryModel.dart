class CategoryModel {
  String id;
  String name;
  String image;
  String shopId;
  String marketId;
  String created;
  String updated;

  CategoryModel(this.id, this.name, this.image, this.shopId, this.marketId,
      this.created, this.updated);

  factory CategoryModel.fromJson(dynamic data) {
    return CategoryModel(
      data["_id"],
      data["name"],
      data["image"],
      data["shopId"],
      data["marketId"],
      data["created"],
      data["updated"],
    );
  }
}
