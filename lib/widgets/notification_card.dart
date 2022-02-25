import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  bool? fromChatPage;
  String? orderId, created_date;

  NotificationCard(
      {Key? key, this.fromChatPage, this.created_date, this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (fromChatPage!) {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (ctx) => ConversationPage()));
        }
      },
      child: Card(
        elevation: 1,
        //color: Colors.blue.shade100,
        child: Row(
          children: <Widget>[
            Container(
              height: 75,
              width: 70,
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  // color: Colors.blue.shade200,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    bottomLeft: Radius.circular(4.0),
                  ),
                  image: DecorationImage(
                      image: ExactAssetImage(ImagesPath.avatar),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ListTile(
                title: AutoSizeText(orderId == null
                    ? "User Id"
                    : "User Id ${orderId!.toString()}"),
                subtitle: AutoSizeText(created_date!.toString() == null
                    ? "message"
                    : "Created Date ${created_date!.toString()}"),
              ),
            ),
            //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
