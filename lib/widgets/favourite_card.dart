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
        borderRadius: BorderRadius.circular(5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 75, width: 70,
            // height: MediaQuery.of(context).size.height * 0.125,
            // width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
                image: DecorationImage(
                    image: NetworkImage(img!), fit: BoxFit.fill)),
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.0,
              ),
              Text(
                titleText!,
                style: kBold(blackColor, 12.0),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                brandName!,
                style: kBold(kGrey, 10.0),
              ),
              const SizedBox(
                height: 2,
              ),
              const IconTheme(
                data: IconThemeData(
                  color: Colors.amber,
                  size: 14,
                ),
                child: StarDisplay(value: 3),
              ),
              // StarDisplay(),
              const SizedBox(
                height: 2,
              ),
              Text(
                "\$$itemPrice",
                style: kBold(blackColor, 13.0),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: onPress,
                color: Colors.red,
                icon: const Icon(
                  Icons.favorite,
                  color: kIconColorRed,
                ),
                iconSize: 25.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
