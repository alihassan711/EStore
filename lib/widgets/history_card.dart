import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  String? name,createddate,price;
   HistoryCard({this.name,this.createddate,this.price,Key? key}) : super(key: key);

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
              // Padding(
              //   padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              //   child: AutoSizeText(
              //     createddate!,
              //     style: kBold(kIconColorRed, 14.0),
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 28,
                    color: blackColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AutoSizeText(
                    name!,
                    style: kBold(blackColor, 12.0),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    "\$$price",
                    style: kBold(blackColor, 14.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: blackColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    getTranslated(context, "payment_status").toString(),
                    style:kNormalBlack(blackColor),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    radius: 8.0,
                    backgroundColor: whiteColor,
                    backgroundImage: ExactAssetImage(ImagesPath.right),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.add_to_drive,
                    size: 20,
                    color: blackColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  AutoSizeText(
                    getTranslated(context, "delivery_status").toString(),
                    style: kNormalBlack(blackColor),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    createddate!,
                    style: kBold(kIconColorRed, 14.0),
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
