import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:flutter/material.dart';

import '../model/order_history_model.dart';

class HistoryCard extends StatelessWidget {
  OrderHistoryModel order;

  HistoryCard({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 25,
                    color: kTitleColorBlack,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AutoSizeText(
                    order.customerName!,
                    style: kBold(kTitleColorBlack, 16.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            getTranslated(context, "payment_status").toString(),
                            style: kNormalBlack(blackColor),
                          ),
                          Text(
                            ": ${order.paymentMethod}",
                            style: kNormalBlack(blackColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        "Total Bill: \$${order.totalAmount}",
                        style: kBold(kTitleColorBlack, 14.0),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            getTranslated(context, "delivery_status")
                                .toString(),
                            style: kNormalBlack(blackColor),
                          ),
                          Text(": ${getStatus(order.status)}"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(

                        children: [
                          Text("Date: "),
                          AutoSizeText(
                            order.updatedAt!.split(" ")[0],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getStatus(orderStatus) {
    switch (orderStatus) {
      case 1:
        return "Pending";
      case 2:
        return "Accepted";
      case 3:
        return "Rejected";
      case 4:
        return "On the Way";
      case 5:
        return "Delivered";
      default:
        return "Pending";
    }
  }
}
