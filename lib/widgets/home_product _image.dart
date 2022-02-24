import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';

class HomeCategoriesImage extends StatelessWidget {
  final String img;

  HomeCategoriesImage({Key? key, required this.img}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AspectRatio(
        aspectRatio: 1.0,
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
