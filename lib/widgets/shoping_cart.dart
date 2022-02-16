import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ShoppingCartWidget extends StatelessWidget {
  var item;
  Function()? onPress;
   ShoppingCartWidget({this.item,this.onPress,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Badge(
        position: BadgePosition.topEnd(top: -2, end: 4),
        animationDuration: const Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Text(
          item,
          //  _counter.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 22,
            ),
            onPressed: onPress),
      );
  }
}
