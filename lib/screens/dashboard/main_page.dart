import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/onboarding/profile_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../services/auth_services.dart';
import '../../utils/urls.dart';
import 'cart_screen.dart';
import 'favourite_screen.dart';

class MainScreen extends StatefulWidget {
  int index;

  MainScreen({required this.index, Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiServices _repository = ApiServices();

  final pages = [
    const HomeScreen(),
    NotificationScreen(),
    const FavouriteScreen(),
    const MyCartScreen(),
    UserProfile(),
  ];
  ApiServices apiServices = ApiServices();

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ApiServices _apiServices = ApiServices();

  @override
  void initState() {
    getPref();
    super.initState();
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  // final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body:
          // _networkManager.connectionType == 0 ? const NoInternetWidget()
          //     :
          DoubleBackToCloseApp(
              snackBar: SnackBar(
                content: Text(
                  getTranslated(context, 'exit_app').toString(),
                ),
              ),
              child: pages[widget.index]),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      //height: MediaQuery.of(context).size.height*0.14,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconBtn(
            //enableFeedback: false,
            onPress: () {
              setState(() {
                widget.index = 1;
              });
            },
            icon: widget.index == 1
                ? const Icon(
                    Icons.notification_important,
                    color: kIconColorGreen,
                    size: 33,
                  )
                : const Icon(
                    Icons.notification_important,
                    color: kGrey,
                    size: 33,
                  ),
          ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       pageIndex = 2;
          //     });
          //   },
          //   child: Container(
          //     height:pageIndex ==2? 40:30,
          //     width: pageIndex ==2? 40:30,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: ExactAssetImage(ImagesPath.favourite),
          //           fit: BoxFit.fill),
          //     ),
          //   ),
          // ),
          IconBtn(
            //enableFeedback: false,
            onPress: () {
              setState(() {
                widget.index = 2;
              });
            },
            icon: widget.index == 2
                ? const Icon(
                    Icons.favorite,
                    color: kIconColorRed,
                    size: 33,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: kGrey,
                    size: 33,
                  ),
          ),
          IconBtn(
            //enableFeedback: false,
            onPress: () {
              setState(() {
                widget.index = 0;
              });
            },
            icon: widget.index == 0
                ? const Icon(
                    Icons.home,
                    color: kIconColorRed,
                    size: 33,
                  )
                : const Icon(
                    Icons.home,
                    color: kGrey,
                    size: 33,
                  ),
          ),
          IconBtn(
            //enableFeedback: false,
            onPress: () {
              setState(() {
                widget.index = 3;
              });
            },
            icon: widget.index == 3
                ? const Icon(
                    Icons.shopping_cart,
                    color: blackColor,
                    size: 33,
                  )
                : const Icon(
                    Icons.shopping_cart,
                    color: kGrey,
                    size: 33,
                  ),
          ),
          IconBtn(
            //enableFeedback: false,
            onPress: () {
              setState(() {
                widget.index = 4;
              });
            },
            icon: widget.index == 4
                ? const Icon(
                    Icons.person,
                    color: kIconColorBlue,
                    size: 33,
                  )
                : const Icon(
                    Icons.person,
                    color: kGrey,
                    size: 33,
                  ),
          ),
        ],
      ),
    );
  }
  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserToken = prefs.getString('token') ?? "";
    print("user token is: $UserToken");
    if (UserToken.isNotEmpty || UserToken != "") {
      AuthServices.getUserProfile(UserToken);
    }

    setState(() {

    });
  }
}
