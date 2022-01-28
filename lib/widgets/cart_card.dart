import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  String? titleText, orderProceedDate, img;
  int? itemPrice, totalItems;
  Function()? onPress;
  Function()? onPressIncrease;
  Function()? onPressDecrease;
  CartCard(
      {this.titleText,
      this.orderProceedDate,
      this.itemPrice,
      this.totalItems,
      this.img,
      this.onPress,
      this.onPressIncrease,
      this.onPressDecrease,
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
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.23,
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
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        children: [
                          AutoSizeText(
                            "\$$itemPrice",
                            style: kBold(kIconColorRed, 16.0),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          GestureDetector(
                            onTap: onPressDecrease,
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    color: kIconColorRed,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.remove,
                                  color: whiteColor,
                                  size: 25,
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AutoSizeText(
                            totalItems!.toString(),
                            style: kBold(blackColor, 16.0),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: onPressIncrease,
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    color: kIconColorGreen,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
