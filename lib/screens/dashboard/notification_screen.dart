import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/utils/no_notification.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isNotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:
        AppBar(
          title: AutoSizeText("Notifications",style: kBold(kIconColorRed,20.0),),
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
     body: isNotifications == false ?
     Center(child: NoNotificationContainer(
       onPress: (){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
       },
       icon: ImagesPath.notification,
       btnText: "Go To HomeScreen",
       txt: "Don't have any notifications in the list",
     )):
     Column(
      children:  [
        ListTile(leading: Icon(Icons.notifications_active_outlined),
        title: AutoSizeText("Notifications",style: kBold(blackColor,20.0),),
        ),
        SizedBox(height: 12,),
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, index ){
              return
                Card(
                elevation: 1,
                //color: Colors.blue.shade100,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        // color: Colors.blue.shade200,
                          shape: BoxShape.rectangle,
                          borderRadius:
                          const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            bottomLeft:
                            Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                              image: ExactAssetImage(ImagesPath.accountPicture),
                              fit: BoxFit.cover)),
                      width: 80,
                      height: 73,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ListTile(
                        title: AutoSizeText("Order Assign You"),
                        subtitle: AutoSizeText("2019-12-18"),
                      ),
                    ),
                    //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  ],
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
