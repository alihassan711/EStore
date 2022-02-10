import 'package:estore/constants/color.dart';
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  String lable;

  Function()? onTap;

  MyButton({required this.lable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: MaterialButton(
          onPressed: onTap,
          // onPressed: () => Navigator.pushNamed(context, rout),
          //since this is only a UI app
          child: Text(
            lable,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'SFUIDisplay',
              fontWeight: FontWeight.bold,
            ),
          ),
          color: kIconColorGreen,
          elevation: 0,
          minWidth: 400,
          height: 50,
          textColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}