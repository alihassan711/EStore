import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  Function()? onPress;
  Color? color;
  Icon? icon;
  double? iconSize;

  IconBtn({
    Key? key,
    this.onPress,
    this.color,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: icon!,
    );
  }
}
