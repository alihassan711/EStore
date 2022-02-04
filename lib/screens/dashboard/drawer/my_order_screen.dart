import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/widgets/orders_card.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);
  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AutoSizeText(
            getTranslated(context, "my_order").toString(),
          style: kBold(kIconColorRed, 20.0),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                    child: OrderCard(
                      img: ImagesPath.p5,
                      price: "150",
                      orderProceedDate: "5 Aug 2021",
                      titleText: "Chickn Burger",
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
