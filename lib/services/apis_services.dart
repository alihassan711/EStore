// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:http/http.dart' as http;
//
// class ApiServices {
//   Future<List<Users>> getUserData() async {
//     List<Users> _slider = [];
//     String uri =
//         'http://ec2-3-141-200-54.us-east-2.compute.amazonaws.com:3006/user';
//     final response = await http.get(Uri.parse(uri));
//     if (response.statusCode == 200) {
//       _slider = usersFromJson(json.decode(response.body)["data"]);
//       return _slider;
//     } else {
//       return [];
//     }
//   }
//
//   Future<List<Product>> getProducts() async {
//     List<Product> _slider = [];
//     final response = await http.get(Uri.parse(Urls.addProduct));
//     if (response.statusCode == 200) {
//       _slider = productFromJson(json.decode(response.body)["data"]);
//       return _slider;
//     } else {
//       return [];
//     }
//   }
//
//   Future<List<CategoryModel>> getCategor() async {
//     List<CategoryModel> _slider = [];
//     String uri =
//         'http://ec2-3-141-200-54.us-east-2.compute.amazonaws.com:3006/category';
//     final response = await http.get(Uri.parse(uri));
//     if (response.statusCode == 200) {
//       _slider = categoryFromJson(json.decode(response.body)["data"]);
//       return _slider;
//     } else {
//       return [];
//     }
//   }
//
//   Future<List<Offer>> getOffer() async {
//     List<Offer> _slider = [];
//     String uri =
//         'http://ec2-3-141-200-54.us-east-2.compute.amazonaws.com:3006/offer';
//     final response = await http.get(Uri.parse(uri));
//     if (response.statusCode == 200) {
//       _slider = offerFromJson(json.decode(response.body)["data"]);
//       return _slider;
//     } else {
//       return [];
//     }
//   }
//
//   Future<bool> adPaymennt(
//       subTotal,discount,grandTotal,productId
//       ) async {
//     String url = "https://api.imho-tech.com/api/PaymentVoucher/AddPaymentVoucher";
//     var body = jsonEncode({
//       "UserId":12,
//       "CusId":14,
//       "SubTotal":subTotal,
//       "Discount":discount,
//       "GrandTotal":grandTotal,
//       "DiscountAmount":"5",
//       "OrderDetailList":[
//         {
//           "ProductId":productId,
//           "Quantity":1,
//           "Price":"100",
//           "TotalAmount":"100",
//           "VAT":"1"
//         }
//       ]
//     });
//
//     //  print(body);
//     final response = await http.post(
//       (Uri.parse(url)),
//       headers: {
//         "Accept": "application/json",
//         "content-type": "application/json",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials":
//         'true', // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//         "Access-Control-Allow-Methods": "POST, OPTIONS"
//       },
//       body: body,
//     );
//     try {
//       if (response.statusCode == 200) {
//         print(response.body);
//         print('Successfully Payment Added');
//         print("sttus code  ========>>>>>>>  ${response.statusCode}");
//         return true;
//       } else {
//         print("Fail To Add Payment");
//         print(response.statusCode);
//         return false;
//       }
//     } catch (e) {
//       throw Exception('Failed to add data');
//     }
//   }
//
//   Future<Album?> fetchAlbum() async {
//     List<Album> _slider = [];
//     String uri =
//         'https://jsonplaceholder.typicode.com/albums/1';
//     final response = await http.get(Uri.parse(uri));
//     if (response.statusCode == 200) {
//       return albumFromJson(response.body);
//     } else {
//       return null;
//     }
//   }
//   Future<bool> updateAlbum(
//       title
//       ) async {
//     String url = "https://jsonplaceholder.typicode.com/albums/1";
//     var body = jsonEncode({
//       'title': title,
//     });
//
//     //  print(body);
//     final response = await http.put(
//       (Uri.parse(url)),
//       headers: {
//         "Accept": "application/json",
//         "content-type": "application/json",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials":
//         'true', // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//         "Access-Control-Allow-Methods": "POST, OPTIONS"
//       },
//       body: body,
//     );
//     try {
//       if (response.statusCode == 200) {
//         print(response.body);
//         print('Successfully Updated');
//         print("sttus code  ========>>>>>>>  ${response.statusCode}");
//         return true;
//       } else {
//         print("Fail To Update");
//         print(response.statusCode);
//         return false;
//       }
//     } catch (e) {
//       throw Exception('Failed to aUpdate');
//     }
//   }
//
//   Future<http.Response> deleteAlbum(String id) async {
//     final http.Response response = await http.delete(
//       Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//
//     return response;
//   }
//   Future<bool> adPayment(
//       title,description,image,price
//       ) async {
//     String url = "https://ecommerceburraq.herokuapp.com/product";
//     var body = jsonEncode({
//       "title": "title",
//       "description": "description",
//       "image": [
//         "image"
//       ],
//       "price": 34
//     });
//
//     //  print(body);
//     final response = await http.post(
//       (Uri.parse(url)),
//       headers: {
//         "Accept": "application/json",
//         "content-type": "application/json",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials":
//         'true', // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//         "Access-Control-Allow-Methods": "POST, OPTIONS"
//       },
//       body: body,
//     );
//     try {
//       if (response.statusCode == 200) {
//         print(response.body);
//         print('Successfully Product Added');
//         print("sttus code  ========>>>>>>>  ${response.statusCode}");
//         return true;
//       } else {
//         print("Fail To Add Product");
//         print(response.statusCode);
//         return false;
//       }
//     } catch (e) {
//       throw Exception('Failed to add data');
//     }
//   }
//
//   Future<dynamic> adProduct(
//       title,description,image,price
//       ) async {
//     var responseJson;
//     var body = jsonEncode({
//       "title": title,
//       "description": description,
//       "image": [
//         image == null? "https://res.cloudinary.com/db1d7fl9p/image/upload/v1640873362/oobdfuanc7tstwlk6xrc.png":
//         image
//       ],
//       "price": price
//     });
//
//     //  print(body);
//     try {
//       final response = await http.post(
//         (Uri.parse(Urls.addProduct)),
//         headers: {
//           "Accept": "application/json",
//           "content-type": "application/json",
//           "Access-Control-Allow-Origin": "*",
//           // Required for CORS support to work
//           "Access-Control-Allow-Credentials":
//           'true',
//           // Required for cookies, authorization headers with HTTPS
//           "Access-Control-Allow-Headers":
//           "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//           "Access-Control-Allow-Methods": "POST, OPTIONS"
//         },
//         body: body,
//       );
//       responseJson = _response(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     print("Product Added");
//     print("responseJson ===========> ${responseJson}");
//     return responseJson;
//   }
//
//   // Future<dynamic> postAPICall(String url, Map param) async {
//   //   print("Calling API: $url");
//   //   print("Calling parameters: $param");
//   //   var responseJson;
//   //   try {
//   //     final response =  await http.post(Uri.parse(url),
//   //         body: param);
//   //     responseJson = _response(response);
//   //   } on SocketException {
//   //     throw FetchDataException('No Internet connection');
//   //   }
//   //   return responseJson;
//   // }
//   dynamic _response(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
//     }
//   }
//
//   Future<http.Response> deleteProduct(String id) async {
//     final http.Response response = await http.delete(
//       Uri.parse('https://ecommerceburraq.herokuapp.com/product/$id'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
// print("deleted");
//     return response;
//   }
//   Future<bool> updateProduct(
//      title,price,description,img,wigetImg, id
//       ) async {
//     String url = "https://ecommerceburraq.herokuapp.com/product/$id";
//     var body = jsonEncode({
//       'title': title,
//       "description": description,
//       "image": [
//         img == null? wigetImg:
//         img
//       ],
//       "price": price
//     });
//
//     //  print(body);
//     final response = await http.put(
//       (Uri.parse(url)),
//       headers: {
//         "Accept": "application/json",
//         "content-type": "application/json",
//         "Access-Control-Allow-Origin": "*", // Required for CORS support to work
//         "Access-Control-Allow-Credentials":
//         'true', // Required for cookies, authorization headers with HTTPS
//         "Access-Control-Allow-Headers":
//         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//         "Access-Control-Allow-Methods": "POST, OPTIONS"
//       },
//       body: body,
//     );
//     try {
//       if (response.statusCode == 200) {
//         print(response.body);
//         print('Successfully Updated');
//         print("sttus code  ========>>>>>>>  ${response.statusCode}");
//         return true;
//       } else {
//         print("Fail To Update");
//         print(response.statusCode);
//         return false;
//       }
//     } catch (e) {
//       throw Exception('Failed to aUpdate');
//     }
//   }
//
//
//   showSnackBar(context, Color color,Color txtColor,String title) {
//     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       backgroundColor: color,
//       content: Text(title,style: TextStyle(color: txtColor),),
//     ));
//   }
// }
import 'dart:convert';

