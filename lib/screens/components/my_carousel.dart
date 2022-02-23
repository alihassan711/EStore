import 'package:carousel_slider/carousel_slider.dart';
import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({Key? key}) : super(key: key);

  Widget carouselContainer(img) {
    return Container(
      //margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: ExactAssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        carouselContainer(ImagesPath.p2),
        carouselContainer(ImagesPath.p3),
        carouselContainer(ImagesPath.p5),
        carouselContainer(ImagesPath.p2),
        carouselContainer(ImagesPath.p5)
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
    );
  }
}
