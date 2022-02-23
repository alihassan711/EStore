// To parse this JSON data, do
//
//     final singleCategoryModel = singleCategoryModelFromJson(jsonString);

import 'dart:convert';

SingleCategoryModel singleCategoryModelFromJson(String str) =>
    SingleCategoryModel.fromJson(json.decode(str));

class SingleCategoryModel {
  SingleCategoryModel({
    this.retViewArray,
  });

  RetViewArray? retViewArray;

  factory SingleCategoryModel.fromJson(Map<String, dynamic> json) =>
      SingleCategoryModel(
        retViewArray: RetViewArray.fromJson(json["ret_view_array"]),
      );
}

class RetViewArray {
  RetViewArray({
    this.priceRange,
    this.searchkey,
    this.orderTitle,
    this.orderDate,
    this.orderPriceAsc,
    this.orderPriceDesc,
    this.products,
    this.totalProducts,
    this.category,
  });

  String? priceRange;
  String? searchkey;
  String? orderTitle;
  String? orderDate;
  String? orderPriceAsc;
  String? orderPriceDesc;
  Products? products;
  int? totalProducts;
  Category? category;

  factory RetViewArray.fromJson(Map<String, dynamic> json) => RetViewArray(
        priceRange: json["priceRange"],
        searchkey: json["searchkey"],
        orderTitle: json["order_title"],
        orderDate: json["order_date"],
        orderPriceAsc: json["order_priceAsc"],
        orderPriceDesc: json["order_priceDesc"],
        products: Products.fromJson(json["products"]),
        totalProducts: json["TotalProducts"],
        category: Category.fromJson(json["category"]),
      );
}

class Category {
  Category({
    this.id,
    this.name,
    this.status,
    this.headerShow,
    this.banner,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? status;
  int? headerShow;
  dynamic banner;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        headerShow: json["header_show"],
        banner: json["banner"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class Products {
  Products({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.uniqname,
    this.description,
    this.price,
  });

  int? id;
  String? name;
  String? image;
  String? uniqname;
  String? description;
  int? price;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        uniqname: json["uniqname"],
        description: json["description"],
        price: json["price"],
      );
}
