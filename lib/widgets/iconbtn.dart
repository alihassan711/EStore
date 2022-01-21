import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  Function()? onPress;
  Color? color;
  Icon? icon;
  double? iconSize;

  IconBtn({this.onPress,this.color,this.icon,});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPress,
        icon: icon!,
    );
  }
}