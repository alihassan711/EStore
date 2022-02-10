import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  String? titleText, orderProceedDate, img;
  int? itemPrice, quantity;
  Function()? onPress;
  Function()? onPressIncrease;
  Function()? onPressDecrease;
  CartCard(
      {this.titleText,
      this.orderProceedDate,
      this.itemPrice,
      this.quantity,
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
            blurRadius: 8.0,
          ),
        ],
      ),
      // height: 240,
      width: MediaQuery.of(context).size.width,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 75,width: 70,
                decoration: BoxDecoration(
                    color: blackColor,
                    shape: BoxShape.rectangle,
                    borderRadius:
                    const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft:
                      Radius.circular(4.0),
                    ),
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
                    style: kBold(blackColor, 13.0),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.66,
                    child: Row(
                      children: [
                        AutoSizeText(
                          "\$$itemPrice",
                          style: kBold(kIconColorRed, 14.0),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: onPressDecrease,
                          child: Container(
                              height: 17,
                              width: 17,
                              decoration: const BoxDecoration(
                                  color: kIconColorRed,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.remove,
                                color: whiteColor,
                                size: 14,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(
                          quantity!.toString(),
                          style: kBold(blackColor, 16.0),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: onPressIncrease,
                          child: Container(
                              height: 17,
                              width: 17,
                              decoration: const BoxDecoration(
                                  color: kIconColorGreen,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.add,size: 14,
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
    );
  }
}
