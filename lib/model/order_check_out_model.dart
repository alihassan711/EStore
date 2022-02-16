// To parse this JSON data, do
//
//     final checkOutModel = checkOutModelFromJson(jsonString);

import 'dart:convert';

CheckOutModel checkOutModelFromJson(String str) => CheckOutModel.fromJson(json.decode(str));

String checkOutModelToJson(CheckOutModel data) => json.encode(data.toJson());

class CheckOutModel {
  CheckOutModel({
    this.paymentMethod,
    this.note,
    this.phone,
    this.city,
    this.country,
    this.state,
    this.address,
    this.totalAmount,
    this.orderItems,
  });

  String? paymentMethod;
  String? note;
  String? phone;
  String? city;
  String? country;
  String? state;
  String? address;
  String? totalAmount;
  List<OrderItem>? orderItems;

  factory CheckOutModel.fromJson(Map<String, dynamic> json) => CheckOutModel(
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    note: json["note"] == null ? null : json["note"],
    phone: json["phone"] == null ? null : json["phone"],
    city: json["city"] == null ? null : json["city"],
    country: json["country"] == null ? null : json["country"],
    state: json["state"] == null ? null : json["state"],
    address: json["address"] == null ? null : json["address"],
    totalAmount: json["total_amount"] == null ? null : json["total_amount"],
    orderItems: json["orderItems"] == null ? null : List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "note": note == null ? null : note,
    "phone": phone == null ? null : phone,
    "city": city == null ? null : city,
    "country": country == null ? null : country,
    "state": state == null ? null : state,
    "address": address == null ? null : address,
    "total_amount": totalAmount == null ? null : totalAmount,
    "orderItems": orderItems == null ? null : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
  };
}

class OrderItem {
  OrderItem({
    this.productId,
    this.name,
    this.unitPrice,
    this.qty,
  });

  String? productId;
  String? name;
  String? unitPrice;
  String? qty;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    productId: json["product_id"] == null ? null : json["product_id"],
    name: json["name"] == null ? null : json["name"],
    unitPrice: json["unitPrice"] == null ? null : json["unitPrice"],
    qty: json["qty"] == null ? null : json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId == null ? null : productId,
    "name": name == null ? null : name,
    "unitPrice": unitPrice == null ? null : unitPrice,
    "qty": qty == null ? null : qty,
  };
}
