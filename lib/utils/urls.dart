import 'package:estore/model/all_categories_model.dart';
import 'package:estore/model/favourite_model.dart';
import 'package:estore/model/notifications_model.dart';
import 'package:estore/model/order_history_model.dart';
import 'package:estore/model/user_log_in_model.dart';

class Urls {
  static const String baseUrl = "https://phpstack-508481-2092187.cloudwaysapps.com";
  static const String allProducts = "$baseUrl/api/all_products";
  static const String addOrder = "$baseUrl/api/shopcheckout";
  static const String allCategories = "$baseUrl/api/all_categories";
  static const String orderHistory = "$baseUrl/api/userorders";
  static const String singleProducts = "$baseUrl/api/product/hilal-bake-time-marble-cake-box";
  static const String singleCategories = "$baseUrl/api/category/Breakfast Muffins/2";
  static const String userRegister = "$baseUrl/api/customer/register";
  static const String userLogIn = "$baseUrl/api/login";
  static const String favourites = "$baseUrl/api/favourites";
  static const String removeFavourites = "$baseUrl/api/removefavourite";
  static const String addFavourites = "$baseUrl/api/addfavourite";
  static const String notifications = "$baseUrl/api/usernotifications";
  static const String updateProfile = "$baseUrl/api/profile/edit";
// static const String invoice = "$baseUrl/Invoice/INVOICE_BY_CUS_CODE?cus_code=610";
 // static const String oderlist = "$baseUrl/OrderTakerData/ORDER_TAKER_DATA?ORDER_TAKER_ID=2";
}
UserLogInModel globalUserData = UserLogInModel();
List<CategoryModel> globalCategoryModel = [];
List<FavouriteModel> globalFavouriteModel = [];
List<NotifcationsModel> globalNotificationModel = [];
List<OrderHistoryModel> globalHistoryModel = [];