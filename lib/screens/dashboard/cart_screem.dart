import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/cart_card.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int itemPrice = 0;
  int totalItems = 0;
  double? subTotal = 0;
  double? disCount = 0;
  double? deliveryCharges = 0;
  double? orderTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 5.0,top: 5.0),
                    child: CartCard(
                      img: ImagesPath.p5,
                      itemPrice: itemPrice,
                      totalItems: totalItems,
                      onPressDecrease: () {
                        setState(() {
                          if(totalItems > 0) {
                            totalItems = totalItems - 1;
                          }
                          else{
                            totalItems = totalItems;
                          }
                        });
                      },
                      onPressIncrease: () {
                          setState(() {
                            totalItems = totalItems + 1;
                        });
                      },
                      orderProceedDate: "5 Aug 2021",
                      titleText: "Chickn Burger",
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: Column(
                children: [
                  _container(getTranslated(context, "sub_total").toString(), subTotal,14.0),
                  _container(getTranslated(context, "discount").toString(), disCount,14.0),
                  _container(getTranslated(context, "delivery_charges").toString(), deliveryCharges,14.0),
                  _container(getTranslated(context, "order_total").toString(), orderTotal,14.0),
                ],
              ),
            ),
          ),
          ElevatedBtn(
            btnHeight: 45,
            btnWidth: 300,
            color: kIconColorRed,
            btnTxtSize: 14,
            text:getTranslated(context, "order_proceed").toString(),
            circularSize: 8,
            txtColor: whiteColor,
            onPress: () {
              setState(() {});
              print("proceed order");
            },
          //  btnWidth: 200,
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }

  Widget _container(titleText, price,textSize,) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: kSemiBold(Colors.black45),
          ),
          Text(
            "\$$price",
            style: kBold(blackColor, textSize),
          ),
        ],
      ),
    );
  }
}
