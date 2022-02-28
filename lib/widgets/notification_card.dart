import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';

import '../localization/language_constants.dart';

class NotificationCard extends StatelessWidget {
  bool? fromChatPage;
  String? orderId, created_date,message;

  NotificationCard(
      {Key? key, this.fromChatPage, this.created_date, this.orderId,this.message})
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
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    // color: Colors.blue.shade200,
                    shape: BoxShape.rectangle,
                    // borderRadius: const BorderRadius.only(
                    //   topLeft: Radius.circular(4.0),
                    //   bottomLeft: Radius.circular(4.0),
                    // ),
                    image: DecorationImage(
                        image: ExactAssetImage(ImagesPath.notification),
                        fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ListTile(
                title: AutoSizeText(orderId == null
                    ? "Order Id"
                    : "${getTranslated(context, "order_id").toString()}:${orderId!.toString()}"),
                subtitle: AutoSizeText(created_date!.toString() == null
                    ? "date"
                    : "$message \n${getTranslated(context, "date").toString()}: ${created_date!.toString()}"),
              ),
            ),
            //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
