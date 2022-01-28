import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
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
        borderRadius: BorderRadius.circular(12),
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
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: ExactAssetImage(img!), fit: BoxFit.fill)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      titleText!,
                      style: kBold(blackColor, 14.0),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      "Order Proceed ${orderProceedDate!}",
                      style: kNormalBlack(
                        blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      "\$$price",
                      style: kBold(kIconColorRed, 16.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedBtn(
                  onPress: onPress,
                  color: kIconColorGreen,
                  txtColor: whiteColor,
                  circularSize: 10,
                  text: "  ReOrder  ",
                  btnTxtSize: 12,
                ),
                ElevatedBtn(
                  onPress: onPress,
                  color: kIconColorBlue,
                  txtColor: whiteColor,
                  circularSize: 10,
                  text: "Rate Order",
                  btnTxtSize: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
