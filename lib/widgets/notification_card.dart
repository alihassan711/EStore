import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/screens/dashboard/chat_screens/conversation_page.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  bool fromChatPage;
  NotificationCard({Key? key, required this.fromChatPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: () {
          if (fromChatPage) {
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
                height: 75,width: 70,
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    // color: Colors.blue.shade200,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    ),
                    image: DecorationImage(
                        image: ExactAssetImage(ImagesPath.accountPicture),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: ListTile(
                  title: AutoSizeText("Order Assign You"),
                  subtitle: AutoSizeText("2019-12-18"),
                ),
              ),
              //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
