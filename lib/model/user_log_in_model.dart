import 'dart:convert';

UserLogInModel userLogInModelFromJson(String str) =>
    UserLogInModel.fromJson(json.decode(str));

class UserLogInModel {
  UserLogInModel({
    this.message,
    this.status,
    this.user,
    this.userProfile,
    this.userImage
  });

  String? message;
  int? status;
  User? user;
  UserProfile? userProfile;
  UserImage? userImage;


  factory UserLogInModel.fromJson(Map<String, dynamic> json) => UserLogInModel(
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        userProfile: json["userProfile"] == null
            ? null
            : UserProfile.fromJson(json["userProfile"]),
    userImage: json["userImage"] == null ? null : UserImage.fromJson(json["userImage"]),

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
    this.deviceToken,
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
  String? address;
  dynamic deviceToken;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"] == null ? null : json["ID"],
        userTypeId: json["UserTypeID"] == null ? null : json["UserTypeID"],
        email: json["email"] == null ? null : json["email"],
        uniqname: json["uniqname"] == null ? null : json["uniqname"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"] == null ? null : json["password"],
        doubleAuthOnOff: json["doubleAuth_on_off"] == null
            ? null
            : json["doubleAuth_on_off"],
        doubleAuth1: json["doubleAuth_1"] == null ? null : json["doubleAuth_1"],
        doubleAuth2: json["doubleAuth_2"] == null ? null : json["doubleAuth_2"],
        active: json["active"] == null ? null : json["active"],
        apiToken: json["api_token"] == null ? null : json["api_token"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        time: json["Time"] == null ? null : json["Time"],
        createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
        doubleAuthKey:
            json["doubleAuth_key"] == null ? null : json["doubleAuth_key"],
        doubleAuthDateTime: json["doubleAuth_date_time"] == null
            ? null
            : json["doubleAuth_date_time"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        address: json["address"] == null ? null : json["address"],
        deviceToken: json["device_token"],
        token: json["token"] == null ? null : json["token"],
      );
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
        rolesResponse:
            json["roles_response"] == null ? null : json["roles_response"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class UserImage {
  UserImage({
    this.id,
    this.userId,
    this.fileType,
    this.fileName,
    this.fileSize,
    this.path,
    this.date,
    this.time,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  int ?id;
  int? userId;
  String? fileType;
  String? fileName;
  String ?fileSize;
  String? path;
  DateTime ?date;
  String? time;
  int? createdBy;
  dynamic createdAt;
  dynamic updatedAt;

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
    id: json["ID"] == null ? null : json["ID"],
    userId: json["UserID"] == null ? null : json["UserID"],
    fileType: json["FileType"] == null ? null : json["FileType"],
    fileName: json["FileName"] == null ? null : json["FileName"],
    fileSize: json["FileSize"] == null ? null : json["FileSize"],
    path: json["Path"] == null ? null : json["Path"],
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    time: json["Time"] == null ? null : json["Time"],
    createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );


}