// To parse this JSON data, do
//
//     final userLogInModel = userLogInModelFromJson(jsonString);

import 'dart:convert';

//List<FavouriteModel> userLogInModelFromJson(String str) => List<FavouriteModel>.from(json.decode(str).map((x) => FavouriteModel.fromJson(x)));

List<FavouriteModel> favouriteModelFromJson(List<dynamic> str) =>
    List<FavouriteModel>.from((str).map((x) => FavouriteModel.fromJson(x)));
String userLogInModelToJson(List<FavouriteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavouriteModel {
  FavouriteModel({
    this.userId,
    this.productId,
    this.productData,
  });

  int? userId;
  int? productId;
  ProductData? productData;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
    userId: json["user_id"] == null ? null : json["user_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    productData: json["product_data"] == null ? null : ProductData.fromJson(json["product_data"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "product_id": productId == null ? null : productId,
    "product_data": productData == null ? null : productData!.toJson(),
  };
}

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.image,
    this.partnumber,
    this.uniqname,
    this.status,
    this.description,
    this.feature,
    this.price,
    this.manufacturer,
    this.availableF,
    this.barcode,
    this.numberOfU,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.breakingPrices,
  });

  int? id;
  String? name;
  String? image;
  String? partnumber;
  String? uniqname;
  int? status;
  String? description;
  String? feature;
  int? price;
  String? manufacturer;
  String? availableF;
  String? barcode;
  String? numberOfU;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<BreakingPrice>? breakingPrices;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    partnumber: json["partnumber"] == null ? null : json["partnumber"],
    uniqname: json["uniqname"] == null ? null : json["uniqname"],
    status: json["status"] == null ? null : json["status"],
    description: json["description"] == null ? null : json["description"],
    feature: json["feature"] == null ? null : json["feature"],
    price: json["price"] == null ? null : json["price"],
    manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
    availableF: json["available_f"] == null ? null : json["available_f"],
    barcode: json["barcode"] == null ? null : json["barcode"],
    numberOfU: json["number_of_u"] == null ? null : json["number_of_u"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    breakingPrices: json["breaking_prices"] == null ? null : List<BreakingPrice>.from(json["breaking_prices"].map((x) => BreakingPrice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "partnumber": partnumber == null ? null : partnumber,
    "uniqname": uniqname == null ? null : uniqname,
    "status": status == null ? null : status,
    "description": description == null ? null : description,
    "feature": feature == null ? null : feature,
    "price": price == null ? null : price,
    "manufacturer": manufacturer == null ? null : manufacturer,
    "available_f": availableF == null ? null : availableF,
    "barcode": barcode == null ? null : barcode,
    "number_of_u": numberOfU == null ? null : numberOfU,
    "created_by": createdBy == null ? null : createdBy,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "breaking_prices": breakingPrices == null ? null : List<dynamic>.from(breakingPrices!.map((x) => x.toJson())),
  };
}

class BreakingPrice {
  BreakingPrice({
    this.id,
    this.productId,
    this.price,
    this.shopName,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? productId;
  int? price;
  String? shopName;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory BreakingPrice.fromJson(Map<String, dynamic> json) => BreakingPrice(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    price: json["price"] == null ? null : json["price"],
    shopName: json["shop_name"] == null ? null : json["shop_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "price": price == null ? null : price,
    "shop_name": shopName == null ? null : shopName,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
