import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/screens/chat_screen.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/dashboard/profile_screen.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';
import 'cart_screem.dart';
import 'favourite_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        actions: [
          IconBtn(
            icon: const Icon(
              Icons.search,
              color: blackColor,
            ),
            onPress: () {},
            color: blackColor,
          ),
          IconBtn(
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: blackColor,
            ),
            onPress: () {},
            color: blackColor,
          ),
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      drawer: MyDrawer(),
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: pages[pageIndex]),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height*0.14,
      decoration: const BoxDecoration(
       // color: kGrey,
        // color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Container(
                height:pageIndex == 1? 38:28,
                width: pageIndex == 1? 38:28,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(ImagesPath.message),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: Container(
                height:pageIndex ==2? 40:30,
                width: pageIndex ==2? 40:30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(ImagesPath.favourite),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            // IconBtn(
            //   //enableFeedback: false,
            //   onPress: () {
            //     setState(() {
            //       pageIndex = 2;
            //     });
            //   },
            //   icon: pageIndex == 2
            //       ? const Icon(
            //           Icons.favorite,
            //           color: kIconColorRed,
            //           size: 30,
            //         )
            //       : const Icon(
            //           Icons.favorite_border,
            //           color: blackColor,
            //           size: 25,
            //         ),
            // ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Container(
                height:pageIndex == 0? 40:30,
                width: pageIndex == 0? 40:30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(ImagesPath.home),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: Container(
                height:pageIndex ==3? 40:30,
                width: pageIndex ==3? 40:30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(ImagesPath.cart),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 4;
                });
              },
              child: Container(
                height:pageIndex ==4? 40:30,
                width: pageIndex ==4? 40:30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(ImagesPath.profile),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
