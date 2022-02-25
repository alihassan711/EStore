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

class profileCategoriesImage extends StatelessWidget {
  final String img;

  profileCategoriesImage({Key? key, required this.img}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:Container(height: 110,width: 110,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
              fit: BoxFit.fill,
              placeholder:ImagesPath.placeHolder,
              image: img),
        ),
      )
      // CircleAvatar(
      //   child: ClipOval(child: FadeInImage.assetNetwork(
      //     placeholder: ImagesPath.placeHolder, image: img,fit: BoxFit.cover),))
    //  CircleAvatar(radius: 60,
      // backgroundImage: ,
      // height: 60,width: 60,
      // decoration: BoxDecoration(color: kIconColorRed,
      //   borderRadius: BorderRadius.circular(30),
      //   //  shape: BoxShape.circle,
      //     border: Border.all(color: borderColor, width: 0.2)),
  //  ),
    );
  }
}
