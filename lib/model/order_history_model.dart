// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';
List<OrderHistoryModel> orderHistoryModelFromJson(List<dynamic> str) =>
    List<OrderHistoryModel>.from((str).map((x) => OrderHistoryModel.fromJson(x)));
String orderHistoryModelToJson(List<OrderHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistoryModel {
  OrderHistoryModel({
    this.id,
    this.customerName,
    this.customerId,
    this.createdBy,
    this.totalAmount,
    this.discount,
    this.status,
    this.note,
    this.paymentMethod,
    this.stripeToken,
    this.paypalPayment,
    this.paypalToken,
    this.paypalPaye,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? customerName;
  int? customerId;
  int? createdBy;
  int? totalAmount;
  int? discount;
  int? status;
  String? note;
  String? paymentMethod;
  String? stripeToken;
  String? paypalPayment;
  String? paypalToken;
  String? paypalPaye;
  String? createdAt;
  String? updatedAt;

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
    id: json["id"] == null ? null : json["id"],
    customerName: json["customer_name"] == null ? null : json["customer_name"],
    customerId: json["customerId"] == null ? null : json["customerId"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
    discount: json["discount"] == null ? null : json["discount"],
    status: json["status"] == null ? null : json["status"],
    note: json["note"] == null ? null : json["note"],
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    stripeToken: json["stripe_token"] == null ? null : json["stripe_token"],
    paypalPayment: json["paypal_payment"] == null ? null : json["paypal_payment"],
    paypalToken: json["paypal_token"] == null ? null : json["paypal_token"],
    paypalPaye: json["paypal_paye"] == null ? null : json["paypal_paye"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "customer_name": customerName == null ? null : customerName,
    "customerId": customerId == null ? null : customerId,
    "createdBy": createdBy == null ? null : createdBy,
    "totalAmount": totalAmount == null ? null : totalAmount,
    "discount": discount == null ? null : discount,
    "status": status == null ? null : status,
    "note": note == null ? null : note,
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "stripe_token": stripeToken == null ? null : stripeToken,
    "paypal_payment": paypalPayment == null ? null : paypalPayment,
    "paypal_token": paypalToken == null ? null : paypalToken,
    "paypal_paye": paypalPaye == null ? null : paypalPaye,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}
