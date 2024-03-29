import 'package:flutter/material.dart';

import 'chat_item_widget.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();

  ChatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        child: ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) => ChatItemWidget(index),
      itemCount: 20,
      reverse: true,
      controller: listScrollController,
    ));
  }
}