import 'package:estore/constants/color.dart';
import 'package:estore/model/all_categories_model.dart';
import 'package:estore/model/favourite_model.dart';
import 'package:estore/model/order_history_model.dart';
import 'package:estore/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../model/notifications_model.dart';

class ApiServices {
  static var authtoken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjUzNTdhYzM1MTZhNTZhMDI1ZGQ4MDRlYTVkZDg2OTk4ZTgxNjg4MjFhMzFhYjU5YzcwZThlODI5MTQxYjIzODg5NWRjYTY3OTVjY2Q1NTAwIn0.eyJhdWQiOiIzIiwianRpIjoiNTM1N2FjMzUxNmE1NmEwMjVkZDgwNGVhNWRkODY5OThlODE2ODgyMWEzMWFiNTljNzBlOGU4MjkxNDFiMjM4ODk1ZGNhNjc5NWNjZDU1MDAiLCJpYXQiOjE2NDUwMzA0NTQsIm5iZiI6MTY0NTAzMDQ1NCwiZXhwIjoxNjc2NTY2NDU0LCJzdWIiOiIyMyIsInNjb3BlcyI6W119.lw0vONMaPWixPrTj618eGpJdW-92g0ZuURNCnFZcH5daijqVZROY-62qI6M9yBV_l0hSr9NEXqBWmGHITUD4MjbXza1-mEB1enpChPvzI9lOtdUkqr1fpcX4NRDlVrT7TRoLJX3-UcvIXp2CelbygY_8n717uYq-Q6OUhCBRHm-5N5pqKKeUBWLIlsXU72rWBsWucAXy5CqQhF5euj9lN3cZCSmSBo2DCQWg7QruDCKDD13mR6Narrzs7C6FkQwc7bVYxV048IkulIm2J35rEkc1WhHfXcuAcRhyGwZA-hUnZVvvo5WKVVKgfISQhhOfzAqs6xJqj6Zof0ZdWuHciFW6OaOsv27AnxZO24OqU7RxQfJWSvYmDLGWlu8Ya6h0rKNt4uaq-XI8jeN0W2K0t_4iFOx93SpYxKpZcY7rnVLU_uILKJsrTCBKoHsUfuiK-RfXDxLphXzPq8QGHb6GTe_n3dnvZ50Cl02hcqE9Ig9xruc0_G2m1R1H5Yr0ilH1-sDZg1vbaWnJ2Hv9NhCzAwYJTjMeXl1rdMHITbqZeg9SAHB8RueUwseYGcxRaOdynWaKC17a9GKejVhV0BKu2VWmlE1JTRSzfxKNXQdtxzPGrsnzMbRCnPixS6xpuaUsHSzLFudb33lXyupZF6x_e6DKFbTPIt_O3ZfWPEo3qsY";

