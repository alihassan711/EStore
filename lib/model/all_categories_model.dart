List<CategoryModel> categoryModelFromJson(List<dynamic> str) =>
    List<CategoryModel>.from((str).map((x) => CategoryModel.fromJson(x)));


class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.banner,
    this.products,
  });

  int? id;
  String? name;
  String? banner;
  List<Product>? products;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    banner: json["banner"] == null ? null : json["banner"],
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );
}

class Product {
  Product({
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
    this.pivot,
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
  Pivot? pivot;
  List<BreakingPrice>? breakingPrices;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    breakingPrices: json["breaking_prices"] == null ? null : List<BreakingPrice>.from(json["breaking_prices"].map((x) => BreakingPrice.fromJson(x))),
  );

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
}

class Pivot {
  Pivot({
    this.categoryId,
    this.productId,
  });

  int? categoryId;
  int? productId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    categoryId: json["category_id"] == null ? null : json["category_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
  );
}
