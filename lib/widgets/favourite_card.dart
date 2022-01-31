import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  String? titleText, img, brandName;
  int? itemPrice;
  Function()? onPress;
  FavouriteCard(
      {this.titleText,
      this.itemPrice,
      this.img,
      this.onPress,
      this.brandName,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: ExactAssetImage(img!), fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  titleText!,
                  style: kBold(blackColor, 13.0),
                ),
                const SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                  brandName!,
                  style: kNormalBlack(blackColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                IconTheme(
                  data: IconThemeData(
                    color: Colors.amber,
                    size: 20,
                  ),
                  child: StarDisplay(value: 3),
                ),
               // StarDisplay(),
                const SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                 "\$$itemPrice",
                  style: kBold(blackColor, 13.0),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  color: Colors.red,
                  icon: const Icon(Icons.favorite),
                  iconSize: 25.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
