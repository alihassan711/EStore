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
        height: 240,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText("2021-02-12",style: kBold(kIconColorRed,20.0),),
                 ListTile(contentPadding: EdgeInsets.zero,
                  title: Text("Payment Status",style: kBold(blackColor,14.0),),
                  leading: const Icon(Icons.payment,size: 30,color: blackColor,),
                   trailing: AutoSizeText("\$1214.00",style: kBold(kIconColorRed, 20.0),),
                ),
                ListTile(contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      Text("Payment Status -Paid",style: kBold(blackColor,14.0),),
                      const SizedBox(width: 12,),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: whiteColor,
                       backgroundImage: ExactAssetImage(ImagesPath.right),
                      ),
                    ],
                  ),
                  leading: const Icon(Icons.calendar_today,size: 30,color: blackColor,),
                ),
                ListTile(contentPadding: EdgeInsets.zero,
                  title: Text("Delivery Status -Order Placed",style: kBold(blackColor,14.0),),
                  leading: const Icon(Icons.add_to_drive,size: 30,color: blackColor,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
