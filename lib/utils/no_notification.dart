import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:flutter/material.dart';

class NoNotificationContainer extends StatelessWidget {
  String? icon;
  String? txt,btnText;
  Function()? onPress;

   NoNotificationContainer({this.icon,this.txt,this.onPress,this.btnText,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: MediaQuery.of(context).size.height*0.12,
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: Image.asset(icon!),
            ),
          ),
          SizedBox(height: 12,),
          AutoSizeText(txt!,style: kSemiBold(blackColor),maxLines: 2,),
          SizedBox(height: 12,),
          ElevatedBtn(
            color: kIconColorRed,
            onPress: onPress,
            txtColor: blackColor,
            circularSize: 14.0,
            btnTxtSize: 12,
            text: btnText,
          )
        ],
      ),
    );
  }
}
