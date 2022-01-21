import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  String? text;
  Function()? onPress;
  Color? color;
  double? circularSize;
  Color? txtColor;
  double? btnTxtSize;

  ElevatedBtn({this.text, this.onPress,this.color,this.circularSize,this.txtColor,this.btnTxtSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
            style:TextStyle(fontSize: 16,color: Colors.white),
          ),
        ));
  }
}