// import 'dart:convert';
//
// //List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));
// List<ProductModel> productModelFromJson(List<dynamic> str) =>
//     List<ProductModel>.from((str).map((x) => ProductModel.fromJson(x)));
// String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ProductModel {
//   ProductModel({
//     this.id,
//     this.name,
//     this.image,
//     this.uniqname,
//     this.description,
//     this.price,
//   });
//
//   int? id;
//   String? name;
//   String? image;
//   String? uniqname;
//   String? description;
//   int? price;
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//     id: json["id"],
//     name: json["name"],
//     image: json["image"],
//     uniqname: json["uniqname"],
//     description: json["description"],
//     price: json["price"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "image": image,
//     "uniqname": uniqname,
//     "description": description,
//     "price": price,
//   };
// }
