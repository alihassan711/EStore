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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                 "${ getTranslated(context, "order").toString()}#: ${order.id!}",
                style: kBold(kTitleColorBlack, 16.0),
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
                        "${getTranslated(context, "order_total").toString()} \$${order.totalAmount}",
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
                          Text(": ${getStatus(order.status,context)}"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(

                        children: [
                          Text(getTranslated(context, "date").toString()),
                          AutoSizeText(
                            ": ${order.updatedAt!.split(" ")[0]}",
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

  String getStatus(orderStatus,context) {
    switch (orderStatus) {
      case 1:
        return getTranslated(context, "pending").toString();
      case 2:
        return getTranslated(context, "accepted").toString();
      case 3:
        return getTranslated(context, "rejected").toString();
      case 4:
        return getTranslated(context, "on the Way").toString();
      case 5:
        return getTranslated(context, "delivered").toString();
      default:
        return getTranslated(context, "pending").toString();
    }
  }
}
