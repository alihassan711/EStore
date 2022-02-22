import 'dart:convert';
import 'package:estore/model/user_log_in_model.dart';
import 'package:estore/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static var authtoken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjUzNTdhYzM1MTZhNTZhMDI1ZGQ4MDRlYTVkZDg2OTk4ZTgxNjg4MjFhMzFhYjU5YzcwZThlODI5MTQxYjIzODg5NWRjYTY3OTVjY2Q1NTAwIn0.eyJhdWQiOiIzIiwianRpIjoiNTM1N2FjMzUxNmE1NmEwMjVkZDgwNGVhNWRkODY5OThlODE2ODgyMWEzMWFiNTljNzBlOGU4MjkxNDFiMjM4ODk1ZGNhNjc5NWNjZDU1MDAiLCJpYXQiOjE2NDUwMzA0NTQsIm5iZiI6MTY0NTAzMDQ1NCwiZXhwIjoxNjc2NTY2NDU0LCJzdWIiOiIyMyIsInNjb3BlcyI6W119.lw0vONMaPWixPrTj618eGpJdW-92g0ZuURNCnFZcH5daijqVZROY-62qI6M9yBV_l0hSr9NEXqBWmGHITUD4MjbXza1-mEB1enpChPvzI9lOtdUkqr1fpcX4NRDlVrT7TRoLJX3-UcvIXp2CelbygY_8n717uYq-Q6OUhCBRHm-5N5pqKKeUBWLIlsXU72rWBsWucAXy5CqQhF5euj9lN3cZCSmSBo2DCQWg7QruDCKDD13mR6Narrzs7C6FkQwc7bVYxV048IkulIm2J35rEkc1WhHfXcuAcRhyGwZA-hUnZVvvo5WKVVKgfISQhhOfzAqs6xJqj6Zof0ZdWuHciFW6OaOsv27AnxZO24OqU7RxQfJWSvYmDLGWlu8Ya6h0rKNt4uaq-XI8jeN0W2K0t_4iFOx93SpYxKpZcY7rnVLU_uILKJsrTCBKoHsUfuiK-RfXDxLphXzPq8QGHb6GTe_n3dnvZ50Cl02hcqE9Ig9xruc0_G2m1R1H5Yr0ilH1-sDZg1vbaWnJ2Hv9NhCzAwYJTjMeXl1rdMHITbqZeg9SAHB8RueUwseYGcxRaOdynWaKC17a9GKejVhV0BKu2VWmlE1JTRSzfxKNXQdtxzPGrsnzMbRCnPixS6xpuaUsHSzLFudb33lXyupZF6x_e6DKFbTPIt_O3ZfWPEo3qsY";
  static Future<bool> registerUser({firstName,lastName,email,password,phone,address}) async {
    final response = await http.post(Uri.parse(Urls.userRegister),
        body: json.encode({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "Phone": phone,
          "address":address
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

  static Future<bool> logInUser({email,password}) async {
    final response = await http.post(Uri.parse(Urls.userLogIn),
        body: json.encode({
          "email": email,
          "password": password,
        }),
        headers: _setHeaderss());
    print(response.body);
    if (response.statusCode == 200) {
      UserLogInModel userModel = UserLogInModel.fromJson(json.decode(response.body));
      globalUserData = userModel;
      SharedPreferences _pref =
      await SharedPreferences.getInstance();
      _pref.setString("email", userModel.user!.email.toString());
      _pref.setString("token", userModel.user!.token.toString());
      _pref.setString("firstName", userModel.userProfile!.firstName.toString());
      _pref.setString("token", userModel.userProfile!.phone.toString());
      _pref.setString("lastName", userModel.userProfile!.lastName.toString());
      _pref.setString("password", password);
      print("User LogIn");
      print("token =====>  ${globalUserData.user!.token}");
      print("token =====>  ${globalUserData.userProfile!.firstName}");
      // print("token =====>  ${globalUserData.user!.token}");
      // print("token =====>  ${globalUserData.user!.token}");
      return true;
    } else {
      print("User LogIn status  ===> ${response.statusCode}");
      return false;
    }
  }
  static _setHeaderss() => {
    "Accept": "application/json",
    "content-type": "application/json",
    //'Authorization': 'Bearer ${authtoken}',
  };

   static _setHeaders() => {
     "Accept": "application/json",
     "content-type": "application/json",
     'Authorization': 'Bearer ${globalUserData.user!.token}',
   };
}