
import 'dart:convert';

//List<NotifcationsModel> notifcationsModelFromJson(String str) => List<NotifcationsModel>.from(json.decode(str).map((x) => NotifcationsModel.fromJson(x)));
List<NotifcationsModel> notificationModelFromJson(List<dynamic> str) =>
    List<NotifcationsModel>.from((str).map((x) => NotifcationsModel.fromJson(x)));
String productCategoryModelToJson(List<NotifcationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotifcationsModel {
  NotifcationsModel({
    this.id,
    this.userId,
    this.orderId,
    this.message,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? orderId;
  String? message;
  int? seen;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory NotifcationsModel.fromJson(Map<String, dynamic> json) => NotifcationsModel(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    orderId: json["order_id"] == null ? null : json["order_id"],
    message: json["message"] == null ? null : json["message"],
    seen: json["seen"] == null ? null : json["seen"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "order_id": orderId == null ? null : orderId,
    "message": message == null ? null : message,
    "seen": seen == null ? null : seen,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}