  //   static Future<List<dynamic>> getAllProducts() async {
// //final uri = Uri.http(authority, '/user/getSingleUser', queryParameters);
//     final response = await http.get(Uri.parse(Urls.allProducts));
//     print(response.body);
//     print("Status Code ====> ${response.statusCode}");
//     globalUserData = Products.fromJson(json.decode(response.body));
//     return Products.fromJson(json.decode(response.body));
//   }

  // Future<Products> getAllProducts() async {
  //   final response = await http
  //       .get(Uri.parse(Urls.allProducts));
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     print("status code ===> ${response.statusCode}");
  //     print("body ===> ${response.body}");
  //     return Products.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
  // static Future<List<CategoryModel>> getShopProducts() async {
  //   List<CategoryModel> allCategories = [];
  //   try {
  //     final response = await http.get(Uri.parse(Urls.allCategories));
  //     if (response.statusCode == 200) {
  //       allCategories = categoryModelFromJson(json.decode((response.body)));
  //     } else {
  //       return [];
  //     }
  //   } on SocketException {
  //     print("No Internet connection");
  //   }
  //   return allCategories;
  // }

  // Future<List<Products>> getAllProducts() async {
  //   List<Products> _slider = [];
  //   final response = await http.get(Uri.parse(Urls.allProducts));
  //   if (response.statusCode == 200) {
  //     print("status code ===> ${response.statusCode}");
  //     print("body ===> ${response.body}");
  //     _slider = json.decode(response.body);
  //     return _slider;
  //   } else {
  //     return [];
  //   }
  // }
  // Future<List<ProductModel>> getAllProducts() async {
  //
  //   List<ProductModel> products = [];
  //   final response = await http.get(Uri.parse(Urls.allProducts));
  //   if (response.statusCode == 200) {
  //     //  print("status code ===> ${response.statusCode}");
  //     // print("product body ===> ${response.body}");
  //     products = productModelFromJson(
  //         json.decode(response.body)["ret_view_array"]["products"]["data"]);
  //     return products;
  //   } else {
  //     return [];
  //   }
  // }

//products
  Future<List<CategoryModel>> getAllCategories() async {
    List<CategoryModel> category = [];
    final response = await http.get(Uri.parse(Urls.allCategories));
    if (response.statusCode == 200) {

      category =
          categoryModelFromJson(json.decode(response.body)["categories"]);
      return category;
    } else {
      return [];
    }
  }

