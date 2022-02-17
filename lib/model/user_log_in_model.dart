// To parse this JSON data, do
//
//     final userLogInModel = userLogInModelFromJson(jsonString);

import 'dart:convert';

UserLogInModel userLogInModelFromJson(String str) => UserLogInModel.fromJson(json.decode(str));

String userLogInModelToJson(UserLogInModel data) => json.encode(data.toJson());

class UserLogInModel {
  UserLogInModel({
    this.message,
    this.status,
    this.user,
    this.userProfile,
  });

  String? message;
  int? status;
  User? user;
  UserProfile? userProfile;

  factory UserLogInModel.fromJson(Map<String, dynamic> json) => UserLogInModel(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    userProfile: json["userProfile"] == null ? null : UserProfile.fromJson(json["userProfile"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "user": user == null ? null : user!.toJson(),
    "userProfile": userProfile == null ? null : userProfile!.toJson(),
  };
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
    this.token,
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
  String? token;

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
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "UserTypeID": userTypeId == null ? null : userTypeId,
    "email": email == null ? null : email,
    "uniqname": uniqname == null ? null : uniqname,
    "email_verified_at": emailVerifiedAt,
    "password": password == null ? null : password,
    "doubleAuth_on_off": doubleAuthOnOff == null ? null : doubleAuthOnOff,
    "doubleAuth_1": doubleAuth1 == null ? null : doubleAuth1,
    "doubleAuth_2": doubleAuth2 == null ? null : doubleAuth2,
    "active": active == null ? null : active,
    "api_token": apiToken == null ? null : apiToken,
    "Date": date == null ? null : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "Time": time == null ? null : time,
    "CreatedBy": createdBy == null ? null : createdBy,
    "doubleAuth_key": doubleAuthKey == null ? null : doubleAuthKey,
    "doubleAuth_date_time": doubleAuthDateTime == null ? null : doubleAuthDateTime,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "address": address,
    "token": token == null ? null : token,
  };
}

class UserProfile {
  UserProfile({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.avatar,
    this.phone,
    this.timeZone,
    this.companyName,
    this.title,
    this.bio,
    this.rolesResponse,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  int? avatar;
  String? phone;
  String? timeZone;
  String? companyName;
  String? title;
  String? bio;
  String? rolesResponse;
  dynamic createdAt;
  dynamic updatedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["ID"] == null ? null : json["ID"],
    userId: json["UserID"] == null ? null : json["UserID"],
    firstName: json["FirstName"] == null ? null : json["FirstName"],
    lastName: json["LastName"] == null ? null : json["LastName"],
    avatar: json["Avatar"] == null ? null : json["Avatar"],
    phone: json["Phone"] == null ? null : json["Phone"],
    timeZone: json["TimeZone"] == null ? null : json["TimeZone"],
    companyName: json["company_name"] == null ? null : json["company_name"],
    title: json["title"] == null ? null : json["title"],
    bio: json["bio"] == null ? null : json["bio"],
    rolesResponse: json["roles_response"] == null ? null : json["roles_response"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "UserID": userId == null ? null : userId,
    "FirstName": firstName == null ? null : firstName,
    "LastName": lastName == null ? null : lastName,
    "Avatar": avatar == null ? null : avatar,
    "Phone": phone == null ? null : phone,
    "TimeZone": timeZone == null ? null : timeZone,
    "company_name": companyName == null ? null : companyName,
    "title": title == null ? null : title,
    "bio": bio == null ? null : bio,
    "roles_response": rolesResponse == null ? null : rolesResponse,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
