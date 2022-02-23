import 'package:badges/badges.dart';
import 'package:estore/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartWidget extends StatefulWidget {
  Function()? onPress;

  ShoppingCartWidget({this.onPress, Key? key}) : super(key: key);

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  @override
  void didChangeDependencies() {
    // Provider.of<>(context)
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {

        return Badge(
          position: BadgePosition.topEnd(
              top: MediaQuery.of(context).size.height * 0.01,
              end: MediaQuery.of(context).size.height * 0.01),
          animationDuration: const Duration(milliseconds: 300),
          animationType: BadgeAnimationType.scale,
          badgeContent: Text(
            cart.basketItems.length.toString(),
            //  _counter.toString(),
            style: const TextStyle(fontSize: 8, color: Colors.white),
          ),
          child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 22,
              ),
              onPressed: widget.onPress),
        );
      },
    );
  }
}
