// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:estore/constants/color.dart';
// import 'package:estore/constants/image_path.dart';
// import 'package:estore/constants/text_style.dart';
// import 'package:estore/screens/dashboard/chat_screens/conversation_page.dart';
// import 'package:estore/utils/no_notification.dart';
// import 'package:estore/utils/urls.dart';
// import 'package:estore/widgets/notification_card.dart';
// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   bool isNotifications = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: AutoSizeText(
//         //     "Messages",
//         //     style: kBold(kIconColorRed, 20.0),
//         //   ),
//         //   centerTitle: true,
//         //   backgroundColor: Colors.transparent,
//         //   elevation: 0.0,
//         //   actions: [
//         //     IconBtn(
//         //       icon: const Icon(
//         //         Icons.message,
//         //         color: blackColor,
//         //       ),
//         //       onPress: () {},
//         //       color: blackColor,
//         //     ),
//         //   ],
//         //   iconTheme: const IconThemeData(color: blackColor),
//         // ),
//       //  drawer: MyDrawer(),
//         body: globalNotificationModel.length == 0
//             ? Center(
//                 child: NoNotificationContainer(
//                 onPress: () {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ConversationPage()));
//                 },
//                 icon: ImagesPath.notification,
//                 btnText: "Go To HomeScreen",
//                 txt: "Don't have any notifications in the list",
//               ))
//             : Column(
//                 children: [
//                   // ListTile(
//                   //   leading: Icon(
//                   //     Icons.notifications_active_outlined,
//                   //     color: blackColor,
//                   //   ),
//                   //   title: AutoSizeText(
//                   //     "Messages",
//                   //     style: kBold(blackColor, 16.0),
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: 12,
//                       itemBuilder: (BuildContext context, index) {
//                         return NotificationCard(fromChatPage: true,created_date: users[index].createdAt.toString(),orderId:  users[index].orderId.toString(),);
//                       },
//                     ),
//                   )
//                 ],
//               ));
//   }
// }
