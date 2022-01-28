import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
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
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, right: 5, left: 5),
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
            flex: 2,
            child: Column(
              children: [
                _container("SubTotal", subTotal),
                _container("DisCount", disCount),
                _container("Delivery Charges", deliveryCharges),
                _container("Order Total", orderTotal),
              ],
            ),
          ),
          ElevatedBtn(
            color: kIconColorRed,
            btnTxtSize: 14,
            text: "Proceed To Cart <Out>",
            circularSize: 12,
            txtColor: whiteColor,
            onPress: () {
              setState(() {});
              print("proceed order");
            },
            btnWidth: 300,
          ),
        ],
      ),
    );
  }

  Widget _container(titleText, price) {
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
            style: kBold(blackColor, 14.0),
          ),
        ],
      ),
    );
  }
}
