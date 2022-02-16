// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

UserModel productModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    this.message,
    this.status,
    this.user,
    this.userProfile,
  });

  String? message;
  int? status;
  User? user;
  UserProfile? userProfile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    userProfile: json["userProfile"] == null ? null : UserProfile.fromJson(json["userProfile"]),
  );
}

class User {
  User({
    this.id,
    this.userTypeId,
    this.email,
    this.uniqname,
    this.emailVerifiedAt,
    this.password,
    this.doubleAuthOnOff,
    this.doubleAuth1,
    this.doubleAuth2,
    this.active,
    this.apiToken,
    this.date,
    this.time,
    this.createdBy,
    this.doubleAuthKey,
    this.doubleAuthDateTime,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  int? id;
  int? userTypeId;
  String? email;
  String? uniqname;
  dynamic emailVerifiedAt;
  String? password;
  int? doubleAuthOnOff;
  int? doubleAuth1;
  int? doubleAuth2;
  int? active;
  String? apiToken;
  DateTime? date;
  String? time;
  int? createdBy;
  int? doubleAuthKey;
  int? doubleAuthDateTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic address;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["ID"] == null ? null : json["ID"],
    userTypeId: json["UserTypeID"] == null ? null : json["UserTypeID"],
    email: json["email"] == null ? null : json["email"],
    uniqname: json["uniqname"] == null ? null : json["uniqname"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"] == null ? null : json["password"],
    doubleAuthOnOff: json["doubleAuth_on_off"] == null ? null : json["doubleAuth_on_off"],
    doubleAuth1: json["doubleAuth_1"] == null ? null : json["doubleAuth_1"],
    doubleAuth2: json["doubleAuth_2"] == null ? null : json["doubleAuth_2"],
    active: json["active"] == null ? null : json["active"],
    apiToken: json["api_token"] == null ? null : json["api_token"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    time: json["Time"] == null ? null : json["Time"],
    createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
    doubleAuthKey: json["doubleAuth_key"] == null ? null : json["doubleAuth_key"],
    doubleAuthDateTime: json["doubleAuth_date_time"] == null ? null : json["doubleAuth_date_time"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    address: json["address"],
  );
}

class UserProfile {
  UserProfile({
    this.userId,
    this.firstName,
    this.lastname,
    this.phone,
    this.timeZone,
    this.companyName,
    this.id,
  });

  int? userId;
  String? firstName;
  String? lastname;
  String? phone;
  String? timeZone;
  String? companyName;
  int? id;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    userId: json["UserID"] == null ? null : json["UserID"],
    firstName: json["FirstName"] == null ? null : json["FirstName"],
    lastname: json["Lastname"] == null ? null : json["Lastname"],
    phone: json["Phone"] == null ? null : json["Phone"],
    timeZone: json["TimeZone"] == null ? null : json["TimeZone"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    id: json["ID"] == null ? null : json["ID"],
  );

}
