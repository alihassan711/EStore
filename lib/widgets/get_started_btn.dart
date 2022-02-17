import 'dart:ui';

import 'package:flutter/material.dart';

class GetStartedBtn extends StatelessWidget {
  VoidCallback onPress;
  String text;
  Color btnColor;
  TextStyle textStyle;

  double width, height, borderRadius;

  GetStartedBtn(
      {Key? key,
        required this.onPress,
        required this.textStyle,
        required this.height,
        required this.width,
        required this.borderRadius,
        required this.btnColor,
        required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(child: Text(text, style: textStyle)),
      ),
    );
  }
}