import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/getx_networkmanager_class.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/onboarding/profile_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import '../../widgets/no_internet_widget.dart';
import 'cart_screem.dart';
import 'favourite_screen.dart';

class MainScreen extends StatefulWidget {
  int index ;
   MainScreen({required this.index,Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiServices _repository = ApiServices();
  // pageIndexd(){
  //   if(widget.index != null){
  //     pageIndex == widget.index;
  //   }
  //   else{
  //     setState(() {
  //       pageIndex == 0;
  //     });
  //   }
  // }
  final pages = [
    const HomeScreen(),
     NotificationScreen(),
    const FavouriteScreen(),
    const MyCartScreen(),
     UserProfile(),
  ];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   print("index  ==== > ${widget.index}");
  //   setState(() {
  //     cart.cartItem.length;
  //   });
  //   super.initState();
  // }
  // Platform messages are asynchronous, so we initialize in an async method.
  ApiServices apiServices = ApiServices();

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ApiServices _apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    setState(() {
      cart.cartItem.length;
    });
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
 // final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        toolbarHeight: 60.0,
        // title:
        /*
         TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText:getTranslated(context, 'search').toString(),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: const Color.fromRGBO(93, 25, 72, 1),
                onPressed: () {
                },
              )),
          style: const TextStyle(color: blackColor, fontSize: 15.0),
           onSaved: (value) {
             onSearchTextChanged(value!);
           },
           onChanged: (String value) async {
             onSearchTextChanged(value);
           },

        ),
        */
        actions: [
          IconBtn(
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: blackColor,
            ),
            onPress: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                          create: (BuildContext context) =>
                              CategoryCubit(
                                  repository: _repository),
                          child: MainScreen(
                            index: 3,
                            // form: args.toString(),
                          ))));
            },
            color: blackColor,
          ),
          ShoppingCartWidget(item:cart.cartItem.length.toString(),
            onPress: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                          create: (BuildContext context) =>
                              CategoryCubit(
                                  repository: _apiServices),
                          child: MainScreen(
                            index: 1,
                            // form: args.toString(),
                          ))));
              setState(() {
                widget.index == 3;
                cart.cartItem.length;
              });
            },
          ),
          SizedBox(width: 5.0,),
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      drawer: MyDrawer(),
      body:
      // _networkManager.connectionType == 0 ? const NoInternetWidget()
      //     :
      Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text(getTranslated(context, 'exit_app').toString(),),
            ),
            child: pages[widget.index]),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height*0.14,
      decoration: const BoxDecoration(
        // color: Colors.black87,
        // color: Theme.of(context).primaryColor,
        // borderRadius: BorderRadius.only(
        //topLeft: Radius.circular(20),
        //topRight: Radius.circular(20),
        //  ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
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
                size: 30,
              )
                  : const Icon(
                Icons.notification_important,
                color: kGrey,
                size: 30,
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
                size: 30,
              )
                  : const Icon(
                Icons.favorite_border,
                color: kGrey,
                size: 30,
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
                size: 30,
              )
                  : const Icon(
                Icons.home,
                color: kGrey,
                size: 30,
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
                size: 30,
              )
                  : const Icon(
                Icons.shopping_cart,
                color: kGrey,
                size: 30,
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
                size: 30,
              )
                  : const Icon(
                Icons.person,
                color: kGrey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
/*
  onSearchTextChanged(String text) async {
    if (text.length == 0) {
      userSearch = false;
    } else {
      userSearch = true;
      _userSearchList = await _list
          .where((element) =>
          element.uniqname!.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

   */
}