  Future<List<OrderHistoryModel>> getOrderHistory() async {
    List<OrderHistoryModel> category = [];
    final response = await http.get(
      Uri.parse(Urls.orderHistory),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {

      category =
          orderHistoryModelFromJson(json.decode(response.body)["orders"]);
      globalHistoryModel = category;
      return category;
    } else {
      return [];
    }
  }

  Future<List<NotifcationsModel>> getNotifications() async {
    List<NotifcationsModel> category = [];
    final response = await http.get(
      Uri.parse(Urls.notifications),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      category = notificationModelFromJson(
          json.decode(response.body)["notifications"]);
      globalNotificationModel = category;
      return category;
    } else {
      return [];
    }
  }

  Future<List<FavouriteModel>> getFavouriteProducts() async {
    List<FavouriteModel> category = [];
    final response = await http.get(
      Uri.parse(Urls.favourites),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      category =
          favouriteModelFromJson(json.decode(response.body)["favourites"]);
      globalFavouriteModel = category;
      return category;
    } else {
      return [];
    }
  }



  Future<bool> postProduct({List? products, totalPrice}) async {
    var productData = {
      "payment_method": "Cash",
      "note": "how",
      "phone": "0237069975",
      "city": "Lahore",
      "country": "Pakistan",
      "state": "Punjab",
      "address": "caw-b",
      "total_amount": totalPrice,
      "orderItems": products
    };
    var jsonString = json.encode(productData);
    print(jsonString);

    final response = await http.post(Uri.parse(Urls.addOrder),
        body: jsonString, headers: _setHeaders());


    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> addFavouriteProduct({productId}) async {
    final response = await http.post(Uri.parse(Urls.addFavourites),
        body: json.encode({
          "product_id": productId,
        }),
        headers: _setHeaders());
    print(response.body);
    if (response.statusCode == 200) {
      print("Product Added as favourite");
      return true;
    } else {
      print("favourite  ===> ${response.statusCode}");
      return false;
    }
  }

  static Future<bool> removeFavouriteProduct({productId}) async {
    var url =
        "https://phpstack-508481-2092187.cloudwaysapps.com/api/removefavourite?id=$productId";
    final response = await http.get(Uri.parse(url), headers: _setHeaders());
    print(response.body);
    if (response.statusCode == 200) {
      print("Product Added as favourite");
      return true;
    } else {
      print("favourite  ===> ${response.statusCode}");
      return false;
    }
  }
  static _setHeaders() => {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer $UserToken',
      };

  static _setHeaderss() => {
        "Accept": "application/json",
        "content-type": "application/json",
        //'Authorization': 'Bearer ${authtoken}',
      };

  static showSnackBar(context, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
    ));
  }

  successToast(titlemsg) {
    return Fluttertoast.showToast(
        msg: titlemsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 6,
        backgroundColor: kIconColorGreen,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  failToast(titlemsg) {
    return Fluttertoast.showToast(
        msg: titlemsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 6,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
