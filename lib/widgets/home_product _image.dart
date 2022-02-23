import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../model/all_categories_model.dart';

class HomeCategoriesImage extends StatelessWidget {
  final String img;

  HomeCategoriesImage({Key? key, required this.img}) : super(key: key);
 // final DBInsert _dbInsert = DBInsert();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Get.to(() => const ProductDetailScreen(fromOffer: false),
      //       arguments: [product.id]);
      //   _dbInsert.addProducts(product);
      // },
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: borderColor, width: 0.2)),
          child: FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: ImagesPath.placeHolder,
              image: img),
        ),
      ),
    );
  }
}