import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              blurRadius: 10.0,
            ),
          ],
        ),
        // height: 240,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "2021-02-12",
                style: kBold(kIconColorRed, 16.0),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.add_to_drive,
                    size: 25,
                    color: blackColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AutoSizeText(
                    "12-02-2022",
                    style: kBold(blackColor, 12.0),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "\$7214.00",
                    style: kBold(kIconColorRed, 16.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 25,
                    color: blackColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Payment Status -Paid",
                    style: kBold(blackColor, 12.0),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: whiteColor,
                    backgroundImage: ExactAssetImage(ImagesPath.right),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.add_to_drive,
                    size: 25,
                    color: blackColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AutoSizeText(
                    "Delivery Status -Order Placed",
                    style: kBold(blackColor, 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
