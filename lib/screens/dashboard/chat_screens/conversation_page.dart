import 'package:flutter/material.dart';
import 'chat_appBar.dart';
import 'chat_list_widget.dart';
import 'input_widget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: ChatAppBar(),
          ),
        ),
        //ChatAppBar(), // Custom app bar for chat screen
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              ChatListWidget(), //Chat list
              InputWidget() // The input widget
            ],
          ),
        ]));
  }
}
