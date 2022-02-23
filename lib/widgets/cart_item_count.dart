import 'package:estore/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/text_style.dart';

class CartCountWidget extends StatefulWidget {
  @override
  _CartCountWidgetState createState() => _CartCountWidgetState();
}

class _CartCountWidgetState extends State<CartCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Text(
          cart.basketItems.length.toString(),
          style: kBold(blackColor, 14.0),
        );
      },
    );
  }
}
