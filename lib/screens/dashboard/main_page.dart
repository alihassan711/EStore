import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/chat_screen.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/dashboard/profile_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_screem.dart';
import 'favourite_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiServices _repository = ApiServices();
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const ChatScreen(),
    const FavouriteScreen(),
    const MyCartScreen(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // IconBtn(
          //   icon: const Icon(
          //     Icons.search,
          //     color: blackColor,
          //   ),
          //   onPress: () {},
          //   color: blackColor,
          // ),
          IconBtn(
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: blackColor,
            ),
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (ctx) => const NotificationScreen()));
            },
            color: blackColor,
          ),
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      drawer: MyDrawer(),
      body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text(getTranslated(context, 'exit_app').toString(),),
          ),
          child: pages[pageIndex]),
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
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.message,
                color: kIconColorGreen,
                size: 30,
              )
                  : const Icon(
                Icons.message,
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
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
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
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
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
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
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
                  pageIndex = 4;
                });
              },
              icon: pageIndex == 4
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