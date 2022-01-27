import 'package:estore/constants/color.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

  final TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child:  Container(
              margin:  EdgeInsets.symmetric(horizontal: 1.0),
              child:  IconButton(
                onPressed: () {  },
                icon:  const Icon(Icons.face),
                color: kIconColorWhite,
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                maxLines: 2,
                style: const TextStyle(color: blackColor, fontSize: 15.0),
                controller: textEditingController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: blackColor,),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child:  Container(
              margin:  const EdgeInsets.symmetric(horizontal: 8.0),
              child:  IconButton(
                icon:  const Icon(Icons.send),
                onPressed: () => {
                  textEditingController.clear(),
                },
                color: kDeepBlue,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration:  const BoxDecoration(
          border:  Border(
              top:  BorderSide(color: kGrey, width: 0.5)),
          color: Colors.white),
    );
  }
}