import 'dart:convert';

import 'package:estore/model/user_log_in_model.dart';
import 'package:estore/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AuthServices {
  static Future<bool> registerUser(
      {firstName, lastName, email, password, phone, address}) async {
    final response = await http.post(Uri.parse(Urls.userRegister),
        body: json.encode({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "Phone": phone,
          "address": address
        }),
        headers: _setHeaderss());
    print(response.body);
    if (response.statusCode == 200) {
      print("user uid ===> user register");
      return true;
    } else {
      print("user register ===> ${response.statusCode}");
      return false;
    }
  }

  static Future<bool> resetPassword({email}) async {
    var url =
        "https://phpstack-508481-2092187.cloudwaysapps.com/api/reset-password?email=$email";
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          "email": email,
        }),
        headers: _setHeaderss());
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      print("reset password status  ===> ${response.statusCode}");
      return false;
    }
  }

  static Future<bool> logInUser({email, password}) async {
    final response = await http.post(Uri.parse(Urls.userLogIn),
        body: json.encode({
          "email": email,
          "password": password,
          "device_token": deviceToken
        }),
        headers: _setHeaderss());
    print(response.body);
    if (response.statusCode == 200) {
      UserLogInModel userModel =
          UserLogInModel.fromJson(json.decode(response.body));
      globalUserData = userModel;
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString("token", userModel.user!.token.toString());
      await getUserProfile(userModel.user!.token.toString());
      return true;
    } else {
      print("User LogIn status  ===> ${response.statusCode}");
      return false;
    }
  }

  static Future<bool> sendNotifications({order_id, status}) async {
    final response = await http.post(Uri.parse(Urls.userLogIn),
        body: json.encode({
          "order_id": order_id,
          "status": status,
        }),
        headers: _setHeaderss());
    print(response.body);
    if (response.statusCode == 200) {
      UserLogInModel userModel =
      UserLogInModel.fromJson(json.decode(response.body));
      globalUserData = userModel;
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString("token", userModel.user!.token.toString());
      await getUserProfile(userModel.user!.token.toString());
      return true;
    } else {
      print("User LogIn status  ===> ${response.statusCode}");
      return false;
    }
  }

  static Future<UserLogInModel> getUserProfile(String userToken) async {
    UserLogInModel userModel = UserLogInModel();
    final response = await http.get(
      Uri.parse(Urls.userProfile),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer $userToken',
      },
    );
    print("user profile api called ${response.body}");
    if (response.statusCode == 200) {
      userModel = UserLogInModel.fromJson(json.decode(response.body));
      globalUserData = userModel;
    } else {
      print("User LogIn status  ===> ${response.statusCode}");
    }
    return userModel;
  }

  static _setHeaderss() => {
        "Accept": "application/json",
        "content-type": "application/json",
        //'Authorization': 'Bearer ${authtoken}',
      };

  static _setHeaders() => {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer $UserToken',
      };
}
