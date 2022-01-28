import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/screens/chat_screen.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/dashboard/profile_screen.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';
import 'cart_screem.dart';

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
    const HomeScreen(),
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
        // color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconBtn(
            //  enableFeedback: false,
            onPress: () {
              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>ChatScreen()));
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.textsms,
                    color: kIconColorGreen,
                    size: 30,
                  )
                : const Icon(
                    Icons.chat_bubble_outline,
                    color: blackColor,
                    size: 25,
                  ),
          ),
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
                    color: blackColor,
                    size: 25,
                  ),
          ),
          IconBtn(
            //  enableFeedback: false,
            onPress: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: kIconColorGreen,
                    size: 30,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: blackColor,
                    size: 25,
                  ),
          ),
          IconBtn(
            // enableFeedback: false,
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
                    Icons.add_shopping_cart,
                    color: blackColor,
                    size: 25,
                  ),
          ),
          IconBtn(
            // enableFeedback: false,
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
                    Icons.person_outline,
                    color: blackColor,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
