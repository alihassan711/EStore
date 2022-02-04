import 'package:estore/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  String? text;
  Function()? onPress;
  Color? color;
  double? circularSize;
  Color? txtColor;
  double? btnTxtSize, btnWidth, btnHeight;

  ElevatedBtn(
      {Key? key,
      this.text,
      this.onPress,
      this.color,
      this.circularSize,
      this.txtColor,
      this.btnTxtSize,
      this.btnHeight,
      this.btnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circularSize!),
              ))),
          onPressed: onPress,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text!,
              style: const TextStyle(fontSize: 14.0, color: whiteColor),
            ),
          )),
    );
  }
}
