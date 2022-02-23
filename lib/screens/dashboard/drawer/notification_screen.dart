/*
import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/utils/no_notification.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:estore/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool? isNotifications;
  @override
  initState() {
    super.initState();
   isNotifications = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
              getTranslated(context, "notification").toString(),
            style: kBold(kIconColorRed, 20.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconBtn(
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: blackColor,
              ),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const NotificationScreen()));
              },
              color: blackColor,
            ),
          ],
          iconTheme: const IconThemeData(color: blackColor),
        ),
      //  drawer: MyDrawer(),
        body: isNotifications == false
            ? Center(
                child: NoNotificationContainer(
                onPress: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>  MainScreen(index: 0,)));
                },
                icon: ImagesPath.notification,
                btnText: "Go To HomeScreen",
                txt: "Don't have any notifications in the list",
              ))
            : Column(
                children: [
                  // ListTile(
                  //   leading: const Icon(
                  //     Icons.notifications_active_outlined,
                  //     color: blackColor,
                  //   ),
                  //   title: AutoSizeText(
                  //     "Notifications",
                  //     style: kBold(blackColor, 16.0),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 12,
                      itemBuilder: (BuildContext context, index) {
                        return NotificationCard(
                          fromChatPage: true,
                        );
                      },
                    ),
                  )
                ],
              ));
  }
}
*/
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/model/favourite_model.dart';
import 'package:estore/model/notifications_model.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/urls.dart';
import 'package:estore/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/no_notification.dart';
import '../../../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategories();
    return Scaffold(backgroundColor: whiteColor,
      body: globalNotificationModel.length == 0
          ? Center(
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                flex: 2,
                child: NoNotificationContainer(
                  onPress: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BlocProvider(
                                create: (BuildContext context) =>
                                    CategoryCubit(
                                        repository: _apiServices),
                                child: MainScreen(
                                  index: 0,
                                  // form: args.toString(),
                                ))));
                  },
                  icon: ImagesPath.notification,
                  btnText: "Go To HomeScreen",
                  txt: "Don't have any notifications in the list",
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ))
          : BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadingState) {
            return const Center(
              child: Text("Loading..."),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (state is LoadedState) {
            final List<NotifcationsModel> users = state.notifications;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {
                  String date =  users[index].createdAt.toString();
                  final dateList = date.split(" ");
                  final createddate = dateList[0];
                  print("split " + dateList[0]);
                  return Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 10.0, left: 10.0),
                      child: NotificationCard(fromChatPage: true,created_date:
                      createddate.toString(),
                        orderId:  users[index].orderId.toString(),)
                  );
                });
          } else {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Loading....',
                      style: TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 20,),
                    ),
                    Text(
                      'check your internet connection!....',
                      style: TextStyle(color: Colors.redAccent, fontSize: 10),
                    )
                  ],
                ));
          }
        },

        /*
      ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
              child: FavouriteCard(
                img: ImagesPath.burger,
                itemPrice: itemPrice,
                titleText: "Chickn Burger",
                brandName: "Mcdonald",
              ),
            );
          }),

           */
      ),
    );

  }
}