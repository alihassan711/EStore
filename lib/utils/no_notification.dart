import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:flutter/material.dart';

class NoNotificationContainer extends StatelessWidget {
  String? icon;
  String? txt, btnText;
  Function()? onPress;

  NoNotificationContainer(
      {this.icon, this.txt, this.onPress, this.btnText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height:100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(icon!), fit: BoxFit.fill)),
            // backgroundColor: whiteColor,
            // height,: MediaQuery.of(context).size.height * 0.12,
            //  child: SizedBox(
            //    height: MediaQuery.of(context).size.height * 0.9,
            //   // child: Image.asset(icon!,fit: BoxFit.fill,),
            //  ),
          ),
          const SizedBox(
              height: 8,
              ),
          AutoSizeText(
            txt!,
            style: kSemiBold(blackColor),
            maxLines: 2,
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedBtn(
            color: kIconColorGreen,
            onPress: onPress,
            txtColor: blackColor,
            circularSize: 10.0,
            btnTxtSize: 12,
            text: btnText,
            btnWidth: 200,
          )
        ],
      ),
    );
  }
}
