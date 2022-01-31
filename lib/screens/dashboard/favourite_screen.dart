import 'package:estore/constants/image_path.dart';
import 'package:estore/widgets/cart_card.dart';
import 'package:estore/widgets/favourite_card.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int itemPrice = 0;
  int totalItems = 0;
  double? subTotal = 0;
  double? disCount = 0;
  double? deliveryCharges = 0;
  double? orderTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, right: 5, left: 5),
                    child: FavouriteCard(
                      img: ImagesPath.burgerMeal,
                      itemPrice: itemPrice,
                      titleText: "Chickn Burger",
                      brandName: "McDonald",
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
