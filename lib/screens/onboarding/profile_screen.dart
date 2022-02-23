import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/orderhistory/order_history_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/drawer/history_screen.dart';
import 'package:estore/screens/onboarding/edit_profile.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/utils/urls.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/screens/components/my_drawer.dart';
import '../../bloc/category/category_cubit.dart';
import '../../provider/cart.dart';
import '../../widgets/cart_item_count.dart';
import '../../widgets/iconbtn.dart';
import '../dashboard/main_page.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ApiServices _repository = ApiServices();
  ApiServices _apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:
      AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        toolbarHeight: 60.0,
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
                              CategoryCubit(repository: _repository),
                          child: MainScreen(
                            index: 3,
                            // form: args.toString(),
                          ))));
            },
            color: blackColor,
          ),
          ShoppingCartWidget(
            onPress: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                          create: (BuildContext context) =>
                              CategoryCubit(repository: _apiServices),
                          child: MainScreen(
                            index: 1,
                            // form: args.toString(),
                          ))));
            },
          ),
          SizedBox(
            width: 5.0,
          ),
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //globalUserData.userProfile== null ||
            //     globalUserData.userProfile!.avatar.toString() == null?
            // CircleAvatar(
            //   radius: 50,
            //   backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
            // ):
            CircleAvatar(
              radius: 50,
              backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
            ),
            const SizedBox(
              height: 14,
            ),
            AutoSizeText(
              globalUserData.userProfile == null
                  ? "name"
                  : globalUserData.userProfile!.firstName.toString(),
              style: kBold(blackColor, 12.0),
            ),
            const SizedBox(
              height: 8,
            ),
            AutoSizeText(globalUserData.user == null
                ? "email"
                : globalUserData.user!.email.toString()),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: kGrey),
                  ),
                  child: ElevatedBtn(
                    onPress: () {
                      print(
                          "image data ===> ${globalUserData.userProfile!.avatar.toString()}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile(
                                  user: globalUserData,
                                  callback: () {
                                    setState(() {});
                                  })));
                    },
                    text: getTranslated(context, "edit_profile").toString(),
                    color: whiteColor,
                    btnTxtSize: 12,
                    circularSize: 10.0,
                    txtColor: blackColor,
                    btnWidth: 150,
                    btnHeight: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BlocProvider(
                                create: (BuildContext context) =>
                                    CategoryCubit(repository: _repository),
                                child: MainScreen(
                                  index: 2,
                                  // form: args.toString(),
                                ))));
                  },
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: kGrey),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: kGrey,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cardWidget(
                    Provider.of<Cart>(context, listen: false)
                        .basketItems
                        .length
                        .toString(),
                    "in_your_cart"),
                cardWidget(
                    globalFavouriteModel.length.toString(), "in_your_wish_list"),
                cardWidget(globalHistoryModel.length.toString(), "ordered"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(),

            SizedBox(
              height: 10,
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) =>
                                OrderHistoryCubit(repository: _repository),
                            child: const PurchaseHistory())));
              },
              title: AutoSizeText(
                getTranslated(context, "order").toString(),
                style: kBold(blackColor, 12.0),
              ),
              leading: const CircleAvatar(
                radius: 17,
                backgroundColor: kIconColorYellow,
                child: Icon(
                  Icons.list,
                  color: whiteColor,
                  size: 20,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) =>
                                CategoryCubit(repository: _repository),
                            child: MainScreen(
                              index: 1,
                              // form: args.toString(),
                            ))));
              },
              title: AutoSizeText(
                getTranslated(context, "notification").toString(),
                style: kBold(blackColor, 12.0),
              ),
              leading: const CircleAvatar(
                radius: 17,
                backgroundColor: kIconColorYellow,
                child: Icon(
                  Icons.notification_important,
                  color: whiteColor,
                  size: 20,
                ),
              ),
            ),
            ListTile(
              title: AutoSizeText(
                getTranslated(context, "purchase_history").toString(),
                style: kBold(blackColor, 12.0),
              ),
              leading: const CircleAvatar(
                radius: 17,
                backgroundColor: kIconColorGreen,
                child: Icon(
                  Icons.ballot,
                  color: whiteColor,
                  size: 20,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) =>
                                OrderHistoryCubit(repository: _repository),
                            child: const PurchaseHistory())));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(String value, String title) {
    return Card(
      child: SizedBox(

        width: MediaQuery.of(context).size.width * 0.25,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              AutoSizeText(
                value,
                style: kBold(blackColor, 14.0),
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                getTranslated(context, title).toString(),
                style: kNormalBlack(blackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
