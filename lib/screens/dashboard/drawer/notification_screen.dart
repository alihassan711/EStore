import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/model/notifications_model.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/screens/components/my_drawer.dart';
import '../../../localization/language_constants.dart';
import '../../../utils/no_notification.dart';
import '../../../widgets/iconbtn.dart';
import '../../../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ApiServices _apiServices = ApiServices();
  ApiServices _repository = ApiServices();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategories();
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
                            index: 1,
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
                            index: 3,
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
      body: globalNotificationModel.length == 0
          ? Column(
          children: [
            Expanded(child: SizedBox()),
            Expanded(
              child: NoNotificationContainer(
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider(
                              create: (BuildContext context) =>
                                  CategoryCubit(repository: _apiServices),
                              child: MainScreen(
                                index: 0,
                                // form: args.toString(),
                              ))));
                },
                icon: ImagesPath.notification,
                btnText:  getTranslated(context, "continue_shopping").toString(),
                txt: getTranslated(context, "no_noti").toString(),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
            )
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
                        String date = users[index].createdAt.toString();
                        final dateList = date.split(" ");
                        final createddate = dateList[0];
                        print("split " + dateList[0]);
                        return Padding(
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 2.0, right: 10.0, left: 10.0),
                            child: NotificationCard(
                              fromChatPage: true,
                              created_date: createddate.toString(),
                              orderId: users[index].orderId.toString(),
                            ));
                      });
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Loading....',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                        ),
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
