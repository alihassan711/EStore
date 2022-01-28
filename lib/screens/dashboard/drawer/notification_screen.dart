import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/components/my_drawer.dart';
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
  bool isNotifications = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            "Notifications",
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
              onPress: () {},
              color: blackColor,
            ),
          ],
          iconTheme: const IconThemeData(color: blackColor),
        ),
        drawer: MyDrawer(),
        body: isNotifications == false
            ? Center(
                child: NoNotificationContainer(
                onPress: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                icon: ImagesPath.notification,
                btnText: "Go To HomeScreen",
                txt: "Don't have any notifications in the list",
              ))
            : Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.notifications_active_outlined,
                      color: blackColor,
                    ),
                    title: AutoSizeText(
                      "Notifications",
                      style: kBold(blackColor, 16.0),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
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
