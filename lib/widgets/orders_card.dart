import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  String? titleText, orderProceedDate, price, img;
  Function()? onPress;
  OrderCard(
      {this.titleText,
      this.orderProceedDate,
      this.price,
      this.img,
      this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
          ),
          BoxShadow(
            color: whiteColor,
            spreadRadius: 7.0,
            blurRadius: 10.0,
          ),
        ],
      ),
      // height: 240,
      width: MediaQuery.of(context).size.width,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                child: Container(
                  height: 90,width: 90,
                  decoration: BoxDecoration(
                      color: blackColor,
                      shape: BoxShape.rectangle,
                      borderRadius:  BorderRadius.circular(
                       10.0
                       // bottomLeft: Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                          image: ExactAssetImage(img!), fit: BoxFit.fill)),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    titleText!,
                    style: kBold(blackColor, 13.0),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AutoSizeText(
    getTranslated(context, "order_proceed").toString(),
                    style: kNormalBlack(
                      blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AutoSizeText(
                    "\$$price",
                    style: kBold(kIconColorRed, 14.0),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedBtn(
                onPress: onPress,
                color: kIconColorGreen,
                txtColor: whiteColor,
                circularSize: 5,
                text: getTranslated(context, "re_order").toString(),
                btnTxtSize: 12,
                btnWidth: 140,

              ),
              ElevatedBtn(
                onPress: onPress,
                color: kIconColorBlue,
                txtColor: whiteColor,
                circularSize: 5,
                text: getTranslated(context, "rate_order").toString(),
                btnTxtSize: 12,
                btnWidth: 140,
              ),
            ],
          ),
         const SizedBox(height: 5.0,),
        ],
      ),
    );
  }
}
